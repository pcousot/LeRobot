from LibRobot import *

# Play "Sur le pont d'Avignon"
def chorus():
    note(G, eighth); note(G, eighth)
    note(G, quarter); note(A, eighth); note(A, eighth)
    note(A, quarter); note(B, eighth)
    note(octave + C, eighth)
    note(octave + D, eighth); note(G, eighth)
    note(F + sharp, eighth); note(G, eighth)
    note(A, eighth); note(D, eighth); note(G, eighth)
    note(G, eighth)
    note(G, quarter); note(A, eighth); note(A, eighth)
    note(A, quarter); note(B, eighth)
    note(octave + C, eighth)
    note(octave + D, eighth); note(G, eighth)
    note(A, eighth)
    note(F + sharp, eighth)
    note(G, quarter); rest(quarter_rest)

def verse():
    note(G, sixteenth); note(G, sixteenth)
    note(G, sixteenth); note(G, sixteenth)
    note(A, half)
    note(G, eighth); rest(eighth_rest)
    note(G, sixteenth)
    note(G, sixteenth); note(G, sixteenth)
    note(G, sixteenth)
    note(A, half)
    note(G, quarter); rest(quarter_rest)

def melody():
    metronome(76)  # time 2/4
    dynamics(mezza_voce)
    for i in range(4):
        chorus(); verse()
    chorus()

melody()
