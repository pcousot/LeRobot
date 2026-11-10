from LibRobot import *

# Jouer "Cielito lindo"

# Chanson traditionnelle mexicaine
def melodie():
    message("Cielito Lindo")
    metronome(presto)  # mesure 3 / 4
    nuance(mezza_voce)
    note(octave + ut, noire)  # E-
    note(octave + ut, noire_pointee)  # -se
    note(la, croche)  # lu-
    for i in range(2):
        note(si, blanche)  # -nar/Lin-
        note(sol, noire)  # que/to
        note(octave + ut, noire)  # tie-/Lin-
        note(octave + ut, noire_pointee)  # -nes/-do
        note(la, croche)  # Cie-/Jun-
    note(si, blanche)  # -to a
    note(sol, noire)  # la
    note(fa, noire)  # bo-
    note(re, blanche + blanche)  # -ca
    silence(soupir)
    note(si, noire)  # No
    note(si, noire)  # se
    note(si, noire + noire)  # lo-
    note(la, noire)  # -des
    note(sol, noire)  # a
    note(fa, noire)  # na-
    note(re, blanche + noire)  # -die  Cie-
    note(mi, noire)  # -li-
    note(fa, noire)  # -to
    note(sol, noire)  # Lin-
    note(sol, noire)  # -do,
    note(sol, noire + noire)  # Que a-
    note(fa, blanche)  # -mi
    note(mi, croche)  # me
    note(re, croche)  # to-
    note(ut, blanche + noire)  # -ca
    silence(soupir); silence(soupir)
    for i in range(1, 3):
        note(octave + mi, blanche_pointee)  # Ay!
        note(octave + re, blanche)  # ay!
        note(octave + ut, noire)  # ay!
        note(la, blanche_pointee + blanche)  # ay!
        silence(soupir)
        note(octave + re, blanche_pointee)  # Can-
        note(octave + re, blanche)  # tay
        note(octave + ut, noire)  # no
        note(octave + mi, noire)  # llo-
        note(octave + ut, blanche + noire)  # -res
        silence(soupir); note(sol, noire)  # Por-
        note(la, blanche)  # -que
        note(sol, noire)  # can-
        note(la, noire)  # -tan-
        note(la, noire)  # -do
        note(sol, noire)  # se a
        note(octave + fa, noire)  # le
        note(octave + fa, noire)  # gran,
        note(octave + re, noire + noire)  # Cie-
        note(si, noire)  # -li-
        note(sol, noire)  # -to
        note(la, noire)  # Lin-
        note(la, noire)  # -do,
        note(sol, noire + noire)  # Los-
        if i == 1:
            note(fa, noire)  # -co-
            note(sol, noire)  # -ra
            note(mi, croche)  # zo-
            note(re, croche)  # -
            note(ut, blanche + noire)  # -nes
            silence(soupir); silence(soupir)
        else:
            note(octave + fa, noire)  # co-
            note(octave + sol, noire)  # -ra
    note(octave + mi, croche)  # zo -
    note(octave + re, croche)  # -
    note(octave + ut, blanche + noire)  # -nes
    silence(soupir)

melodie()
