Given a number 
n
n, write a formula that returns 
n
!
n!.

In case you forgot the factorial formula, 
n
!
=
n
∗
(
n
−
1
)
∗
(
n
−
2
)
∗
.
.
.
.
.
2
∗
1
n!=n∗(n−1)∗(n−2)∗.....2∗1.

For example, 
5
!
=
5
∗
4
∗
3
∗
2
∗
1
=
120
5!=5∗4∗3∗2∗1=120 so we'd return 120.

Assume is 
n
n is a non-negative integer.

p.s. if this problem seems too trivial, try the follow-up Microsoft interview problem Factorial Trailing Zeroes


Python Code:
def factorial(n):
  ans = 1
  for i in range(1, n+1):
    print(i)
    ans *= i
  return ans