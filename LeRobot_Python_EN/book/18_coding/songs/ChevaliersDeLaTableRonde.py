from LibRobot import *

# Play "Chevaliers de la Table ronde"
def melody():
    metronome(moderato)  # time 3/4
    dynamics(forte)
    for i in range(2):
        note(D, eighth); note(G, eighth)
        note(G, quarter); note(G, eighth); note(B, eighth)
        note(B, eighth); note(octave + D, eighth)
        note(octave + D, quarter); note(B, quarter)
        note(B, eighth)
        note(B, eighth)
        note(A, quarter); note(D, eighth); note(A, eighth)
        note(A, eighth); note(A, eighth)
        note(G, quarter); rest(quarter_rest)
    for i in range(1, 3):
        note(octave + D, eighth); note(octave + D, eighth)
        note(octave + E, quarter); note(octave + C, eighth)
        note(octave + C, eighth)
        note(octave + C, quarter); note(octave + E, eighth)
        note(octave + E, eighth)
        note(octave + D, quarter); note(B, eighth)
        note(B, eighth)
        note(B, quarter); note(octave + D, eighth)
        note(octave + D, eighth)
        note(octave + C, quarter); note(A, eighth)
        note(octave + D, eighth); note(octave + D, eighth)
        note(octave + D, eighth)
        if i == 1:
            note(B, quarter)
        else:
            note(G, quarter)
        rest(quarter_rest)

melody()
