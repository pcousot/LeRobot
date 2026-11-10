# *******************************************************
# *                                                     *
# "Premières leçons de programmation en Turbo Pascal"
# Patrick, Laurent, Radhia and Thibault COUSOT
# Éditions McGraw-Hill, Paris, 1991.
# *                                                     *
# *******************************************************
from LibRobot import *

maxDigits = 15
maxDigitsP1 = 16
# maxDigits + 1
nbDigits = 0
r = [0] * (maxDigitsP1 + 1)
# Carries (4th line counting from the bottom)
rFound = [False] * (maxDigitsP1 + 1)
# Digits of R found
a = [0] * (maxDigitsP1 + 1)
# A (3rd line counting from the bottom)
b = [0] * (maxDigitsP1 + 1)
# B (2nd line counting from the bottom)
s = [0] * (maxDigitsP1 + 1)
# A + B (1st line counting from the bottom)
sFound = [False] * (maxDigitsP1 + 1)
# Digits of S found
equ = [" "] * (9 + 1)

# Characters on the same keys as the
# digits on the AZERTY keyboard
def randomAandB():
    a[1] = 0
    for i in range(2, nbDigits + 2):
        a[i] = abs(random() + tickCount()) % 10
    b[1] = 0
    for i in range(2, nbDigits + 2):
        b[i] = abs(random() + tickCount()) % 10

def add():
    # S := A + B, carries in R
    sC = 0
    r[nbDigits + 1] = 0
    for i in range(nbDigits + 1, 1, -1):
        sC = r[i] + a[i] + b[i]
        if sC < 10:
            r[i - 1] = 0
            s[i] = sC
        else:
            r[i - 1] = 1
            s[i] = sC - 10
    s[1] = r[1]

def markNoDigitFound():
    # Mark the digits of R and S still to be found
    for i in range(1, nbDigits + 2):
        rFound[i] = False
        sFound[i] = False
    rFound[1] = True  # The most significant carry goes directly into the result S
    if s[1] == 0:
        sFound[1] = True
    rFound[nbDigits + 1] = True  # No least significant carry

# Mark of a place to complete: a small square (a single point could
# hardly be seen on present-day screens)
def mark(colour):
    pc(colour); pw(3); dp(); pw(1); pc(black)

def writeDigit(s, x, y, c):
    # Write the digit C in the style S at position (X, Y) relative to the centre
    moveTo(x, y)
    mark(white)  # erase the mark of the place
    textStyle(s)
    label(chr(ord("0") + c) * 1)
    textStyle(normal)

def beepBeepBeep():
    beep(); beep(); beep()

nbErrors = 0
nbAdditionsTried = 0
nbAdditionsSucceeded = 0

def error():
    global nbErrors
    beepBeepBeep(); nbErrors += 1

c = " "

def charToDigitAndWrite(c, i, x, y):
    # Read the digit I on the keyboard (signalling the errors by a 'beep'
    done = False
    r = ord(c) == ord("0") + i or c == equ[i]
    if r:
        writeDigit(normal, x, y, i)
    else:
        error()
    return r

def writeNumber(s, y, n, p, d):
    # Write the number N, from the digit of rank P to the digit of rank D, on line Y
    # (the lines being counted from bottom to top) in the style S (bold or normal)
    i = 0
    i = p
    while n[i] == 0 and i < d:
        i += 1
    for j in range(i, d + 1):
        writeDigit(s, j, y, n[j])

def markPlaces(y, p, d):
    # Mark the places of the digits of rank P to rank D of a number
    # that would be written on line Y (the lines being counted from bottom to top).
    for i in range(p, d + 1):
        moveTo(i, y); mark(black)

def bar():
    # Draw the operation bar on line 1
    moveTo(0, 1); fe()
    for i in range(nbDigits + 2):
        fd()
    fn()

def additionSign():
    # Draw the addition sign on line 2
    moveTo(0, 2)
    textStyle(bold)
    label(concat(["+"]))
    textStyle(normal)

def operationFinished():
    # Returns True iff all the positions to complete have been completed
    res = False
    result = False
    res = True
    for i in range(1, nbDigits + 2):
        res = res and (rFound[i] or r[i] == 0) and sFound[i]
    # Do not require the carries equal to zero to be completed
    result = res
    return result

