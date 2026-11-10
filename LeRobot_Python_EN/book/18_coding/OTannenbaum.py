from LibRobot import *

# O Tannenbaum (German song)
def chorus():
    note(C, quarter)  # O
    note(F, dotted_eighth); note(F, sixteenth)
    # Tan-nen-
    note(F, quarter)  # -baum,
    note(G, quarter)  # o
    note(A, dotted_eighth); note(A, sixteenth)
    # Tan-nen-
    note(A, dotted_quarter)  # -baum,
    note(F, eighth); note(G, eighth)  # wie treu
    note(A, eighth); note(B + flat, quarter)  # sind dei-
    note(E, quarter)  # -ne
    note(G, quarter); note(F, quarter)  # Blät-ter !

def verse():
    rest(eighth_rest)
    note(C + octave, eighth)  # Du
    note(C + octave, eighth); note(A, eighth)
    # grünst nicht
    note(D + octave, dotted_quarter)  # nur
    note(C + octave, eighth); note(C + octave, eighth)
    # zur Som-
    note(B + flat, eighth)  # -mer-
    note(B + flat, dotted_quarter)  # -zeit
    note(B + flat, eighth); note(B + flat, eighth)
    # Nein, auch
    note(G, eighth)  # im
    note(C + octave, dotted_quarter)  # Win-
    note(B + flat, eighth); note(B + flat, eighth)
    # -ter wenn
    note(A, eighth); note(A, quarter)  # es schneit.

# German song
def song():
    metronome(adagio); dynamics(mezza_voce)
    chorus(); verse(); chorus()

song()
