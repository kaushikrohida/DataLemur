Given an list of integers called input, return True if any value appears at least twice in the array. Return False if every element in the input list is distinct.

For example, if the input list was [1,3,5,7,1], then return True because the number 1 shows up twice.

However, if the input was [1,3,5,7] then return False, because every element of the list is distinct.


Python Code:
Solution 01: Brute-Force Way
def contains_duplicate(input)-> bool:
  for i in range(len(input)-1):
    for j in range(i+1, len(input)):
      if input[i] == input[j]:
        return True
  return False



Solution 02: Sorting the Input List
def contains_duplicate(input):
  input.sort()
  for i in range(len(input)-1):
      if (input[i] == input[i+1]):
          return True
  return False


Solution 03: Using a Dictionary
def contains_duplicate(input):
  seen = {}
  for i in input:
    if i in seen:
      return True
    seen[i] = True
  return False