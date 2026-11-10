# LeRobot in the browser (iPad, tablets, computers)

<https://pcousot.github.io/LeRobot/web/> runs the robot with English
command names (`../LeRobot_Python_EN`) in the browser, without installing
anything: choose a program of the book, edit it, press Run; or press Draw
for interactive drawing, with the on-screen keys or a keyboard. Touching
the grid moves the robot, as a click does on a Mac.

How it works:

- `worker.js` runs Python in the browser with Pyodide (Python compiled to
  WebAssembly), in a Web Worker, and loads the library from
  `../LeRobot_Python_EN`. The only module replaced is the drawing:
  `Graphics.py` is loaded without its tkinter part and completed by
  `graphics_web.py`, which sends the picture, the texts and the robot to
  the page.
- Keys and touches reach the worker through shared memory
  (SharedArrayBuffer), so that a program can wait for a key exactly as on
  a Mac. This needs a "cross-origin isolated" page: `sw.js` (a service
  worker) adds the needed headers on GitHub Pages.
- `index.html`: the page (robot window, keys, editor, console);
  `programs.json`: the list of programs, made by `make_programs.py`.
- Locally: `python3 web/serve.py` then <http://localhost:8765/web/>.

Sounds are played by the browser; the first touch of the page enables them.