def completeOperation():
    # Complete the operation by pointing each time at a place with the mouse and
    # typing a digit, the errors being signalled by a 'beep'
    # Returns False if the operation was given up (Esc key)
    x = 0
    y = 0
    # Coordinates of the mouse
    rL = False
    c = " "
    while not operationFinished():
        gc()
        message("Point at a box (result or carry): mouse or arrows, then type the digit. Esc: give up.")
        x, y, c = interactionTP(False, False, False, False, False)
        if c == "\x1b":
            # Esc: give up this operation
            gc()
            return False
        if y == 0:
            if not sFound[x]:
                rL = charToDigitAndWrite(c, s[x], x, y)
                sFound[x] = rL
            else:
                beepBeepBeep()
        elif y == 4:
            if not rFound[x]:
                rL = charToDigitAndWrite(c, r[x], x, y)
                rFound[x] = rL
            else:
                beepBeepBeep()
        else:
            beepBeepBeep()
    gc()
    return True

# the whole dialogue is in the robot's window (bottom bar): nothing
# in the terminal, which therefore need not be cleared
def clearTextWindow():
    pass

terminalOutput(False)
# grid of 20 pixels (12 by default): the font of XQuartz is larger
# than the Macintosh's and the lines of digits touched each other
gs(20)
equ[0] = "à"  # Lower-case equivalent of the digits on AZERTY keyboards
equ[1] = "&"
equ[2] = "é"
equ[3] = "\""
equ[4] = "'"
equ[5] = "("
equ[6] = "§"
equ[7] = "è"
equ[8] = "!"
equ[9] = "ç"
nbAdditionsTried = 0
nbAdditionsSucceeded = 0
clearTextWindow()
while True:  # repeat ... until
    write("Additions with how many digits? (answer between 1 and ", sprintf("%*d", 1, maxDigits), "): ")
    nbDigits = readInt()
    if nbDigits < 1:
        writeln("Error, not enough digits. Try again...")
    if nbDigits > maxDigits:
        writeln("Error, addition with too many digits. Try again...")
    if 1 <= nbDigits and nbDigits <= maxDigits:
        break
while True:  # repeat ... until
    randomAandB()
    add()
    markNoDigitFound()
    markPlaces(4, 2, nbDigits)  # Carry R
    writeNumber(bold, 3, b, 2, nbDigits + 1)  # Number A
    writeNumber(bold, 2, a, 2, nbDigits + 1)  # Number B
    additionSign(); bar()
    if s[1] != 0:
        markPlaces(0, 1, nbDigits + 1)  # S = A + B
    else:
        markPlaces(0, 2, nbDigits + 1)  # S = A + B
    gc()
    nbErrors = 0
    finished = completeOperation()
    nbAdditionsTried += 1
    # Addition finished: the result stays in the bottom bar until
    # a key is pressed (read here, so that it does not answer the
    # next question)
    more = "   (press a key to continue)"
    if not finished:
        message(concat(["Addition given up.", more]))
    elif nbErrors == 0:
        nbAdditionsSucceeded += 1
        message(concat(["Well done! Addition completed without any error.", more]))
    elif nbErrors == 1:
        message(concat(["Addition finished, with only one error.", more]))
    else:
        message(concat(["Addition finished, with ", intToString(nbErrors), " errors.", more]))
    readChar()
    gc(); bg(white)
    message("Have you finished your operations? (answer 'Y' or 'N')")
    c = readChar()
    if c == "y" or c == "Y":
        break
clearTextWindow()
if nbAdditionsSucceeded == nbAdditionsTried:
    if nbAdditionsTried == 1:
        writeln("Well done, you completed your operation without errors!")
    else:
        writeln("Congratulations, you completed all your operations without any mistake!")
elif nbAdditionsTried == 1:
    writeln("Too bad, you did not get your operation right the first time!")
elif nbAdditionsSucceeded == 1:
    writeln("One operation right the first time out of ", sprintf("%*d", 1, nbAdditionsTried), " tries")
else:
    writeln(sprintf("%*d", 1, nbAdditionsSucceeded), " operations right without mistakes out of ", sprintf("%*d", 1, nbAdditionsTried), " attempts")
writeln()
writeln("Finish by pressing the 'Return' key.")
readln()
