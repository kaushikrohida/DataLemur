Given a positive integer 
n
n, the Collatz sequence for 
n
n is generated by repeatedly applying the following operations:

If 
n
n is even, then 
n
=
n
/
2
n=n/2.
If 
n
n is odd, then 
n
=
3
∗
n
+
1
n=3∗n+1.
Repeat the above steps until 
n
n becomes 1.


Your task is to return the number of steps required to reduce 
n
n to 1.

Example #1
Input: 
n
=
3
n=3

Output: 7

Explanation:

The output is 7, because there were 7 Collatz steps taken:

3 ─> 10 ─> 5 ─> 16 ─> 8 ─> 4 ─> 2 ─> 1

Here's the math behind the 7 steps:

Given 3 is odd, so 
3
∗
n
+
1
=
10
3∗n+1=10

Given 10 is even, so 
n
/
2
=
5
n/2=5

Given 5 is odd, so 
3
∗
n
+
1
=
16
3∗n+1=16

Given 16 is even, so 
n
/
2
=
8
n/2=8

Given 8 is even, so 
n
/
2
=
4
n/2=4

Given 4 is even, so 
n
/
2
=
2
n/2=2

Given 2 is even, so 
n
/
2
=
1
n/2=1



Python Code:
def collatzSteps(n):
  count = 0
  while n != 1:
    if n % 2 == 0:
      n = n / 2
    else:
      n = 3 * n + 1
    count += 1
  return count