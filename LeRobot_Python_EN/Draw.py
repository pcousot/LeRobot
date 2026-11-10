"""Draw -- interactive drawing with the keyboard and the mouse.

    python3 Draw.py          (or ./robot.sh Draw.py, or double-click
                              LeRobotPythonEN.app)

Keys (recalled in the bottom bar):
  - qtl   + qtr   l etl   r etr   f fd   ( cl   ) cr
  d pd   u pu   c dc   . dg   p dp   * next pen colour (pc)   w paint
  arrow keys: move one step without drawing
  backspace: undo the last command
  Return: end, then y to save the drawing in my_drawing.py
A click (or a move with the button held down) takes the robot, without
drawing, to the grid point nearest to the mouse.
"""
from Interaction import interaction

# (coordinates, turns, drawing, mouse ends, save)
# a mouse click does not end the drawing: only the Return key does
interaction(False, True, True, False, True)
