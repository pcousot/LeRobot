from LibRobot import *

# Play "En passant par la Lorraine"
def melody():
    metronome(168)  # time 6/8
    dynamics(mezza_voce)
    for i in range(2):
        note(F, quarter); note(A, eighth)
        note(octave + C, quarter); note(octave + C, eighth)
        note(octave + C, quarter); note(octave + C, eighth)
        note(octave + D, quarter); note(B + flat, eighth)
        note(octave + C, quarter); note(octave + C, eighth)
        note(octave + D, quarter); note(octave + D, eighth)
        note(octave + C, dotted_quarter + quarter)
        rest(eighth_rest)
    note(octave + C, quarter); note(octave + C, eighth)
    note(octave + F, quarter); note(octave + C, eighth)
    note(octave + C, quarter); note(B + flat, eighth)
    note(A, quarter); note(G, eighth); note(A, quarter)
    note(A, eighth)
    note(A, quarter); note(octave + C, eighth)
    note(octave + C, quarter); note(B + flat, eighth)
    note(A, quarter); note(G, eighth); note(F, quarter)
    note(A, eighth)
    note(octave + C, dotted_quarter + quarter)
    rest(eighth_rest)
    note(octave + D, quarter); note(B + flat, eighth)
    note(G, quarter); note(E, eighth)
    note(F, dotted_half + quarter); rest(eighth_rest)

melody()
