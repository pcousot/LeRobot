from LibRobot import *

# Definition of the robot's command fdn

# Move forward n times if n is positive, back -n times if
# n is negative, do not move if n is zero.
def fdn(n):
    if n > 0:
        for i in range(n):
            fd()
    elif n < 0:
        ht()
        for i in range(-n):
            fd()
        ht()

fdn(5); fdn(-5); st()
