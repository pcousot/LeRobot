from LibRobot import *

# Read an integer n and write its factorial n!
nmin = 0
nmax = 20

# Read the value of n from the keyboard, repeating
# until nmin <= n <= nmax
def readN():
    write("n = ")
    n = readInt()
    if nmin <= n and n <= nmax:
        return n
    else:
        writeln("n must be between ", str(nmin), " and ",
                str(nmax), "! Try again.")
        return readN()

n = readN()
# Compute f = n!
f = 1
for i in range(1, n + 1):
    f = f * i
# Write f
writeln("n! = ", str(f))
readln()
