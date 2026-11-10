from LibRobot import *

# Write a number in base 16
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
        label(intToString(n)); translate(1, 0)

gs(7); decimalToHexadecimal(123456789); st()
