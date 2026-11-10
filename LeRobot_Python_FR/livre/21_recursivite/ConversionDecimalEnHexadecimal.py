from LibRobot import *

# Écrire un nombre en base 16
def decimalEnHexadecimal(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnHexadecimal(-n)
    elif n >= 16:
        decimalEnHexadecimal(n // 16)
        decimalEnHexadecimal(n % 16)
    elif n == 15:
        ecrire("F"); translater(1, 0)
    elif n == 14:
        ecrire("E"); translater(1, 0)
    elif n == 13:
        ecrire("D"); translater(1, 0)
    elif n == 12:
        ecrire("C"); translater(1, 0)
    elif n == 11:
        ecrire("B"); translater(1, 0)
    elif n == 10:
        ecrire("A"); translater(1, 0)
    else:
        ecrire(entierEnChaine(n)); translater(1, 0)

lg(7); decimalEnHexadecimal(123456789); st()
