from LibRobot import *

# Play "Greensleeves"

# Irish folk song
def beginning():
    note(A, quarter)  # A- / and
    note(octave + C, half)  # -las, / I
    note(octave + D, quarter)  # my / have
    note(octave + E, dotted_quarter)  # love / lov-
    note(octave + F + sharp, eighth)  # - / -
    note(octave + E, quarter)  # you / -ed
    note(octave + D, half)  # do / you
    note(B, quarter)  # me / so
    note(G, dotted_quarter)  # wrong / long
    note(A, eighth)  # - / -
    note(B, quarter)  # to / de-

def melody():
    metronome(allegro)  # time 3/4
    dynamics(mezza_voce)
    rest(quarter_rest); rest(quarter_rest)
    beginning()
    note(octave + C, half)  # treat
    note(A, quarter)  # me
    note(A, dotted_quarter)  # so
    note(G + sharp, eighth)  # -
    note(A, quarter)  # dis-
    note(B, half)  # -court-
    note(G + sharp, quarter)  # -eous-
    note(E, half)  # -ly
    beginning()
    note(octave + C, dotted_quarter)  # -light-
    note(B, eighth)  # -
    note(A, quarter)  # -ing
    note(G + sharp, dotted_quarter)  # in
    note(F + sharp, eighth)  # -
    note(G + sharp, quarter)  # your
    note(A, dotted_half)  # com-
    note(A, quarter)  # - pany
    note(A, eighth); note(B, eighth)
    note(octave + C, eighth)
    note(octave + E, eighth)
    for i in range(1, 3):
        note(octave + G, dotted_half)  # Green-
        note(octave + G, dotted_quarter)  # -sleeves
        note(octave + F + sharp, eighth)  # -
        note(octave + E, quarter)  # was
        note(octave + D, half)  # all
        note(B, quarter)  # my
        note(G, dotted_quarter)  # joy
        note(A, eighth)  # -
        note(B, quarter)  # -
        note(octave + C, half)  # Green-
        note(A, quarter)  # -
        note(A, dotted_quarter)  # -sleeves
        note(G + sharp, eighth)  # -
        note(A, quarter)  # was
        note(B, half)  # my /
        note(G + sharp, quarter)  # de-
        note(E, dotted_half)  # -light,
        note(octave + G, dotted_half)  # Green-
        note(octave + G, dotted_quarter)  # -sleeves
        note(octave + F + sharp, eighth)  # was
        note(octave + E, quarter)  # my
        note(octave + D, half)  # heart
        note(B, quarter)  # of
        note(G, dotted_quarter)  # gold
        note(A, eighth)  # -
        note(B, quarter)  # and
        note(octave + C, dotted_quarter)  # who
        note(B, eighth)
        # -
        note(A, quarter)  # but
        note(G + sharp, dotted_quarter)  # La-
        note(F + sharp, eighth)  # -
        note(G + sharp, quarter)  # -dy
        note(A, dotted_half)  # Green-
        if i == 1:
            note(A, quarter)  # -sleeves
            note(A, eighth); note(B, eighth)
            note(octave + C, eighth); note(octave + E, eighth)
        else:
            note(A, half)  # -sleeves
            rest(quarter_rest)

melody()
