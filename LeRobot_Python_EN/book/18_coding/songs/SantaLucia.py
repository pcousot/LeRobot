from LibRobot import *

# Play "Santa Lucia"
def melody():
    # Neapolitan song
    dynamics(mezza_voce)
    metronome(andante)
    note(F, quarter)  # Sul-
    note(F, quarter)  # ma-
    note(B + flat, quarter)  # -re
    note(B + flat, dotted_eighth)  # luc-
    note(A, sixteenth)  # -ci-
    note(A, half)  # -ca
    note(E + flat, quarter)  # l'as-
    note(E + flat, quarter)  # -tro
    note(G, quarter)  # d'ar-
    note(G, dotted_eighth)  # -gen-
    note(F, sixteenth)  # -
    note(F, half)  # -to
    note(D, quarter)  # Pla-
    note(G, quarter)  # -ci-
    note(F, quarter)  # -da
    note(F, eighth)  # è
    note(E + natural, eighth)  # l'on-
    note(E + flat, half)  # -da
    note(E + flat, quarter)  # pros-
    note(D, quarter)  # -pero
    note(C, quarter)  # il
    note(G, quarter)  # ven-
    note(F, half)  # -to.
    note(D + octave, quarter)  # Ven—
    note(C + octave, quarter)  # -nite
    note(B + flat, quarter)  # all'
    note(A, dotted_eighth)  # a-
    note(G, sixteenth)  # -gi-
    note(C + octave, half)  # -le
    note(C + octave, quarter)  # bar-
    note(B + flat, quarter)  # -chet-
    note(G, quarter)  # -ta
    note(E, eighth)  # mi-
    note(F, eighth)  # -
    note(B + flat, half)  # -a
    note(D + octave, eighth)  # San-
    note(B + flat, eighth)  # -
    note(B + flat, eighth)  # -ta
    note(F, eighth)  # -
    note(F, eighth)  # Lu-
    note(D, eighth)  # -
    note(E + flat, eighth)  # ci-
    note(C + octave, eighth)  # -
    note(C + octave, half)  # -a
    note(C + octave, quarter)  # San-
    note(D + octave, dotted_quarter)  # - ta
    note(C + octave, eighth)  # Lu-
    note(C + octave, quarter)  # -ci-
    note(B + flat, half)  # -a

melody()
