from LibRobot import *

# Play "De los cuatro muleros"
def melody():
    # Andalusian song
    metronome(adagio)
    dynamics(mezza_voce)
    for i in range(2):
        note(F, sixteenth)  # De
        note(F, sixteenth)  # los
        note(C, sixteenth)  # cua-
        note(F, sixteenth)  # -tro
        note(G, eighth)  # mu-
        note(A, eighth)  # -le-
        note(A, quarter)  # -ros,
    note(G, sixteenth)  # De
    note(A, sixteenth)  # los
    note(B + flat, sixteenth)  # cua-
    note(octave + D, sixteenth)  # -tro
    note(octave + C, eighth)  # mu-
    note(A, sixteenth)  # -le-
    note(G, sixteenth)  # -ros,
    note(A, sixteenth)  # Ma-
    note(octave + C, sixteenth)  # -mi-
    note(B + flat, eighth)  # -ta
    note(A, sixteenth)  # mi-
    note(F, sixteenth)  # -a,
    note(G, sixteenth)  # Que
    note(A, sixteenth)  # van
    note(G, eighth)  # al
    note(G, sixteenth)  # a-
    note(F, sixteenth)  # -gua,
    note(G, sixteenth)  # Que
    note(A, sixteenth)  # van
    note(G, eighth)  # al
    note(G, eighth)  # a-
    note(F, quarter)  # -gua.

melody()
