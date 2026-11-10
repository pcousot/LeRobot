from LibRobot import *

# Jouer "Frère Jacques"
def melodie():
    metronome(andante)  # mesure 4/4
    nuance(mezza_voce)
    for i in range(2):
        note(fa, noire)
        note(sol, noire)
        note(la, noire)
        note(fa, noire)
    for i in range(2):
        note(la, noire)
        note(si + bemol, noire)
        note(octave + d0, blanche)
    for i in range(2):
        note(octave + d0, croche_pointee)
        note(octave + re, double_croche)
        note(octave + d0, croche)
        note(si + bemol, croche)
        note(la, noire)
        note(fa, noire)
    for i in range(2):
        note(fa, noire)
        note(d0, noire)
        note(fa, blanche)

melodie()
