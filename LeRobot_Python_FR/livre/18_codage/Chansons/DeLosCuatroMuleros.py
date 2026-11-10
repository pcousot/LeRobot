from LibRobot import *

# Jouer "De los cuatro muleros"
def melodie():
    # andalouse
    metronome(adagio)
    nuance(mezza_voce)
    for i in range(2):
        note(fa, double_croche)  # De
        note(fa, double_croche)  # los
        note(d0, double_croche)  # cua-
        note(fa, double_croche)  # -tro
        note(sol, croche)  # mu-
        note(la, croche)  # -le-
        note(la, noire)  # -ros,
    note(sol, double_croche)  # De
    note(la, double_croche)  # los
    note(si + bemol, double_croche)  # cua-
    note(octave + re, double_croche)  # -tro
    note(octave + d0, croche)  # mu-
    note(la, double_croche)  # -le-
    note(sol, double_croche)  # -ros,
    note(la, double_croche)  # Ma-
    note(octave + d0, double_croche)  # -mi-
    note(si + bemol, croche)  # -ta
    note(la, double_croche)  # mi-
    note(fa, double_croche)  # -a,
    note(sol, double_croche)  # Que
    note(la, double_croche)  # van
    note(sol, croche)  # al
    note(sol, double_croche)  # a-
    note(fa, double_croche)  # -gua,
    note(sol, double_croche)  # Que
    note(la, double_croche)  # van
    note(sol, croche)  # al
    note(sol, croche)  # a-
    note(fa, noire)  # -gua.

melodie()
