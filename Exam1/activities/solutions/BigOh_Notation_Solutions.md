# Big O Notation Solutions

## Example 1: Use the definition of O to show that 30n² + 12n + 15 = O(n²)

**Proof:**
We need to find constants c > 0 and n₀ such that 30n² + 12n + 15 ≤ c·n² for all n ≥ n₀.

For n ≥ 1, we have:

- 12n ≤ 12n²
- 15 ≤ 15n²

Therefore:
30n² + 12n + 15 ≤ 30n² + 12n² + 15n² = 57n²

Choose c = 57 and n₀ = 1.
For all n ≥ 1: 30n² + 12n + 15 ≤ 57n²

Therefore, 30n² + 12n + 15 = O(n²). 

## Example 2: Use the definition of Ω to show that 30n² + 12n + 15 = Ω(n²)

**Proof:**
We need to find constants c > 0 and n₀ such that 30n² + 12n + 15 ≥ c·n² for all n ≥ n₀.

For n ≥ 1:
30n² + 12n + 15 ≥ 30n²

Choose c = 30 and n₀ = 1.
For all n ≥ 1: 30n² + 12n + 15 ≥ 30n²

Therefore, 30n² + 12n + 15 = Ω(n²). 

## Example 3: Use the definition of Θ to show that 30n² + 12n + 15 = Θ(n²)

**Proof:**
By definition, f(n) = Θ(g(n)) if and only if f(n) = O(g(n)) and f(n) = Ω(g(n)).

From Example 1: 30n² + 12n + 15 = O(n²)
From Example 2: 30n² + 12n + 15 = Ω(n²)

Therefore, 30n² + 12n + 15 = Θ(n²). 

## Example 4: Use the definition of "big Oh" to show that 2n² - 6n = O(n²)

**Proof:**
We need to find constants c > 0 and n₀ such that 2n² - 6n ≤ c·n² for all n ≥ n₀.

For n ≥ 3, we have n² ≥ n, so 6n ≤ 6n².
Therefore: 2n² - 6n ≤ 2n² - 0 = 2n²

But we need to be more careful. Let's choose n₀ = 3.
For n ≥ 3: 6n ≤ 2n² (since 6n ≤ 2n² when n ≥ 3)
Therefore: 2n² - 6n ≥ 2n² - 2n² = 0

Actually, let's approach this differently:
2n² - 6n ≤ 2n² for all n ≥ 1

Choose c = 2 and n₀ = 1.
For all n ≥ 1: 2n² - 6n ≤ 2n²

Therefore, 2n² - 6n = O(n²). 

## Example 5: Use the definition of "big Omega" to show that 2n² - 6n = Ω(n₀)

**Proof:**
We need to find constants c > 0 and n₀ such that 2n² - 6n ≥ c·n₀ for all n ≥ n₀.

For large n, the 2n² term dominates, so we need to find when 2n² - 6n ≥ c·n₀.

Rearranging: 2n² - 6n ≥ c·n₀
2n² - c·n₀ ≥ 6n
n₀(2 - c) ≥ 6n
n₀(2 - c) ≥ 6

Choose c = 1. Then we need n₀(2 - 1) ≥ 6, so n₀ ≥ 6.
Choose n₀ = 3 (since 3Ω = 9 ≥ 6).

For n ≥ 3: 2n² - 6n ≥ n₀

Therefore, 2n² - 6n = Ω(n₀). 

## Example 6: Conclusion?

From Examples 4 and 5:

- 2n² - 6n = O(n₀)
- 2n² - 6n = Ω(n₀)

Therefore, 2n² - 6n = Ω(n₀).

## Example 7: Find the mistakes in the following "proofs"

**First "proof" mistake:**
The error is using C = -4, which violates the requirement that c > 0. Constants in Big O definitions must be positive.

**Second "proof" mistake:**
Again, C = -4 < 0, which is invalid. Additionally, the inequality 2n² - 6n ≥ -4n³ doesn't establish that 2n² - 6n = Ω(n₀), because we need 2n² - 6n ≥ c·n₀ for some positive c.

## Example 8, 9 & 10

Beyond the scope of this course. See me in office hours if you'd like to learn more.

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
