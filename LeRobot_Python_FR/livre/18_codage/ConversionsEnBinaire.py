from LibRobot import *

# Conversions entre numérations binaire et décimale
# (corrigé des exercices du chapitre 18)

# Écriture de n en base deux
def decimalEnBinaire(n):
    if n < 0:
        return "-" + decimalEnBinaire(-n)
    elif n < 2:
        return str(n)
    else:
        return decimalEnBinaire(n // 2) + decimalEnBinaire(n % 2)

# Écriture de n (0 <= n < 256) en base deux sur un
# octet, suivie d'un blanc
def decimalEnOctet(n):
    if n < 0 or n >= 256:
        message("Nombre hors de [0, 255] dans decimalEnOctet")
        st()
    b = decimalEnBinaire(n)
    return "0" * (8 - len(b)) + b + " "

# Code ASCII du caractère c, en binaire
def octet(c):
    return decimalEnOctet(ord(c))

lg(7)
message("Ecriture de  127  en binaire")
ecrire(decimalEnBinaire(127))
eb(); ag(); marquerUnePause()
cf(blanc)
message("Ecriture de  " + decimalEnBinaire(13653) + "  en décimal")
ecrire(str(13653))
eb(); ag(); marquerUnePause()
cf(blanc)
message(octet("D") + octet("e") + octet("s") + octet("c") + octet("a") + octet("r") + octet("t") + octet("e") + octet("s"))
ecrire("Descartes")
eb(); ag(); marquerUnePause()
