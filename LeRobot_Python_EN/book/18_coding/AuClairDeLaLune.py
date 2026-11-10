from LibRobot import *

# Au clair de la lune (song attributed to
# Jean-Baptiste Lulli)
def stanza():
    metronome(moderato)  # time 4 / 4
    dynamics(piano)
    for i in range(2):
        note(G, quarter); note(G, quarter)  # Au clair/Prê-te
        note(G, quarter); note(A, quarter)  # de la/moi ta
        note(B, half); note(A, half)  # lu-ne/plu-me
        note(G, quarter); note(B, quarter)  # Mon a-/Pour é-
        note(A, quarter)
        note(A, quarter)  # -mi Pier-/-crire un
        note(G, whole)  # -rot./mot.
    note(A, quarter); note(A, quarter)  # Ma chan-
    note(A, quarter); note(A, quarter)  # -delle est
    note(E, half); note(E, half)  # mor-te.
    note(A, quarter); note(G, quarter)  # Je n'ai
    note(F + sharp, quarter); note(E, quarter)  # plus de
    note(D, whole)  # feu.
    note(G, quarter); note(G, quarter)  # Ou-vre
    note(G, quarter); note(A, quarter)  # moi ta
    note(B, half); note(A, half)  # por-te,
    note(G, quarter); note(B, quarter)  # Pour l'a-
    note(A, quarter); note(A, quarter)  # -mour de
    note(G, whole)  # Dieu.
    rest(whole_rest)

def song():
    for j in range(3):
        stanza()

song()
