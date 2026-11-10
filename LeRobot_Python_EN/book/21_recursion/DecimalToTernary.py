from LibRobot import *

# Write a number in base 3
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

gs(7); decimalToTernary(123456789); st()
