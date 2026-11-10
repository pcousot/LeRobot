from LibRobot import *

# Write the notes on a staff while playing them

# Grid size
x = 4
y = 3

def drawWhole():
    fn(); cr(); cr(); cr(); cr()

def drawHalf():
    fn(); cr(); cr(); cr(); cr()

def drawQuarter():
    fn(); cr(); cr(); cr(); cr(); cr(); qtl()
    paint(); qtr(); cr(); cr()
    qtl()
    paint(); qtr(); cr()

def stemUp():
    translate(2, 0); fdn(6); translate(-2, -6)

def stemDown():
    fdn(-6); translate(0, 6)

def clef():
    pw(2); gsX(x); gsY(y)
    translate(2, 4); fn()
    gs(2 * y)
    cr(); cr(); gsX(3 * y); cr()
    gsY(4 * y); cr()
    etr(); gs(4 * y)
    fd(); etr(); gsX(2 * y)
    gsY(3 * y); cl()
    gsX(y); cl(); cl()
    gsY(y); fdn(14); gs(2 * y)
    cr()
    gsX(x / 3); gsY(y / 3)
    cr(); cr(); cr(); cr(); qtr()
    gsX(x); gsY(y)
    translate(2, 3)
    pw(1)

def staff():
    bg(white); gsX(4 * x)
    gsY(y); hideRobot()
    gl(); fe()
    for line in range(5):
        while not tb():
            fd()
        ht(); translate(0, -2)
    # Put the robot on the line of the middle C of the
    # piano keyboard
    gl(); gsX(x); clef()

# Draw a vertical bar line
def barLine():
    translate(4, 2); fn(); fdn(8); translate(-3, -10)

# Go up from the current position of the note to the
# position of the middle C of the piano, drawing ledger
# lines.
def goUp(n):
    fe()
    if n % 2 == 1:
        # Do not cut the note D, F, ... with a line
        translate(0, 1)
    for i in range(n // 2 + 1):
        translate(-1, 0); fdn(4)
        translate(-3, 2)
    translate(0, -2)

# Go down from the current position of the note to the
# position of the middle C of the piano, drawing ledger
# lines.
def goDown(n):
    fe()
    if n == 0:
        # middle C of the piano keyboard
        translate(-1, 0); fdn(4); translate(-3, 0)
    elif n <= 11:
        # note on the staff
        translate(0, -n)
    else:
        if n % 2 == 1:
            # Do not cut the note D, F, ... with a
            # line
            translate(0, -1)
        for i in range(n // 2 - 1):
            translate(-1, 0); fdn(4)
            translate(-3, -2)
        translate(0, -2)

def play(noteName, n, oc, f):
    message(noteName + " = " + str(n) + ", octave number = " + str(oc) + ", octave = 12, code = ((" + str(oc) + " * octave) + " + noteName + ") = " + str(n + oc * octave))
    # Go to the next note
    translate(5, 0)
    # Put the robot on the right line
    if n == C:
        translate(0, oc * 7)
    elif n == D:
        translate(0, oc * 7 + 1)
    elif n == E:
        translate(0, oc * 7 + 2)
    elif n == F:
        translate(0, oc * 7 + 3)
    elif n == G:
        translate(0, oc * 7 + 4)
    elif n == A:
        translate(0, oc * 7 + 5)
    elif n == B:
        translate(0, oc * 7 + 6)
    # Draw the note
    if f == whole:
        drawWhole()
    elif f == half:
        drawHalf()
    else:
        drawQuarter()
    # Draw the stem of the note
    if f == half or f == quarter:
        if oc * octave + n < B:
            stemUp()
        else:
            stemDown()
    # Come back to the line of the middle C of the piano
    # keyboard.
    if n == C:
        if oc >= 0:
            goDown(oc * 7)
        else:
            goUp(-(oc * 7))
    elif n == D:
        if oc >= 0:
            goDown(oc * 7 + 1)
        else:
            goUp(-(oc * 7 + 1))
    elif n == E:
        if oc >= 0:
            goDown(oc * 7 + 2)
        else:
            goUp(-(oc * 7 + 2))
    elif n == F:
        if oc >= 0:
            goDown(oc * 7 + 3)
        else:
            goUp(-(oc * 7 + 3))
    elif n == G:
        if oc >= 0:
            goDown(oc * 7 + 4)
        else:
            goUp(-(oc * 7 + 4))
    elif n == A:
        if oc >= 0:
            goDown(oc * 7 + 5)
        else:
            goUp(-(oc * 7 + 5))
    elif n == B:
        if oc >= 0:
            goDown(oc * 7 + 6)
        else:
            goUp(-(oc * 7 + 6))
    # Play the note
    note(oc * octave + n, f)

metronome(140); dynamics(forte)
staff()
play("C", C, -3, quarter)
play("D", D, -3, quarter)
play("E", E, -3, quarter)
play("F", F, -3, quarter)
play("G", G, -3, quarter)
play("A", A, -3, quarter)
play("B", B, -3, quarter)
barLine()
play("C", C, -2, quarter)
play("D", D, -2, quarter)
play("E", E, -2, quarter)
play("F", F, -2, quarter)
play("G", G, -2, quarter)
play("A", A, -2, quarter)
play("B", B, -2, quarter)
barLine()
play("C", C, -1, quarter)
play("D", D, -1, quarter)
play("E", E, -1, quarter)
play("F", F, -1, quarter)
play("G", G, -1, quarter)
play("A", A, -1, quarter)
play("B", B, -1, quarter)
barLine(); markPause()
clearMessage(); staff()
play("C", C, 0, quarter)
play("D", D, 0, quarter)
play("E", E, 0, quarter)
play("F", F, 0, quarter)
play("G", G, 0, quarter)
play("A", A, 0, quarter)
play("B", B, 0, quarter)
barLine()
play("C", C, 1, quarter)
play("D", D, 1, quarter)
play("E", E, 1, quarter)
play("F", F, 1, quarter)
play("G", G, 1, quarter)
play("A", A, 1, quarter)
play("B", B, 1, quarter)
barLine()
play("C", C, 2, quarter)
play("D", D, 2, quarter)
play("E", E, 2, quarter)
play("F", F, 2, quarter)
play("G", G, 2, quarter)
play("A", A, 2, quarter)
play("B", B, 2, quarter)
barLine(); markPause()
clearMessage(); staff()
play("C", C, 3, quarter)
play("D", D, 3, quarter)
play("E", E, 3, quarter)
play("F", F, 3, quarter)
play("G", G, 3, quarter)
play("A", A, 3, quarter)
play("B", B, 3, quarter)
barLine()
play("C", C, 4, quarter)
play("D", D, 4, quarter)
play("E", E, 4, quarter)
play("F", F, 4, quarter)
play("G", G, 4, quarter)
play("A", A, 4, quarter)
play("B", B, 4, quarter)
barLine(); markPause()
