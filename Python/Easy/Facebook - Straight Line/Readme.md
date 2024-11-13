Given an array of three points, return True if the points are on a straight line, and False if they are not.

Examples:
Example #1
Input: points = [[2, 1], [3, 4], [5, 6]]

Output: False

Example #2
Input: points = [[0, 0], [1, 1], [2, 2]]

Output: True


Python Code:
def on_straight_line(points):
  x1, y1 = points[0]
  x2, y2 = points[1]
  x3, y3 = points[2]
  
  if (y2 - y1) * (x3 - x1) == (y3 - y1) * (x2 - x1):
    return True
  else:
	  return False