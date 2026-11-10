from LibRobot import *

# Write a number in Egyptian hieroglyphs
g = 12  # Grid size

# Vertical stroke
def tenPowerZero():
    fdn(3); fdn(-3)

# Handle
def tenPowerOne():
    fdn(2); cr(); cr(); fdn(2); ht()

# Spiral
def tenPowerTwo():
    x = valGsX()
    pu(); etr(); fdn(2); qtl(); pd()
    gs(x / 2); cl(); cl(); gs(x); cl(); cl()
    gs(x / 2 * 3); cl(); cl()
    gsX(x / 2 * 3); gsY(x); fd()
    etl(); pu(); gsX(x / 2); fd(); qtl(); pd()
    gs(x)

# Lotus
def tenPowerThree():
    x = valGsX()
    # Bottom
    gs(x / 2 * 3); cr(); cr(); qtr(); fdn(2)
    # Stem
    pu(); fdn(-1); qtr(); fd(); pd(); gs(x)
    etl(); fd(); fdn(-1); qtr()
    fd(); fdn(-1); etl(); gs(x / 2 * 15); fd()
    # Flower
    gsX(x); gsY(x / 2); qtr(); cl(); etl()
    fd(); qtr(); fd(); etl(); cl()
    gsX(x / 2 * 3); gsY(x); cl(); cl()
    # Go to the right of the drawing, facing north
    pu(); qtr(); gs(x / 2); fdn(18); qtl(); fdn(3)
    qtl(); pd(); gs(x)

# Finger
def tenPowerFour():
    x = valGsX()
    fdn(9); gsY(x * 2); etl(); fd(); fdn(-1)
    etr(); gs(x); fdn(-9)

# Tadpole
def tenPowerFive():
    x = valGsX()
    # Legs
    pu(); qtr(); fdn(2); pd(); gsX(x * 3)
    gsY(x * 2); etl()
    cr(); gsY(x / 2); gsX(x); qtl(); cl()
    etr(); cl(); etr()
    gsY(x / 3 * 2); cr()
    # Belly
    pu(); tetr(); fd(); qtr(); pd()
    gsX(x * 3); gsY(x * 2); cr()
    # Head and left eye
    qtl(); gsX(x / 4); fdn(-1); gsY(x / 2)
    gsX(x / 4 * 5)
    cr(); etr(); gs(x * 2); cr(); pu(); tetr()
    gs(x); fd(); pd(); dp()
    # Back
    pu(); ht(); fd(); pd(); qtr(); gsY(x / 2)
    gsX(x); cl(); gsX(x / 2 * 7)
    gsY(x * 2); cr()
    # Tail
    etl(); gsX(x * 3); gsY(x * 2); cl()
    ht(); gsX(x * 4); gsY(x * 3)
    cr(); tetl(); gsX(x / 2); gsY(x); cr()
    # Place the robot to the right of the drawing, facing north
    pu(); ht(); gsX(x * 5); fd(); qtl(); gs(x)
    pd()

# A genie
def head():
    x = valGsX()
    cl(); cl(); etr(); gsX(x / 2); cl(); etl()
    gsX(x / 2 * 3)
    gsY(x * 2); cl()
    # Headdress
    pu(); gs(x); qtl(); fd(); pd(); etr()
    gs(x / 2)
    fd(); cl(); etl(); cl(); pu(); etl(); fd()
    pd(); qtl(); fd(); cr()
    etr(); cr()
    pu(); qtl(); gsX(x / 2 * 3); gsY(x * 2)
    fd(); pd(); gs(x)

def rightArm():
    x = valGsX()
    gsY(x * 3); fd(); gs(x / 2); tetl(); cl()
    etl(); cl()
    pu(); ht(); gsX(x / 2); gsY(x * 3); fd()
    pd(); gs(x)

def leftArm():
    x = valGsX()
    gsY(x * 3); fd(); gs(x / 2); tetr(); cr()
    etr(); cr()
    pu(); ht(); gsX(x / 2); gsY(x * 3); fd()
    pd(); gs(x)

# Genie of the million
def tenPowerSix():
    x = valGsX()
    # Left thigh
    pu(); qtr(); gsX(x / 2); fd(); qtl(); pd()
    gs(x * 2); cr()
    # Right side of the body
    etl(); gsX(x / 2); cl(); etr(); gsX(x)
    gsY(x * 4); cl(); etr()
    # Right arm, head, left arm
    gs(x); rightArm(); gsX(x / 2 * 7)
    gsY(x * 2); cl(); gs(x)
    leftArm(); pu(); etr(); fd(); pd(); tetr()
    head()
    # Left side of the body
    tetr(); gsY(x * 3); cl(); gsX(x / 2)
    gsY(x * 3); cl(); etr()
    gsX(x); gsY(x * 2); cr(); gs(x)
    # Left leg
    tetl(); gsX(x / 2); fd(); fdn(-9)
    # Right leg and thigh
    pu(); gsY(x / 2 * 3); gsX(x / 2); etl()
    fd(); pd(); gsX(x / 2)
    gsY(x * 2); qtl(); fd(); ht()
    gsX(x * 2); gsY(x / 2 * 3); fd()
    # Place the robot to the right of the drawing, facing north
    pu(); gsX(x * 7 / 2); gsY(x * 2); fd()
    gs(x); tetl(); pd()

