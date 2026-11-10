from LibRobot import *

# Play "Kalinka"
def melody():
    # Russian song
    metronome(120)
    note(A, half)  # Ka-
    note(G, quarter)  # -lin-
    note(E, eighth)  # -ka,
    note(F, eighth)  # ka-
    note(G, quarter)  # -lin
    note(E, eighth)  # -ka,
    note(F, eighth)  # Ka-
    note(G, quarter)  # -lin-
    note(F, eighth)  # -ka
    note(E, eighth)  # ma-
    note(D, quarter)  # -ya
    note(A, eighth)  # fsa-
    note(A, eighth)  # -dou
    note(G, dotted_quarter)  # ya-
    note(F, sixteenth)  # -ga-
    note(E, eighth)  # da
    note(F, eighth)  # Ma-
    note(G, quarter)  # -lin-
    note(E, eighth)  # -ka,
    note(F, eighth)  # ma-
    note(G, quarter)  # -lin-
    note(F, eighth)  # -ka
    note(E, eighth)  # ma-
    note(D, quarter)  # -ya
    note(octave + D, quarter)  # Ah
    note(octave + C, whole)  # -a !
    for i in range(2):
        note(A, quarter)  # Kra- / Dou-
        note(octave + C, quarter)  # -a- / cha
        note(B + flat, quarter)  # -ça / dié-
        note(A, eighth)  # -a-/-é-
        note(G, eighth)  # -a-/-é-
        note(F, half)  # -vit-/vi-
        note(C, half)  # -sa/-tsa
    note(D, half)  # Pa-
    note(D, quarter)  # -a-
    note(E, quarter)  # -liou-
    note(G, quarter)  # -bi-
    note(F, quarter)  # -i
    note(E, quarter)  # jé
    note(D, quarter)  # -é
    note(octave + C, half)  # ty
    note(B + flat, quarter_triplet)  # mi-
    note(octave + C, quarter_triplet)  # -i-
    note(B + flat, quarter_triplet)  # -i
    note(A, half)  # nia !

melody()
