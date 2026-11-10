from LibRobot import *

# Conversions between binary and decimal notation
# (solution of the exercises of chapter 18)

# n written in base two
def decimalToBinary(n):
    if n < 0:
        return "-" + decimalToBinary(-n)
    elif n < 2:
        return str(n)
    else:
        return decimalToBinary(n // 2) + decimalToBinary(n % 2)

# n (0 <= n < 256) written in base two on one byte,
# followed by a blank
def decimalToByte(n):
    if n < 0 or n >= 256:
        message("Number outside [0, 255] in decimalToByte")
        st()
    b = decimalToBinary(n)
    return "0" * (8 - len(b)) + b + " "

# ASCII code of the character c, in binary
def byte(c):
    return decimalToByte(ord(c))

gs(7)
message("127  written in binary")
label(decimalToBinary(127))
gb(); gl(); markPause()
bg(white)
message(decimalToBinary(13653) + "  written in decimal")
label(str(13653))
gb(); gl(); markPause()
bg(white)
message(byte("D") + byte("e") + byte("s") + byte("c") + byte("a") + byte("r") + byte("t") + byte("e") + byte("s"))
label("Descartes")
gb(); gl(); markPause()
