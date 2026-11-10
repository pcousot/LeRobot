from LibRobot import *

# Play "Cielito lindo"

# Traditional Mexican song
def melody():
    message("Cielito Lindo")
    metronome(presto)  # time 3 / 4
    dynamics(mezza_voce)
    note(octave + C, quarter)  # E-
    note(octave + C, dotted_quarter)  # -se
    note(A, eighth)  # lu-
    for i in range(2):
        note(B, half)  # -nar/Lin-
        note(G, quarter)  # que/to
        note(octave + C, quarter)  # tie-/Lin-
        note(octave + C, dotted_quarter)  # -nes/-do
        note(A, eighth)  # Cie-/Jun-
    note(B, half)  # -to a
    note(G, quarter)  # la
    note(F, quarter)  # bo-
    note(D, half + half)  # -ca
    rest(quarter_rest)
    note(B, quarter)  # No
    note(B, quarter)  # se
    note(B, quarter + quarter)  # lo-
    note(A, quarter)  # -des
    note(G, quarter)  # a
    note(F, quarter)  # na-
    note(D, half + quarter)  # -die  Cie-
    note(E, quarter)  # -li-
    note(F, quarter)  # -to
    note(G, quarter)  # Lin-
    note(G, quarter)  # -do,
    note(G, quarter + quarter)  # Que a-
    note(F, half)  # -mi
    note(E, eighth)  # me
    note(D, eighth)  # to-
    note(C, half + quarter)  # -ca
    rest(quarter_rest); rest(quarter_rest)
    for i in range(1, 3):
        note(octave + E, dotted_half)  # Ay!
        note(octave + D, half)  # ay!
        note(octave + C, quarter)  # ay!
        note(A, dotted_half + half)  # ay!
        rest(quarter_rest)
        note(octave + D, dotted_half)  # Can-
        note(octave + D, half)  # tay
        note(octave + C, quarter)  # no
        note(octave + E, quarter)  # llo-
        note(octave + C, half + quarter)  # -res
        rest(quarter_rest); note(G, quarter)  # Por-
        note(A, half)  # -que
        note(G, quarter)  # can-
        note(A, quarter)  # -tan-
        note(A, quarter)  # -do
        note(G, quarter)  # se a
        note(octave + F, quarter)  # le
        note(octave + F, quarter)  # gran,
        note(octave + D, quarter + quarter)  # Cie-
        note(B, quarter)  # -li-
        note(G, quarter)  # -to
        note(A, quarter)  # Lin-
        note(A, quarter)  # -do,
        note(G, quarter + quarter)  # Los-
        if i == 1:
            note(F, quarter)  # -co-
            note(G, quarter)  # -ra
            note(E, eighth)  # zo-
            note(D, eighth)  # -
            note(C, half + quarter)  # -nes
            rest(quarter_rest); rest(quarter_rest)
        else:
            note(octave + F, quarter)  # co-
            note(octave + G, quarter)  # -ra
    note(octave + E, eighth)  # zo -
    note(octave + D, eighth)  # -
    note(octave + C, half + quarter)  # -nes
    rest(quarter_rest)

melody()
