from LibRobot import *

# Play "Cadet Rousselle"
def melody():
    for i in range(2):
        metronome(allegro)  # time 6 / 8
        dynamics(mezza_voce)
        note(E, eighth); note(F + sharp, eighth)
        note(G + sharp, eighth)
        note(A, quarter); note(A, eighth); note(A, quarter)
        note(C + octave + sharp, eighth)
        note(A, dotted_quarter); note(B, eighth)
        note(B, eighth); note(B, eighth)
        note(B, quarter); note(A, eighth)
        note(G + sharp, quarter)
        note(F + sharp, eighth)
        note(E, dotted_quarter)
    for i in range(2):
        note(B, eighth); note(B, eighth); note(B, eighth)
        note(B, quarter); note(octave + C + sharp, eighth)
        note(octave + D, quarter); note(E + octave, eighth)
        note(octave + D, quarter)
        note(octave + C + sharp, eighth)
    # Chorus
    for i in range(2):
        note(A, dotted_quarter)
        note(A, dotted_quarter); note(A, eighth)
        note(G + sharp, eighth); note(F + sharp, eighth)
        note(E, dotted_quarter); note(A, eighth)
        note(G + sharp, eighth)
        note(A, eighth)
        note(B, quarter); note(B, eighth); note(A, eighth)
        note(G + sharp, eighth)
        note(A, quarter); rest(eighth_rest)

melody()
