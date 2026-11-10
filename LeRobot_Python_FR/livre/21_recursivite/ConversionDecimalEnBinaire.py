from LibRobot import *

# Écrire un nombre en base 2
def decimalEnBinaire(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnBinaire(-n)
    elif n == 0:
        ecrire("0"); translater(1, 0)
    elif n == 1:
        ecrire("1"); translater(1, 0)  # n >= 2
    else:
        decimalEnBinaire(n // 2)
        decimalEnBinaire(n % 2)

lg(7); decimalEnBinaire(123456789); st()
