from LibRobot import *

# Play "J'ai du bon tabac"
def startOfFirstPart():
    note(D, eighth); note(E, eighth)
    note(F + sharp, eighth)
    note(D, eighth)
    note(E, quarter); note(E, eighth); note(F + sharp, eighth)
    note(G, quarter)

def firstPart():
    startOfFirstPart(); note(G, quarter)
    note(F + sharp, quarter); note(F + sharp, quarter)
    startOfFirstPart(); note(A, quarter)
    note(D, half)

def secondPart():
    for i in range(2):
        note(A, quarter); note(A, eighth); note(G, eighth)
        note(F + sharp, quarter); note(E, eighth)
        note(F + sharp, eighth)
        note(G, quarter); note(A, quarter)
        note(E, half)

def melody():
    metronome(moderato)  # time 2/4
    dynamics(mezza_voce)
    firstPart(); secondPart(); firstPart()

melody()
