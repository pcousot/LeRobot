from LibRobot import *

# Write a number in base 2
def decimalToBinary(n):
    if n < 0:
        label("-"); translate(1, 0)
        decimalToBinary(-n)
    elif n == 0:
        label("0"); translate(1, 0)
    elif n == 1:
        label("1"); translate(1, 0)  # n >= 2
    else:
        decimalToBinary(n // 2)
        decimalToBinary(n % 2)

gs(7); decimalToBinary(123456789); st()
