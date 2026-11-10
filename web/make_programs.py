#!/usr/bin/env python3
"""make_programs.py -- writes programs.json, the list of programs shown by
index.html: Draw, my_drawing, then the programs of the book
(../LeRobot_Python_EN/book), chapter by chapter."""
import json, os
ici = os.path.dirname(os.path.abspath(__file__))
lib = os.path.join(os.path.dirname(ici), "LeRobot_Python_EN")
liste = [{"group": "LeRobot", "name": "my_drawing", "path": "my_drawing.py"}]
for d, _, fs in sorted(os.walk(os.path.join(lib, "book"))):
    for f in sorted(fs):
        if f.endswith(".py"):
            rel = os.path.relpath(os.path.join(d, f), lib)
            groupe = os.path.relpath(d, os.path.join(lib, "book"))
            liste.append({"group": groupe, "name": f[:-3], "path": rel})
json.dump(liste, open(os.path.join(ici, "programs.json"), "w"), indent=0)
print(len(liste), "programs")
