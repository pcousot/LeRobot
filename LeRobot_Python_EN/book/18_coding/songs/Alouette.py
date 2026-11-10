from LibRobot import *

# Play "Alouette"
def melody():
    metronome(moderato)  # time 4/4
    dynamics(mezza_voce)
    # Chorus
    note(G, dotted_quarter); note(A, eighth); note(B, quarter)
    note(B, quarter)
    note(A, eighth); note(G, eighth); note(A, eighth)
    note(B, eighth); note(G, quarter); note(D, quarter)
    note(G, dotted_quarter); note(A, eighth); note(B, quarter)
    note(B, quarter)
    note(A, eighth); note(G, eighth); note(A, eighth)
    note(B, eighth); note(G, quarter); rest(quarter_rest)
    # Verse
    note(G, eighth); note(G, eighth); note(G, eighth)
    note(G, eighth); note(G, eighth); note(B, eighth)
    note(octave + D, quarter)
    note(octave + D, eighth); note(octave + E, eighth)
    note(octave + D, eighth); note(octave + C, eighth)
    note(B, eighth); note(A, eighth); note(G, quarter)
    for i in range(2):
        note(octave + D, eighth); note(octave + D, eighth)
        note(octave + D, quarter); note(D, eighth)
        note(D, eighth); note(D, quarter)
    note(octave + D, whole)

melody()