# Size of the hieroglyphs
def width(powerOfTen):
    if powerOfTen == 6:
        return 6
    elif powerOfTen == 5:
        return 10
    elif powerOfTen == 4:
        return 0
    elif powerOfTen == 3:
        return 3
    elif powerOfTen == 2:
        return 3
    elif powerOfTen == 1:
        return 2
    elif powerOfTen == 0:
        return 0
    else:
        return 0

def height(powerOfTen):
    if powerOfTen == 6:
        return 11
    elif powerOfTen == 5:
        return 4
    elif powerOfTen == 4:
        return 11
    elif powerOfTen == 3:
        return 11
    elif powerOfTen == 2:
        return 3
    elif powerOfTen == 1:
        return 3
    elif powerOfTen == 0:
        return 3
    else:
        return 0

# Layout of the hieroglyphs
def rows(digit):
    if digit == 0:
        return 0
    elif digit in (1, 2, 3):
        return 1
    elif digit in (4, 5, 6, 7, 8):
        return 2
    elif digit == 9:
        return 3
    else:
        return 0

def columnsRow1(digit):
    if digit == 0:
        return 0
    elif digit == 1:
        return 1
    elif digit in (2, 4, 5):
        return 2
    elif digit in (3, 6, 7, 9):
        return 3
    elif digit == 8:
        return 4
    else:
        return 0

def columnsRow2(digit):
    if digit in (0, 1, 2, 3):
        return 0
    elif digit == 4:
        return 2
    elif digit in (5, 6, 9):
        return 3
    elif digit in (7, 8):
        return 4
    else:
        return 0

def rowSpace(powerOfTen, digit):
    if digit == 0:
        return 0
    elif digit in (4, 5, 6, 7, 8) and (powerOfTen == 3 or powerOfTen == 4):
        return 2
    else:
        return 1

def columnSpace(powerOfTen, digit):
    if digit < 2 or digit > 9:
        return 0
    else:
        if powerOfTen in (0, 1, 2, 3, 4, 6):
            return 1
        elif powerOfTen == 5:
            return -2
        else:
            return 0

# Grid size in horizontal writing
def gridH(powerOfTen, digit):
    x = valGsX()
    if digit in (4, 5, 6, 7, 8) and powerOfTen in (3, 4):
        return x / 11 * 5
    elif digit == 9 and powerOfTen in (3, 4):
        return x / 22 * 7
    elif powerOfTen in (0, 1, 2):
        return x / 2
    elif powerOfTen == 5:
        return x / 4 * 3
    else:
        return x

# Grid size in vertical writing
def gridV(powerOfTen):
    if powerOfTen in (6, 5, 4, 3):
        return valGsX() / 4 * 3
    else:
        return valGsX() / 2

