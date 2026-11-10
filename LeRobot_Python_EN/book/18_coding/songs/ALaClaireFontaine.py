from LibRobot import *

# Play "À la claire fontaine"
def melody():
    metronome(adagio)  # time 2/4
    dynamics(mezza_voce)
    note(G, quarter); note(G, eighth); note(B, eighth)
    note(B, eighth); note(A, eighth); note(B, eighth)
    note(B, eighth)
    note(G, quarter); note(G, eighth); note(B, eighth)
    note(B, eighth); note(A, eighth); note(B, quarter)
    note(B, quarter); note(B, eighth); note(A, eighth)
    note(G, eighth); note(B, eighth)
    note(octave + D, eighth)
    note(B, eighth)
    note(octave + D, quarter); note(octave + D, eighth)
    note(B, eighth)
    note(G, eighth); note(B, eighth); note(A, quarter)
    # Chorus
    note(G, quarter); note(G, eighth); note(B, eighth)
    note(B, eighth); note(A, sixteenth)
    note(G, sixteenth)
    note(B, eighth); note(G, eighth)
    note(B, quarter); note(B, eighth); note(A, sixteenth)
    note(G, sixteenth)
    note(B, eighth); note(A, eighth); note(G, quarter)

melody()
