"""Son -- le « bip-bip » de protestation du robot quand on veut le faire
sortir du cadre (Dessiner, interactionTP).

Le son (deux bips de 880 Hz, comme bip() de LibRobot) est engendre une fois
dans un fichier WAV temporaire et joue par afplay (macOS), sans attendre :
le dessin continue pendant le son. LEROBOT_MUET=1 coupe le son ; sans
afplay, on fait sonner la cloche de la fenetre.
"""
import atexit
import math
import os
import struct
import subprocess
import tempfile

_fichier = None
_joueur = None


def _wav():
    global _fichier
    if _fichier is None:
        taux = 22050
        ech = []

        def bip(duree):
            n = int(duree * taux)
            att = taux * 0.01
            for i in range(n):
                env = min(1., i / att, (n - i) / att)
                ech.append(int(0.5 * env * math.sin(2 * math.pi * 880 * i / taux) * 32000))

        bip(0.12)
        ech.extend([0] * int(0.08 * taux))
        bip(0.12)
        import wave
        fd, _fichier = tempfile.mkstemp(prefix="lerobot-bipbip", suffix=".wav")
        os.close(fd)
        with wave.open(_fichier, "wb") as w:
            w.setnchannels(1)
            w.setsampwidth(2)
            w.setframerate(taux)
            w.writeframes(struct.pack("<%dh" % len(ech), *ech))
        atexit.register(lambda: os.path.exists(_fichier) and os.remove(_fichier))
    return _fichier


def bipbip():
    """bip-bip : le robot proteste"""
    global _joueur
    if os.environ.get("LEROBOT_MUET"):
        return
    if os.path.exists("/usr/bin/afplay"):
        if _joueur is not None and _joueur.poll() is None:
            return              # le bip-bip precedent n'est pas fini
        _joueur = subprocess.Popen(["/usr/bin/afplay", _wav()],
                                   stdin=subprocess.DEVNULL,
                                   stdout=subprocess.DEVNULL,
                                   stderr=subprocess.DEVNULL)
    else:
        try:
            import Graphics
            Graphics._root.bell()
        except Exception:
            pass
