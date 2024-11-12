Write a function to get the intersection of two lists.

For example, if A = [1, 2, 3, 4, 5], and B = [0, 1, 3, 7] then you should return [1, 3].


Python Code:
def intersection(a, b):
  c = []
  for i in range(len(a)):
    for j in range(len(b)):
      if a[i] == b[j]:
        c.append(a[i])
  return c