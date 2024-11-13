Given an integer num, return its string representation in base 13.

In case you don’t use base 13 that much (who does, right?), here’s a quick rundown: just like base 10 uses digits from 0 to 9. But also for 10, 11 and 12, we use the letters A, B, and C.

For example:

9 in base 13 is still "9"
10 in base 13 is "A"
11 in base 13 is "B"
12 in base 13 is "C"
13 in base 13 is "10"
14 in base 13 is "11"
49 in base 13 is "3A" (since 
3
∗
13
+
10
=
49
3∗13+10=49)
69 in base 13 is "54" (since 
5
∗
13
+
4
=
69
5∗13+4=69)


Python Code:

def convertToBase13(num):
  if num == 0:
    return "0"
    
  base_chars = "0123456789ABC"
  result = ""
  
  is_negative = num < 0
  num = abs(num)
  
  while num > 0:
    remainder = num % 13
    result = base_chars[remainder] + result
    num //= 13
    
  if is_negative:
    result = "-" + result
  
  return result
