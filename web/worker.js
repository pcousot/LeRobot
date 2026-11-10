// worker.js -- runs LeRobot (the Python library of ../LeRobot_Python_EN) in
// Pyodide, in a Web Worker, so that a program can wait for a key or a touch
// without freezing the page. The page and the worker share memory
// (SharedArrayBuffer): the page writes the events (keys, touches) there, the
// worker reads them, and Atomics.wait lets Python sleep. The worker sends the
// picture, the texts and the robot to the page with postMessage.

const PYODIDE = "https://cdn.jsdelivr.net/pyodide/v0.26.4/full/";
importScripts(PYODIDE + "pyodide.js");

const LIB = "../LeRobot_Python_EN/";
const MODULES = ["Dessin", "Draw", "Ecriture", "Graph", "Grille", "Interaction",
  "LeRobot", "LeRobotFR", "LibRobot", "LibRobotFR", "Peinture", "Principal",
  "Robot", "Son", "Utile", "noms"];

let pyodide = null;
let ev = null;          // Int32Array: [0] = number of events written by the page
let lu = 0;             // events already read
const N = 512;          // events kept in the ring
let dort = null;        // Int32Array used only to sleep
let mesure = null;      // canvas to measure texts

const lrjs = {
  open(w, h, titre) { postMessage({ type: "open", w, h, titre }); },
  close() { postMessage({ type: "close" }); },
  title(t) { postMessage({ type: "title", titre: t }); },
  frame(x, y, w, h, octets) {
    const rgb = octets.toJs(); octets.destroy();
    postMessage({ type: "frame", x, y, w, h, rgb }, [rgb.buffer]);
  },
  overlay(json) { postMessage({ type: "overlay", json }); },
  icon(id, w, h, json) { postMessage({ type: "icon", id, w, h, json }); },
  poll() {
    const ecrit = Atomics.load(ev, 0);
    const res = [];
    if (ecrit - lu > N) lu = ecrit - N;
    while (lu < ecrit) {
      const k = 4 + (lu % N) * 4;
      res.push([ev[k], ev[k + 1], ev[k + 2], ev[k + 3]]);
      lu++;
    }
    return res;
  },
  sleep(ms) { if (ms > 0) Atomics.wait(dort, 0, 0, ms); },
  measure(s) {
    if (!mesure) {
      mesure = new OffscreenCanvas(1, 1).getContext("2d");
      mesure.font = "13px Helvetica, Arial, sans-serif";
    }
    return Math.ceil(mesure.measureText(s).width);
  },
  beep() { postMessage({ type: "beep" }); },
  tone(f, d, v) { postMessage({ type: "tone", f, d, v }); },
};

async function demarrer(msg) {
  ev = new Int32Array(msg.events);
  dort = new Int32Array(new SharedArrayBuffer(4));
  pyodide = await loadPyodide({ indexURL: PYODIDE });
  pyodide.setInterruptBuffer(new Uint8Array(msg.interrupt));
  pyodide.setStdout({ batched: (s) => postMessage({ type: "out", s }) });
  pyodide.setStderr({ batched: (s) => postMessage({ type: "err", s }) });
  // no terminal: questions are answered in the robot's window
  pyodide.setStdin({ stdin: () => null });
  pyodide.registerJsModule("lrjs", lrjs);
  pyodide.FS.mkdirTree("/lerobot");
  pyodide.FS.mkdirTree("/home/pyodide/work");
  for (const m of MODULES) {
    const r = await fetch(LIB + m + ".py");
    pyodide.FS.writeFile("/lerobot/" + m + ".py", await r.text());
  }
  // Graphics.py without its tkinter part, followed by graphics_web.py
  let g = await (await fetch(LIB + "Graphics.py")).text();
  const debut = g.indexOf("if not _tk_correct():");
  const fin = g.indexOf("import tkinter.font");
  g = g.slice(0, debut) + g.slice(g.indexOf("\n", fin) + 1);
  g += "\n" + await (await fetch("graphics_web.py")).text();
  pyodide.FS.writeFile("/lerobot/Graphics.py", g);
  pyodide.runPython(`
import sys, time, lrjs, importlib.abc, importlib.machinery
sys.path.insert(0, "/lerobot")
time.sleep = lambda s: lrjs.sleep(s * 1000)

# sounds: when Son and LibRobotFR are loaded, their sounds go to the page
def _sons(nom, module):
    if nom == "Son":
        module.bipbip = lambda: lrjs.beep()
    elif nom == "LibRobotFR":
        attendre = module._attendre
        def jouer(f, d, v):
            if d > 0:
                lrjs.tone(f, d, v)
                attendre(d)
        module._jouer_son = jouer

class _Sons(importlib.abc.MetaPathFinder):
    def find_spec(self, nom, chemin, cible=None):
        if nom not in ("Son", "LibRobotFR"):
            return None
        spec = importlib.machinery.PathFinder.find_spec(nom, chemin)
        executer = spec.loader.exec_module
        def exec_module(module):
            executer(module)
            _sons(nom, module)
        spec.loader.exec_module = exec_module
        return spec

sys.meta_path.insert(0, _Sons())
`);
  postMessage({ type: "ready" });
}

const LANCER = `
import sys, os, runpy, traceback
for m in list(sys.modules):
    if m in ${JSON.stringify(MODULES.concat(["Graphics"]))}:
        del sys.modules[m]
os.environ["LEROBOT_MUET"] = "1"
_chemin = "/home/pyodide/work/" + _nom
os.chdir("/home/pyodide/work")
sys.argv = [_chemin]
try:
    runpy.run_path(_chemin, run_name="__main__")
except SystemExit:
    pass
except KeyboardInterrupt:
    print("\\n(stopped)")
except BaseException:
    if sys.excepthook is not sys.__excepthook__:
        sys.excepthook(*sys.exc_info())
    else:
        traceback.print_exc()
finally:
    try:
        import Graphics
        if Graphics.est_ouverte():
            Graphics.synchronize()
    except Exception:
        pass
`;

function lancer(msg) {
  lu = Atomics.load(ev, 0);       // keys pressed before the run are ignored
  try {
    try { pyodide.FS.unlink("/home/pyodide/work/my_drawing.py"); } catch (e) {}
    pyodide.FS.writeFile("/home/pyodide/work/" + msg.nom, msg.code);
    pyodide.globals.set("_nom", msg.nom);
    pyodide.runPython(LANCER);
  } catch (e) {
    postMessage({ type: "err", s: String(e) });
  }
  let dessin = null;
  try { dessin = pyodide.FS.readFile("/home/pyodide/work/my_drawing.py", { encoding: "utf8" }); } catch (e) {}
  postMessage({ type: "end", dessin });
}

onmessage = (e) => {
  if (e.data.type === "start") demarrer(e.data).catch((err) => postMessage({ type: "err", s: String(err) }));
  else if (e.data.type === "run") lancer(e.data);
};
