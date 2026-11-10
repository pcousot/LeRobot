from LibRobot import *

# Jouer "J'ai du bon tabac"
def debutPremierePartie():
    note(re, croche); note(mi, croche)
    note(fa + diese, croche)
    note(re, croche)
    note(mi, noire); note(mi, croche); note(fa + diese, croche)
    note(sol, noire)

def premierePartie():
    debutPremierePartie(); note(sol, noire)
    note(fa + diese, noire); note(fa + diese, noire)
    debutPremierePartie(); note(la, noire)
    note(re, blanche)

def deuxiemePartie():
    for i in range(2):
        note(la, noire); note(la, croche); note(sol, croche)
        note(fa + diese, noire); note(mi, croche)
        note(fa + diese, croche)
        note(sol, noire); note(la, noire)
        note(mi, blanche)

def melodie():
    metronome(moderato)  # mesure 2/4
    nuance(mezza_voce)
    premierePartie(); deuxiemePartie(); premierePartie()

melodie()
