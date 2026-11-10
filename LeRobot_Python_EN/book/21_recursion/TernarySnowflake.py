from LibRobot import *

# Ternary snowflake
def tree(l):
    if l > 1:
        fdl(l // 3); rot(45)
        tree(l // 3)
        rot(-45)
        tree(l // 3)
        rot(-45)
        tree(l // 3)
        rot(45); fdl(-(l // 3))

def snowflake(l):
    tree(l); rot(45)
    tree(l); rot(45)
    tree(l); rot(45)
    tree(l); rot(45)
    tree(l); rot(45)
    tree(l); rot(45)
    tree(l); rot(45)
    tree(l); rot(45)

snowflake(162); snowflake(54); st()
