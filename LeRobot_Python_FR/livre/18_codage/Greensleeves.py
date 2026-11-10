from LibRobot import *

# Jouer "Greensleeves"

# Chant populaire irlandais
def debut():
    note(la, noire)  # A- / and
    note(octave + d0, blanche)  # -las, / I
    note(octave + re, noire)  # my / have
    note(octave + mi, noire_pointee)  # love / lov-
    note(octave + fa + diese, croche)  # - / -
    note(octave + mi, noire)  # you / -ed
    note(octave + re, blanche)  # do / you
    note(si, noire)  # me / so
    note(sol, noire_pointee)  # wrong / long
    note(la, croche)  # - / -
    note(si, noire)  # to / de-

def melodie():
    metronome(allegro)  # mesure 3/4
    nuance(mezza_voce)
    silence(soupir); silence(soupir)
    debut()
    note(octave + d0, blanche)  # treat
    note(la, noire)  # me
    note(la, noire_pointee)  # so
    note(sol + diese, croche)  # -
    note(la, noire)  # dis-
    note(si, blanche)  # -court-
    note(sol + diese, noire)  # -eous-
    note(mi, blanche)  # -ly
    debut()
    note(octave + d0, noire_pointee)  # -light-
    note(si, croche)  # -
    note(la, noire)  # -ing
    note(sol + diese, noire_pointee)  # in
    note(fa + diese, croche)  # -
    note(sol + diese, noire)  # your
    note(la, blanche_pointee)  # com-
    note(la, noire)  # - pany
    note(la, croche); note(si, croche)
    note(octave + d0, croche)
    note(octave + mi, croche)
    for i in range(1, 3):
        note(octave + sol, blanche_pointee)  # Green-
        note(octave + sol, noire_pointee)  # -sleeves
        note(octave + fa + diese, croche)  # -
        note(octave + mi, noire)  # was
        note(octave + re, blanche)  # all
        note(si, noire)  # my
        note(sol, noire_pointee)  # joy
        note(la, croche)  # -
        note(si, noire)  # -
        note(octave + d0, blanche)  # Green-
        note(la, noire)  # -
        note(la, noire_pointee)  # -sleeves
        note(sol + diese, croche)  # -
        note(la, noire)  # was
        note(si, blanche)  # my /
        note(sol + diese, noire)  # de-
        note(mi, blanche_pointee)  # -light,
        note(octave + sol, blanche_pointee)  # Green-
        note(octave + sol, noire_pointee)  # -sleeves
        note(octave + fa + diese, croche)  # was
        note(octave + mi, noire)  # my
        note(octave + re, blanche)  # heart
        note(si, noire)  # of
        note(sol, noire_pointee)  # gold
        note(la, croche)  # -
        note(si, noire)  # and
        note(octave + d0, noire_pointee)  # who
        note(si, croche)
        # -
        note(la, noire)  # but
        note(sol + diese, noire_pointee)  # La-
        note(fa + diese, croche)  # -
        note(sol + diese, noire)  # -dy
        note(la, blanche_pointee)  # Green-
        if i == 1:
            note(la, noire)  # -sleeves
            note(la, croche); note(si, croche)
            note(octave + d0, croche); note(octave + mi, croche)
        else:
            note(la, blanche)  # -sleeves
            silence(soupir)

melodie()
