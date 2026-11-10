from LibRobot import *

# Rounding errors: in mathematics, squaring five times
# the square root of the square root of ...
# of the square root of 2 gives 2 back
x = ((((sqrt(sqrt(sqrt(sqrt(sqrt(2))))) ** 2) ** 2) ** 2) ** 2) ** 2
writeln("Instead of 2 we find ", sprintf("%.17g", x))
writeln("0.1 + 0.2 = ", sprintf("%.17g", 0.1 + 0.2))
writeln("Finish by pressing the Return key")
readln()
