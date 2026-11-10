from LibRobot import *

# Écrire un nombre en base 3
def decimalEnTernaire(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnTernaire(-n)
    elif n == 0:
        ecrire("0"); translater(1, 0)
    elif n == 1:
        ecrire("1"); translater(1, 0)
    elif n == 2:
        ecrire("2"); translater(1, 0)
    else:
        decimalEnTernaire(n // 3)
        decimalEnTernaire(n % 3)

lg(7); decimalEnTernaire(123456789); st()
