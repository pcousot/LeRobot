from LibRobot import *

# Play "Frère Jacques"
def melody():
    metronome(andante)  # time 4/4
    dynamics(mezza_voce)
    for i in range(2):
        note(F, quarter)
        note(G, quarter)
        note(A, quarter)
        note(F, quarter)
    for i in range(2):
        note(A, quarter)
        note(B + flat, quarter)
        note(octave + C, half)
    for i in range(2):
        note(octave + C, dotted_eighth)
        note(octave + D, sixteenth)
        note(octave + C, eighth)
        note(B + flat, eighth)
        note(A, quarter)
        note(F, quarter)
    for i in range(2):
        note(F, quarter)
        note(C, quarter)
        note(F, half)

melody()
