from LibRobot import *

# Draw a star made of four looped
# astroids
def arc():
    etl(); cr(); etl(); cr(); etl(); cr()

def astroid():
    arc(); tetr(); arc(); tetr(); arc(); tetr()
    arc()

def star():
    astroid(); etr(); astroid(); etr()
    astroid(); etr(); astroid()

star(); st()
