from LibRobot import *

# Écrire un nombre en base 8
def decimalEnOctal(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnOctal(-n)
    elif n >= 8:
        decimalEnOctal(n // 8)
        decimalEnOctal(n % 8)
    else:
        ecrire(entierEnChaine(n)); translater(1, 0)

lg(7); decimalEnOctal(123456789); st()
