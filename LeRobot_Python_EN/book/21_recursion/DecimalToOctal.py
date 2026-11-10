from LibRobot import *

# Write a number in base 8
def decimalToOctal(n):
    if n < 0:
        label("-"); translate(1, 0)
        decimalToOctal(-n)
    elif n >= 8:
        decimalToOctal(n // 8)
        decimalToOctal(n % 8)
    else:
        label(intToString(n)); translate(1, 0)

gs(7); decimalToOctal(123456789); st()