# Width of a column in the hybrid
# representation
def coefficientWidth(previousValue, powerOfTen, number):
    digit = number % 10
    v = columnsRow1(digit) * (width(powerOfTen) + columnSpace(powerOfTen, digit))
    v = v + width(powerOfTen) if columnsRow1(digit) == columnsRow2(digit) - 1 else v
    previousValue = max(v, previousValue)
    if number < 10:
        return previousValue
    else:
        return coefficientWidth(previousValue, powerOfTen + 1, number // 10)

# Move the robot, pen up, by N times the grid size,
# to the right if N ≥ 0, to the left otherwise
def spacing(n):
    x = valGsX()
    pu()
    if n > 0:
        qtr(); gs(x * n); fd(); qtl()
    else:
        qtl(); gs(-(x * n)); fd(); qtr()
    pd(); gs(x)

# Draw the hieroglyph of the power of ten
def hieroglyph(powerOfTen):
    if powerOfTen == 6:
        tenPowerSix()
    elif powerOfTen == 5:
        tenPowerFive()
    elif powerOfTen == 4:
        tenPowerFour()
    elif powerOfTen == 3:
        tenPowerThree()
    elif powerOfTen == 2:
        tenPowerTwo()
    elif powerOfTen == 1:
        tenPowerOne()
    elif powerOfTen == 0:
        tenPowerZero()
    else:
        pass

# Write the digit (multiple of the power of ten)
# horizontally if h is true, vertically otherwise
def writeDigitInHieroglyphs(h, powerOfTen, digit):
    x = valGsX()
    # Width of a hieroglyph and of the space that
    # follows it
    step = width(powerOfTen) + columnSpace(powerOfTen, digit)
    space = columnSpace(powerOfTen, digit)
    if digit != 0:
        c = columnsRow1(digit)
        if h:
            gs(gridH(powerOfTen, digit))
            if c == columnsRow2(digit) - 1:
                spacing(step / 2)
        else:
            gs(gridV(powerOfTen))
            spacing(-((columnsRow1(digit) * step - space) / 2))
        for j in range(rows(digit)):
            for i in range(c):
                hieroglyph(powerOfTen)
                # Next column
                spacing(space)
            # Next row
            pu()
            fdn(height(powerOfTen) + rowSpace(powerOfTen, digit))
            pd()
            spacing(-(c * step))
            if c == columnsRow2(digit) - 1:
                spacing(-(step / 2))
                c = columnsRow2(digit)
        # Get into position to draw the next digit
        if h:
            spacing(c * step - space)
            pu()
            fdn(-(rows(digit) * (height(powerOfTen) + rowSpace(powerOfTen, digit))))
            pd()
            spacing(2)
            if 1 <= powerOfTen and powerOfTen <= 4:
                spacing(1)
        else:
            spacing((c * step - space) / 2)
        gs(x)

def highestPower(c):
    if c < 10:
        return 0
    else:
        return 1 + highestPower(c // 10)

def tenPower(n):
    if n == 0:
        return 1
    else:
        return tenPower(n - 1) * 10

def writeNumberInHieroglyphs(h, p, c):
    if c < 10:
        writeDigitInHieroglyphs(h, p, c)
    elif h:
        writeNumberInHieroglyphs(h, p + 1, c // 10)
        writeDigitInHieroglyphs(h, p, c % 10)
    else:
        writeDigitInHieroglyphs(h, p, c % 10)
        writeNumberInHieroglyphs(h, p + 1, c // 10)

# Read a strictly positive integer n in the robot's
# window, digit by digit (ending with a blank or
# with Return, and correcting with the backspace
# key)
def readNumber():
    prompt = "Number to code: "
    endCharacters = [" ", "\r", chr(3)]
    backspace = chr(8)
    n = 0; m = ""
    def display():
        message(prompt + m)
    # Read the next correct character
    def readC():
        nonlocal m, n
        c = readChar()
        if m == "" and not ("1" <= c and c <= "9"):
            # The first character is a non-zero digit
            beep(); return readC()
        elif c == backspace:
            # Erase the last digit read
            n = n // 10
            m = m[:len(m) - 1]
            display(); return readC()
        elif "0" <= c and c <= "9" or c in endCharacters:
            return c
        else:
            beep(); return readC()
    # Read the digits up to an end character
    def readDigits():
        nonlocal m, n
        c = readC()
        if "0" <= c and c <= "9":
            d = ord(c) - ord("0")
            if n <= (maxLongint - d) // 10:
                n = 10 * n + d
                m += c
                display(); readDigits()
            elif n == maxLongint:
                # End by overflow
                beep()
            # Overflow: read another character
            else:
                beep(); readDigits()
    display()
    readDigits()
    return n

horizontally = True

number = readNumber()
if number >= 1000000000:
    hideRobot(); gc()
    label("Too big for Egyptian hieroglyphs.")
    writeln("Too big for hieroglyphs.")
# Initialisation
else:
    hideRobot(); gs(g); gl(); pu(); fdn(10); pd()
    spacing(2)
    # Classical representation
    if number < 2000000:
        writeNumberInHieroglyphs(horizontally, 0, number)
    # Hybrid representation and big numbers
    if number >= 2000:
        # The line of the remainder goes down below the
        # starting point: we start 6 steps above the bottom
        # edge
        gl(); gb(); translate(0, 6); spacing(2)
        # Power p of the column (genie, tadpole, finger
        # or lotus) to be multiplied
        pf = highestPower(number)
        p = pf if pf == 3 else pf - 1 if pf == 4 else pf - 2
        coefficient = number // tenPower(p)
        l = coefficientWidth(width(p), 0, coefficient)
        spacing(l / 2)
        writeNumberInHieroglyphs(not horizontally, 0, coefficient)
        writeDigitInHieroglyphs(not horizontally, p, 1)
        gb(); translate(0, 6)
        spacing(l / 2 + 1)
        # Line of the remainder of the number
        writeNumberInHieroglyphs(horizontally, 0, number % tenPower(p))
st()
