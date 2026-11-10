from LibRobot import *

# O Tannenbaum (chanson allemande)
def refrain():
    note(d0, noire)  # O
    note(fa, croche_pointee); note(fa, double_croche)
    # Tan-nen-
    note(fa, noire)  # -baum,
    note(sol, noire)  # o
    note(la, croche_pointee); note(la, double_croche)
    # Tan-nen-
    note(la, noire_pointee)  # -baum,
    note(fa, croche); note(sol, croche)  # wie treu
    note(la, croche); note(si + bemol, noire)  # sind dei-
    note(mi, noire)  # -ne
    note(sol, noire); note(fa, noire)  # Blät-ter !

def couplet():
    silence(demi_soupir)
    note(d0 + octave, croche)  # Du
    note(d0 + octave, croche); note(la, croche)
    # grünst nicht
    note(re + octave, noire_pointee)  # nur
    note(d0 + octave, croche); note(d0 + octave, croche)
    # zur Som-
    note(si + bemol, croche)  # -mer-
    note(si + bemol, noire_pointee)  # -zeit
    note(si + bemol, croche); note(si + bemol, croche)
    # Nein, auch
    note(sol, croche)  # im
    note(d0 + octave, noire_pointee)  # Win-
    note(si + bemol, croche); note(si + bemol, croche)
    # -ter wenn
    note(la, croche); note(la, noire)  # es schneit.

# Chanson allemande
def chanson():
    metronome(adagio); nuance(mezza_voce)
    refrain(); couplet(); refrain()

chanson()
