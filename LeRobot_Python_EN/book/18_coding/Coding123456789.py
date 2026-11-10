from LibRobot import *

# Code 123 456 789 in various number systems
def babylonianNumeration(numberToCode):
    x = 6  # Grid size
    # Nail head
    def nailHead():
        pu(); qtr(); fd(); qtl(); pd()
        gsY(valGsY() * 2); cl(); fdn(-2); cl()
        pu(); qtl(); fd(); qtl(); pd()
        gs(x)

    # Nail whose point has height n
    def one(n):
        pu(); qtr(); fd(); qtl(); pd()
        fdn(n); pu(); qtl(); fd(); qtr()
        nailHead(); pu(); fdn(-n); pd()

    # Chevron
    def ten():
        pu(); fd(); qtr(); pd()
        gsX(x * 2); cr(); tetr()
        gsX(x)
        gsY(x * 2); cr(); tetr()
        gsY(x)
        gsX(x * 2); cr()
        pu(); tetl(); fd(); tetl(); pd()
        gs(x)

    # Leave n blanks horizontally, starting from and
    # coming back to a north orientation of the robot
    def spacing(n):
        pu(); qtr(); fdn(n); qtl(); pd()

    def tensOfSexagesimalUnits(tensDigit):
        if tensDigit == 1:
            ten()
        elif tensDigit == 2:
            ten(); ten()
        elif tensDigit == 3:
            ten(); ten(); ten()
        elif tensDigit == 4:
            pu(); qtr(); fdn(2); qtl(); pd()
            ten()
            pu(); fdn(2); qtl(); fdn(4); qtr(); pd()
            ten(); ten(); ten()
            pu(); fdn(-2); pd()
        elif tensDigit == 5:
            pu(); qtr(); fd(); qtl(); pd()
            ten(); ten()
            pu(); fdn(2); qtl(); fdn(5); qtr(); pd()
            ten(); ten(); ten()
            pu(); fdn(-2); pd()
        else:
            pass

    def unitsOfSexagesimalUnits(unitsDigit):
        if unitsDigit == 1:
            one(4)
        elif unitsDigit == 2:
            one(4); one(4)
        elif unitsDigit == 3:
            one(4); one(4); one(4)
        elif unitsDigit == 4:
            pu(); qtr(); fd(); qtl(); pd()
            gs(x * 2); nailHead()
            gs(x)
            pu(); fdn(4); qtl(); fdn(5); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(-4); pd()
        elif unitsDigit == 5:
            pu(); qtr(); fd(); qtl(); pd()
            one(2); one(2)
            pu(); fdn(4); qtl(); fdn(5); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(-4); pd()
        elif unitsDigit == 6:
            one(2); one(2); one(2)
            pu(); fdn(4); qtl(); fdn(6); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(-4); pd()
        elif unitsDigit == 7:
            pu(); qtr(); fd(); qtl(); pd()
            gsX(x * 2); nailHead()
            pu(); fdn(2); qtl(); fdn(5); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(-4); pd()
        elif unitsDigit == 8:
            pu(); qtr(); fd(); qtl(); pd()
            nailHead(); nailHead()
            pu(); fdn(2); qtl(); fdn(5); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(-4); pd()
        elif unitsDigit == 9:
            nailHead(); nailHead(); nailHead()
            pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
            nailHead(); nailHead(); nailHead()
            pu(); fdn(-4); pd()
        else:
            pass

    # In medial position and only to mark the absence
    # of units in this position
    def babylonianZero():
        pu(); qtr(); fdn(6); pd()
        tetl(); fdn(3); gs(x * 2); cr()
        fdn(-1); cr()
        pu(); ht(); gs(x); fd(); pd()
        gs(x * 2); cr()
        fdn(-1)
        cr(); pu(); gs(x * 4); fd()
        tetl(); pd(); gs(x)

    def unitsInBabylonian(sexagesimalUnits):
        if sexagesimalUnits == 0:
            babylonianZero()
        else:
            choice = sexagesimalUnits // 10
            if choice == 1:
                tensOfSexagesimalUnits(1)
            elif choice == 2:
                tensOfSexagesimalUnits(2)
            elif choice == 3:
                tensOfSexagesimalUnits(3)
            elif choice == 4:
                tensOfSexagesimalUnits(4)
            elif choice == 5:
                tensOfSexagesimalUnits(5)
            else:
                pass
            spacing(1)
            choice2 = sexagesimalUnits % 10
            if choice2 == 1:
                unitsOfSexagesimalUnits(1)
            elif choice2 == 2:
                unitsOfSexagesimalUnits(2)
            elif choice2 == 3:
                unitsOfSexagesimalUnits(3)
            elif choice2 == 4:
                unitsOfSexagesimalUnits(4)
            elif choice2 == 5:
                unitsOfSexagesimalUnits(5)
            elif choice2 == 6:
                unitsOfSexagesimalUnits(6)
            elif choice2 == 7:
                unitsOfSexagesimalUnits(7)
            elif choice2 == 8:
                unitsOfSexagesimalUnits(8)
            elif choice2 == 9:
                unitsOfSexagesimalUnits(9)
            else:
                pass
        spacing(4)

    def numberInBabylonian(c):
        if c < 60:
            unitsInBabylonian(c)
        else:
            numberInBabylonian(c // 60)
            unitsInBabylonian(c % 60)

    gb(); gl(); pu(); fd(); qtr(); fd(); qtl()
    pd()
    gs(x)
    numberInBabylonian(numberToCode)

# Egyptian number system
def egyptianNumeration(numberToCode):
    g = 6  # Grid size
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
        etl(); pu(); gsX(x / 2); fd(); qtl()
        pd(); gs(x)

    # Lotus
    def tenPowerThree():
        x = valGsX()
        # Bottom
        gs(x / 2 * 3); cr(); cr(); qtr(); fdn(2)
        # Stem
        pu(); fdn(-1); qtr(); fd(); pd(); gs(x)
        etl(); fd(); fdn(-1); qtr()
        fd(); fdn(-1); etl(); gs(x / 2 * 15)
        fd()
        # Flower
        gsX(x); gsY(x / 2); qtr(); cl(); etl()
        fd(); qtr(); fd(); etl(); cl()
        gsX(x / 2 * 3); gsY(x); cl(); cl()
        # Move to the right of the drawing, facing north
        pu(); qtr(); gs(x / 2); fdn(18); qtl()
        fdn(3); qtl(); pd(); gs(x)

    # Index
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
        cr(); etr(); gs(x * 2); cr(); pu()
        tetr(); gs(x); fd(); pd(); dp()
        # Back
        pu(); ht(); fd(); pd(); qtr()
        gsY(x / 2); gsX(x); cl(); gsX(x / 2 * 7)
        gsY(x * 2); cr()
        # Tail
        etl(); gsX(x * 3); gsY(x * 2); cl()
        ht(); gsX(x * 4); gsY(x * 3)
        cr(); tetl(); gsX(x / 2); gsY(x); cr()
        # Put the robot to the right of the drawing, facing
        # north
        pu(); ht(); gsX(x * 5); fd(); qtl()
        gs(x); pd()

    # A genie
    def head():
        x = valGsX()
        cl(); cl(); etr(); gsX(x / 2); cl()
        etl(); gsX(x / 2 * 3)
        gsY(x * 2); cl()
        # Headdress
        pu(); gs(x); qtl(); fd(); pd(); etr()
        gs(x / 2)
        fd(); cl(); etl(); cl(); pu(); etl(); fd()
        pd(); qtl(); fd(); cr()
        etr(); cr()
        pu(); qtl(); gsX(x / 2 * 3)
        gsY(x * 2); fd(); pd(); gs(x)

    def rightArm():
        x = valGsX()
        gsY(x * 3); fd(); gs(x / 2); tetl()
        cl(); etl(); cl()
        pu(); ht(); gsX(x / 2); gsY(x * 3)
        fd(); pd(); gs(x)

    def leftArm():
        x = valGsX()
        gsY(x * 3); fd(); gs(x / 2); tetr()
        cr(); etr(); cr()
        pu(); ht(); gsX(x / 2); gsY(x * 3)
        fd(); pd(); gs(x)

    # Genie of the million
    def tenPowerSix():
        x = valGsX()
        # Left thigh
        pu(); qtr(); gsX(x / 2); fd(); qtl()
        pd(); gs(x * 2); cr()
        # Right side of the body
        etl(); gsX(x / 2); cl(); etr(); gsX(x)
        gsY(x * 4); cl(); etr()
        # Right arm, head, left arm
        gs(x); rightArm(); gsX(x / 2 * 7)
        gsY(x * 2); cl(); gs(x)
        leftArm(); pu(); etr(); fd(); pd()
        tetr(); head()
        # Left side of the body
        tetr(); gsY(x * 3); cl(); gsX(x / 2)
        gsY(x * 3); cl(); etr()
        gsX(x); gsY(x * 2); cr(); gs(x)
        # Left leg
        tetl(); gsX(x / 2); fd(); fdn(-9)
        # Right leg and thigh
        pu(); gsY(x / 2 * 3); gsX(x / 2)
        etl(); fd(); pd(); gsX(x / 2)
        gsY(x * 2); qtl(); fd(); ht()
        gsX(x * 2); gsY(x / 2 * 3); fd()
        # Put the robot to the right of the drawing, facing
        # north
        pu(); gsX(x * 7 / 2); gsY(x * 2); fd()
        gs(x); tetl(); pd()

    # Size of the hieroglyphs of 10 to the power p
    def width(p):
        if p == 6:
            return 6
        elif p == 5:
            return 10
        elif p in (3, 2):
            return 3
        elif p == 1:
            return 2
        else:
            return 0

    def height(p):
        if p in (6, 4, 3):
            return 11
        elif p == 5:
            return 4
        elif p in (2, 1, 0):
            return 3
        else:
            return 0

    # Layout of the hieroglyphs
    def rows(digit):
        if digit in (1, 2, 3):
            return 1
        elif digit in (4, 5, 6, 7, 8):
            return 2
        elif digit == 9:
            return 3
        else:
            return 0

    # Number of columns of the 1st and 2nd row
    def columnsRow1(digit):
        if digit == 1:
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
        if digit == 4:
            return 2
        elif digit in (5, 6, 9):
            return 3
        elif digit in (7, 8):
            return 4
        else:
            return 0

    # Spaces between the rows and between the columns
    def rowSpace(p, digit):
        if digit == 0:
            return 0
        elif digit >= 4 and digit <= 8 and (p == 3 or p == 4):
            return 2
        else:
            return 1

    def columnSpace(p, digit):
        if digit < 2 or digit > 9:
            return 0
        elif p == 5:
            return -2
        elif p >= 0 and p <= 6:
            return 1
        else:
            return 0

    # Width of a hieroglyph and of the space that
    # follows it
    def step(p, digit):
        return width(p) + columnSpace(p, digit)

    # Grid size when writing horizontally or
    # vertically
    def gridH(p, digit):
        x = valGsX()
        if (p == 3 or p == 4) and digit >= 4 and digit <= 8:
            return x / 11 * 5
        elif (p == 3 or p == 4) and digit == 9:
            return x / 22 * 7
        elif p <= 2 and p >= 0:
            return x / 2
        elif p == 5:
            return x / 4 * 3
        else:
            return x

    def gridV(p):
        if p >= 3 and p <= 6:
            return valGsX() / 4 * 3
        else:
            return valGsX() / 2

    # Width of a column in the hybrid
    # representation
    def coefficientWidth(previousValue, p, number):
        digit = number % 10
        v = columnsRow1(digit) * step(p, digit) + width(p) if columnsRow1(digit) == columnsRow2(digit) - 1 else columnsRow1(digit) * step(p, digit)
        maximum = max(v, previousValue)
        if number < 10:
            return maximum
        else:
            return coefficientWidth(maximum, p + 1, number // 10)

    # Move the robot, pen up, by n times the grid
    # size, to the right if n >= 0, to the left otherwise
    def spacing(n):
        x = valGsX()
        pu()
        if n > 0:
            qtr(); gs(x * n); fd(); qtl()
        else:
            qtl(); gs(-(x * n)); fd(); qtr()
        pd(); gs(x)

    # Write the digit ch of the 10 to the power p,
    # horizontally if h is True
    def writeDigitInHieroglyphs(h, p, ch):
        c = columnsRow1(ch)
        x = valGsX()
        if ch != 0:
            if h:
                gs(gridH(p, ch))
                if c == columnsRow2(ch) - 1:
                    spacing(step(p, ch) / 2)
            else:
                gs(gridV(p))
                spacing(-((columnsRow1(ch) * step(p, ch) - columnSpace(p, ch)) / 2))
            for j in range(rows(ch)):
                for i in range(c):
                    if p == 6:
                        tenPowerSix()
                    elif p == 5:
                        tenPowerFive()
                    elif p == 4:
                        tenPowerFour()
                    elif p == 3:
                        tenPowerThree()
                    elif p == 2:
                        tenPowerTwo()
                    elif p == 1:
                        tenPowerOne()
                    elif p == 0:
                        tenPowerZero()
                    else:
                        pass
                    # Next column
                    spacing(columnSpace(p, ch))
                # Next row
                pu(); fdn(height(p) + rowSpace(p, ch)); pd()
                spacing(-(c * step(p, ch)))
                if c == columnsRow2(ch) - 1:
                    spacing(-(step(p, ch) / 2))
                    c = columnsRow2(ch)
            # Get into position to draw the next ch
            if h:
                spacing(c * step(p, ch) - columnSpace(p, ch))
                pu()
                fdn(-(rows(ch) * (height(p) + rowSpace(p, ch))))
                pd()
                spacing(2)
                if p >= 1 and p <= 4:
                    spacing(1)
            else:
                spacing((c * step(p, ch) - columnSpace(p, ch)) / 2)
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

    horizontally = True
    if numberToCode >= 1000000000:
        message("Too large for Egyptian hieroglyphs.")
    # Initialisation
    else:
        hideRobot()
        gb(); gl(); gs(12); pu(); fd(); qtr(); fd()
        qtl(); pd(); gs(g)
        spacing(2)
        # Classical representation
        if numberToCode < 2000000:
            writeNumberInHieroglyphs(horizontally, 0, numberToCode)
        # Hybrid representation and large numbers
        if numberToCode >= 2000:
            gb(); gl(); gs(12); pu(); fd(); qtr(); fd()
            qtl(); pd(); gs(g)
            spacing(2)
            # Column of the highest power (genie, tadpole,
            # index or lotus) to be multiplied
            pf = highestPower(numberToCode)
            p = pf if pf == 3 else pf - 1 if pf == 4 else pf - 2
            coefficient = numberToCode // tenPower(p)
            l = coefficientWidth(width(p), 0, coefficient)
            spacing(l / 2)
            writeNumberInHieroglyphs(not horizontally, 0, coefficient)
            writeDigitInHieroglyphs(not horizontally, p, 1)
            gb(); gs(12); pu(); fn(); fd(); pd()
            gs(g)
            spacing(l / 2 + 1)
            # Row of the rest of the number
            writeNumberInHieroglyphs(horizontally, 0, numberToCode % tenPower(p))

# Greek number system
def greekNumeration(numberToCode):
    x = 2  # Grid size
    w = 1  # Pen width
    talent = 6000
    drachma = 6
    obol = 1
    def spacing():
        pu(); qtr(); fdn(2); qtl(); pd()

    def one():
        pw(w * 2); fdn(9); fdn(-9); pw(w)

    def oneDrachma():
        pw(w * 2); fdn(9); fdn(-4); qtr(); fdn(2); pu()
        qtl()
        fdn(-5); pd(); pw(w)

    def oneTalent():
        pw(w * 2); pu(); qtr(); fdn(3); qtl(); pd()
        fdn(9); qtl()
        fdn(3); fdn(-6); fdn(3); qtr(); fdn(-9); pu()
        qtr()
        fdn(3); qtl(); pd(); pw(w)

    def five():
        pw(w * 2)
        fdn(9); qtr(); fdn(6); qtr(); fdn(4)
        pu(); fdn(5); ht(); pd()
        pw(w)

    def fiveTalents():
        pw(w * 2)
        fdn(9); qtr(); fdn(6); qtr(); fdn(3); qtr()
        fdn(3)
        qtl(); fdn(2); fdn(-2); qtr(); fdn(3); pu()
        fdn(-6)
        qtr(); fdn(-6); pd(); pw(w)

    def ten(bigSize):
        if bigSize:
            gs(x * 3); pw(w * 2)
        gsY(valGsY() * 3); etr(); fd(); qtr()
        fd(); tetr(); fdn(2)
        pu(); ht(); fdn(2); qtl(); pd()
        gs(x); pw(w)

    def tenTalents(bigSize):
        if bigSize:
            gs(x * 3); pw(w * 2)
        pu(); gsY(valGsY() / 3 * 2); fd(); pd()
        gsY(valGsY() * 7 / 2); etr()
        fd()
        qtr(); fd(); tetr(); fd(); qtl()
        gsY(valGsY() * 2 / 7); fd(); fdn(-1)
        qtr(); fd(); pu(); fdn(-2); qtr(); fdn(-1)
        pd(); gs(x); pw(w)

    def fifty():
        pu(); gs(x / 2); fdn(11)
        gs(x); qtr(); fdn(2); qtl()
        pd()
        ten(False)
        pu(); qtl(); fdn(4); qtl()
        gs(x / 2); fdn(11)
        gs(x)
        ht(); pd()
        five()

    def fiftyTalents():
        pu(); gs(x / 2); fdn(11)
        gs(x); qtr(); fdn(2); qtl()
        pd()
        tenTalents(False)
        pu(); qtl(); fdn(4); qtl()
        gs(x / 2); fdn(11)
        gs(x)
        ht(); pd()
        five()

    def hundred(bigSize):
        if bigSize:
            gs(x * 3); pw(w * 2)
        fdn(3); gsY(valGsY() / 2); fdn(-3); qtr()
        fdn(2); qtl()
        fdn(3); fdn(-6); gs(x); pw(w)

    def hundredTalents(bigSize):
        if bigSize:
            gs(x * 3); pw(w * 2)
        fdn(3); gsY(valGsY() / 2); fdn(-3); qtr()
        fd(); qtr()
        gsY(valGsY() * 4 / 3); fd(); fdn(-1)
        qtl(); fd(); qtl()
        gsY(valGsY() * 3 / 4); fdn(3); fdn(-6)
        gs(x); pw(w)

    def fiveHundred():
        pu(); fdn(5); qtr(); fdn(4); qtl(); pd()
        hundred(False)
        pu(); qtl(); fdn(6); qtl(); fdn(5); ht()
        pd()
        five()

    def fiveHundredTalents():
        pu(); fdn(5); qtr(); fdn(4); qtl(); pd()
        hundredTalents(False)
        pu(); qtl(); fdn(6); qtl(); fdn(5); ht()
        pd()
        five()

    def thousand(bigSize):
        if bigSize:
            gs(x * 3); pw(w * 2)
        gsX(valGsX() * 2); gsY(valGsY() * 3)
        etr(); fd()
        pu(); tetl(); fd(); tetl(); pd(); fd()
        tetl(); gs(x); pw(w)

    def thousandTalents(bigSize):
        if bigSize:
            gs(x * 3); pw(w * 2)
        gsY(valGsY() / 3 * 2); pu(); qtr(); fd()
        qtl(); pd(); fd(); qtr()
        fd(); fdn(-2); etl(); gsX(valGsX() * 2)
        gsY(valGsY() * 7 / 2)
        fd(); pu(); tetl(); fd(); tetl(); pd()
        fd(); tetl()
        gsY(valGsY() * 2 / 7)
        pu(); fdn(-1); pd(); gs(x); pw(w)

    def fiveThousand():
        pu(); gs(x / 2); fdn(11)
        gs(x); qtr(); fdn(2); qtl()
        pd()
        thousand(False)
        pu(); qtl(); fdn(4); qtl()
        gs(x / 2); fdn(11)
        gs(x)
        ht(); pd()
        five()

    def fiveThousandTalents():
        pu(); gs(x / 2); fdn(11)
        gs(x); qtr(); fdn(2); qtl()
        pd()
        thousandTalents(False)
        pu(); qtl(); fdn(4); qtl()
        gs(x / 2); fdn(11)
        gs(x)
        ht(); pd()
        five()

    def tenThousand(bigSize):
        if bigSize:
            gs(x * 3); pw(w * 2)
        fdn(3); gsY(valGsY() * 2); tetr(); fd()
        qtl(); fd()
        gsY(valGsY() / 2); tetr(); fdn(3); ht()
        gs(x); pw(w)

    def fiftyThousand():
        pu(); gs(x / 2); fdn(11)
        gs(x); qtr(); fdn(2); qtl()
        pd()
        tenThousand(False)
        pu(); qtl(); fdn(4); qtl()
        gs(x / 2); fdn(11)
        gs(x)
        ht(); pd()
        five()

    def writeDigit(bigNumber, unit, powerOfTen, digit):
        if unit == talent:
            for i in range(digit // 5):
                if powerOfTen == 0:
                    fiveTalents()
                elif powerOfTen == 1:
                    fiftyTalents()
                elif powerOfTen == 2:
                    fiveHundredTalents()
                elif powerOfTen == 3:
                    fiveThousandTalents()
                else:
                    pass
                spacing()
            for i in range(digit % 5):
                if powerOfTen == 0:
                    oneTalent()
                elif powerOfTen == 1:
                    tenTalents(True)
                elif powerOfTen == 2:
                    hundredTalents(True)
                elif powerOfTen == 3:
                    thousandTalents(True)
                else:
                    pass
                spacing()
        elif unit == drachma:
            for i in range(digit // 5):
                if powerOfTen == 0:
                    five()
                elif powerOfTen == 1:
                    fifty()
                elif powerOfTen == 2:
                    fiveHundred()
                elif powerOfTen == 3:
                    fiveThousand()
                elif powerOfTen == 4:
                    fiftyThousand()
                else:
                    pass
                spacing()
            for i in range(digit % 5):
                if powerOfTen == 0:
                    if bigNumber:
                        oneDrachma()
                    else:
                        one()
                elif powerOfTen == 1:
                    ten(True)
                elif powerOfTen == 2:
                    hundred(True)
                elif powerOfTen == 3:
                    thousand(True)
                elif powerOfTen == 4:
                    tenThousand(True)
                else:
                    pass
                spacing()
        elif unit == obol:
            for i in range(digit):
                one()
                spacing()

    def writeNumber(b, u, p, c):
        if c < 10:
            writeDigit(b, u, p, c)
        else:
            writeNumber(b, u, p + 1, c // 10)
            writeDigit(b, u, p, c % 10)

    def writeNumberInGreek(c):
        bigNumber = True
        if c >= 100000:
            writeNumber(bigNumber, talent, 0, c // 6 // 6000)
            writeNumber(bigNumber, drachma, 0, c // 6 % 6000)
            writeNumber(bigNumber, obol, 0, c % 6)
        else:
            writeNumber(not bigNumber, drachma, 0, c)

    pw(w); gb(); gl(); pu(); fne(); fd(); fn()
    pd(); gs(x)
    writeNumberInGreek(numberToCode)

# Roman number system
def romanNumeration(numberToCode):
    x = 3  # Grid size
    def spacing(n):
        pu(); qtr(); fdn(n); qtl(); pd()

    def one():
        fdn(6); fdn(-6)
        spacing(2)

    def five():
        pu(); fdn(6); pd(); tetr()
        gsX(x * 2)
        gsY(x * 6)
        fd()
        qtl(); fd(); pu(); tetr(); fd(); ht()
        pd(); gs(x)
        spacing(2)

    def ten():
        gsX(x * 4)
        gsY(x * 6); etr(); fd(); pu()
        tetl()
        fd(); pd()
        tetl(); fd(); pu(); tetl(); pd()
        gs(x)
        spacing(2)

    def fifty():
        fdn(6); fdn(-6); qtr(); fdn(4)
        qtl()
        spacing(2)

    def hundred():
        pu(); gsX(x * 4)
        gsY(x * 2); etr(); fd(); pd()
        gsX(x * 2)
        tetr(); cr(); gsY(x * 3); cr()
        cr(); gsY(x * 2)
        cr(); pu()
        fdn(2); ht(); pd(); gs(x)
        spacing(2)

    def fiveHundred():
        fdn(6); qtr(); fdn(1); gs(x * 3)
        cr(); cr(); gs(x)
        fd()
        pu(); fdn(-4); qtr(); pd()
        spacing(2)

    def thousand():
        fdn(6); gsX(x * 2)
        gsY(x * 5); tetr(); fd()
        qtl()
        fd()
        gs(x); tetr(); fdn(6); ht()
        spacing(2)

    def overline(n):
        pu(); fdn(8); qtl(); fdn(2); pd(); fdn(n - 2)
        fdn(-(n - 2))
        pu(); fdn(-2); qtr(); fdn(-8); pd()

    def startFactorHundredThousand():
        fdn(8); qtr(); fdn(2); fdn(-2); qtl(); fdn(-8)
        spacing(2)

    def endFactorHundredThousand():
        fdn(8); qtl(); fdn(2); fdn(-2); qtr(); fdn(-8)
        spacing(4)

    def writeNumberInRoman(n):
        if n >= 1000:
            thousand(); writeNumberInRoman(n - 1000)
        elif n >= 950:
            fifty(); thousand()
            writeNumberInRoman(n - 950)
        elif n >= 900:
            hundred(); thousand(); writeNumberInRoman(n - 900)
        elif n >= 500:
            fiveHundred(); writeNumberInRoman(n - 500)
        elif n >= 400:
            hundred(); fiveHundred()
            writeNumberInRoman(n - 400)
        elif n >= 100:
            hundred(); writeNumberInRoman(n - 100)
        elif n >= 90:
            ten(); hundred(); writeNumberInRoman(n - 90)
        elif n >= 50:
            fifty(); writeNumberInRoman(n - 50)
        elif n >= 40:
            ten(); fifty(); writeNumberInRoman(n - 40)
        elif n >= 10:
            ten(); writeNumberInRoman(n - 10)
        elif n >= 9:
            one(); ten()
        elif n >= 5:
            five(); writeNumberInRoman(n - 5)
        elif n >= 4:
            one(); five()
        elif n >= 1:
            one(); writeNumberInRoman(n - 1)
        elif n == 0:
            pass

    def width(n):
        if n >= 1000:
            return 6 + width(n - 1000)
        elif n >= 950:
            return 2 * 6 + width(n - 950)
        elif n >= 900:
            return 2 * 6 + width(n - 900)
        elif n >= 500:
            return 6 + width(n - 500)
        elif n >= 400:
            return 2 * 6 + width(n - 400)
        elif n >= 100:
            return 6 + width(n - 100)
        elif n >= 90:
            return 2 * 6 + width(n - 90)
        elif n >= 50:
            return 6 + width(n - 50)
        elif n >= 40:
            return 2 * 6 + width(n - 40)
        elif n >= 10:
            return 6 + width(n - 10)
        elif n >= 9:
            return 2 + 6
        elif n >= 5:
            return 6 + width(n - 5)
        elif n >= 4:
            return 2 + 6
        elif n >= 1:
            return 2 + width(n - 1)
        else:
            return 0

    def numberInRoman(n):
        if n >= 500000000:
            message("Too large for Roman numerals.")
        elif n >= 100000:
            startFactorHundredThousand()
            writeNumberInRoman(n // 100000)
            overline(width(n // 100000))
            endFactorHundredThousand()
            numberInRoman(n % 100000)
        elif n < 5000:
            writeNumberInRoman(n)
        else:
            writeNumberInRoman(n // 1000)
            overline(width(n // 1000))
            spacing(2)
            writeNumberInRoman(n % 1000)

    gl(); gb(); pu(); fd(); qtr(); fd(); qtl()
    pd(); gs(x)
    spacing(2)
    numberInRoman(numberToCode)

# Hexadecimal number system
def decimalToHexadecimal(n):
    if n < 0:
        label("-"); translate(1, 0)
        decimalToHexadecimal(-n)
    elif n >= 16:
        decimalToHexadecimal(n // 16)
        decimalToHexadecimal(n % 16)
    elif n == 15:
        label("F"); translate(1, 0)
    elif n == 14:
        label("E"); translate(1, 0)
    elif n == 13:
        label("D"); translate(1, 0)
    elif n == 12:
        label("C"); translate(1, 0)
    elif n == 11:
        label("B"); translate(1, 0)
    elif n == 10:
        label("A"); translate(1, 0)
    else:
        label(str(n)); translate(1, 0)

# Decimal number system
def decimalToDecimal(n):
    if n < 0:
        label("-"); translate(1, 0)
        decimalToDecimal(-n)
    elif n >= 10:
        decimalToDecimal(n // 10)
        decimalToDecimal(n % 10)
    else:
        label(str(n)); translate(1, 0)

# Octal number system
def decimalToOctal(n):
    if n < 0:
        label("-"); translate(1, 0)
        decimalToOctal(-n)
    elif n >= 8:
        decimalToOctal(n // 8)
        decimalToOctal(n % 8)
    else:
        label(str(n)); translate(1, 0)

# Ternary number system
def decimalToTernary(n):
    if n < 0:
        label("-"); translate(1, 0)
        decimalToTernary(-n)
    elif n == 0:
        label("0"); translate(1, 0)
    elif n == 1:
        label("1"); translate(1, 0)
    elif n == 2:
        label("2"); translate(1, 0)
    else:
        decimalToTernary(n // 3)
        decimalToTernary(n % 3)

# Binary number system
def decimalToBinary(n):
    if n < 0:
        label("-"); translate(1, 0)
        decimalToBinary(-n)
    elif n == 0:
        label("0"); translate(1, 0)
    elif n == 1:
        label("1"); translate(1, 0)
    else:
        decimalToBinary(n // 2)
        decimalToBinary(n % 2)

# Number to code
numberToCode = 123456789

# Announce the coding in the number system name
def announce(name):
    message("Coding of " + str(numberToCode) + " in the " + name + " number system.")

# Wait before going on to the next number system
def nextSystem():
    beep(); beep(); markPause(); bg(white)

# Write in large digits at the bottom left
def inDigits():
    gs(16); textFont(courier); textStyle(bold)
    textSize(24); gb(); gl()

announce("Babylonian")
babylonianNumeration(numberToCode); nextSystem()
announce("Egyptian")
egyptianNumeration(numberToCode); nextSystem()
announce("Greek")
greekNumeration(numberToCode); nextSystem()
announce("Roman")
romanNumeration(numberToCode); nextSystem()
inDigits(); announce("hexadecimal")
decimalToHexadecimal(numberToCode); nextSystem()
inDigits(); announce("decimal")
decimalToDecimal(numberToCode); nextSystem()
inDigits(); announce("octal")
decimalToOctal(numberToCode); nextSystem()
inDigits(); announce("ternary")
decimalToTernary(numberToCode); nextSystem()
inDigits(); announce("binary")
decimalToBinary(numberToCode); nextSystem()
