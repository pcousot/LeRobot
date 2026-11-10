from LibRobot import *

# Dessiner une paire de lunettes
def verre():
    vd(); avf(5); vd(); avf(2); vd(); avf(5); vd(); avf(2)
    vd(); avf(5); vd(); pdt()

def pont():
    vd(); vd(); pdt()

def branche():
    phtd(); avf(7); phtd(); vd(); avf(3); vd(); pdt()
    vg(); avf(3); vg(); phtg(); avf(7); p3htd()

lg(6); branche(); verre(); pont(); verre()
branche(); st()
