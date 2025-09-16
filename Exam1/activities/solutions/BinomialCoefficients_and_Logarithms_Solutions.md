# Binomial Coefficients and Logarithms Activity - Solutions

## Binomial Coefficients

**Definition**: $\binom{n}{k} = \frac{n!}{k!(n-k)!}$ for all n ≥ k ≥ 0

### Example 1: Calculate: $\binom{10}{3}$

**Solution**:
$$\binom{10}{3} = \frac{10!}{3!(10-3)!} = \frac{10!}{3! \cdot 7!} = \frac{10 \cdot 9 \cdot 8 \cdot 7!}{3! \cdot 7!} = \frac{10 \cdot 9 \cdot 8}{3!} = \frac{720}{6} = 120$$

**Answer**: 120

### Example 2: How many 8-bit strings contain exactly 3 zeros?

**Solution**:
We need to choose 3 positions out of 8 total positions for the zeros. The remaining 5 positions will contain ones.

Number of ways = $\binom{8}{3} = \frac{8!}{3!(8-3)!} = \frac{8!}{3! \cdot 5!} = \frac{8 \cdot 7 \cdot 6}{3 \cdot 2 \cdot 1} = \frac{336}{6} = 56$

**Answer**: 56 strings

### Example 3: Use the definition to simplify each of the following:

**a) $\binom{n}{0}$**

**Solution**:
$$\binom{n}{0} = \frac{n!}{0!(n-0)!} = \frac{n!}{1 \cdot n!} = 1$$

**Answer**: 1

**b) $\binom{n}{n}$**

**Solution**:
$$\binom{n}{n} = \frac{n!}{n!(n-n)!} = \frac{n!}{n! \cdot 0!} = \frac{n!}{n! \cdot 1} = 1$$

**Answer**: 1

### Example 4: Suppose a string of n characters contains only two possible characters: * and |. Write an expression for the number of n-bit strings that contain exactly 2 *'s. Simplify your expression to be written as a polynomial.

**Solution**:
We need to choose 2 positions out of n positions for the * characters.

Number of strings = $\binom{n}{2} = \frac{n!}{2!(n-2)!} = \frac{n(n-1)(n-2)!}{2 \cdot 1 \cdot (n-2)!} = \frac{n(n-1)}{2}$

Expanding: $\frac{n(n-1)}{2} = \frac{n^2 - n}{2} = \frac{1}{2}n^2 - \frac{1}{2}n$

**Answer**: $\frac{1}{2}n^2 - \frac{1}{2}n$ or $\frac{n(n-1)}{2}$

## Logarithms

**Definition**: $y = \log_b x \Leftrightarrow b^y = x$
**Notation**: We use $\lg x$ to represent $\log_2 x$.

### Example 1: Use the definition to determine each of the following:

**a) $\lg 32$**

**Solution**: We need to find y such that $2^y = 32$
Since $32 = 2^5$, we have $\lg 32 = 5$

**Answer**: 5

**b) $\lg 1024$**

**Solution**: We need to find y such that $2^y = 1024$
Since $1024 = 2^{10}$, we have $\lg 1024 = 10$

**Answer**: 10

**c) $\lg 1$**

**Solution**: We need to find y such that $2^y = 1$
Since $1 = 2^0$, we have $\lg 1 = 0$

**Answer**: 0

**d) $\log_3 81$**

**Solution**: We need to find y such that $3^y = 81$
Since $81 = 3^4$, we have $\log_3 81 = 4$

**Answer**: 4

**e) $\log 100,000$**

**Solution**: We need to find y such that $10^y = 100,000$
Since $100,000 = 10^5$, we have $\log 100,000 = 5$

**Answer**: 5

### Example 2: Use powers of 2 to calculate:

**a) $\lfloor \lg 70 \rfloor$**

**Solution**: We need the largest integer k such that $2^k \leq 70$
$2^6 = 64 \leq 70 < 128 = 2^7$
Therefore $\lfloor \lg 70 \rfloor = 6$

**Answer**: 6

**b) $\lceil \lg 1100 \rceil$**

**Solution**: We need the smallest integer k such that $2^k \geq 1100$
$2^{10} = 1024 < 1100 < 2048 = 2^{11}$
Therefore $\lceil \lg 1100 \rceil = 11$

**Answer**: 11

### Example 3: Use a calculator and the change of base formula to calculate:

**Change of Base Formula**: $\log_a x = \frac{\log_c x}{\log_c a}$

**a) $\log_3 687$**

**Solution**:
$$\log_3 687 = \frac{\log 687}{\log 3} = \frac{2.8370}{0.4771} \approx 5.95$$

**Answer**: ≈ 5.95

**b) $\log_5 791$**

**Solution**:
$$\log_5 791 = \frac{\log 791}{\log 5} = \frac{2.8982}{0.6990} \approx 4.15$$

**Answer**: ≈ 4.15

### Example 4: Use properties of logs to simplify each of the following:

**Properties**: 
- $\log_a(xy) = \log_a x + \log_a y$
- $\log_a(x^r) = r\log_a x$

**a) $\lg(8n)$**

**Solution**:
$$\lg(8n) = \lg(8) + \lg(n) = \lg(2^3) + \lg(n) = 3\lg(2) + \lg(n) = 3 \cdot 1 + \lg(n) = 3 + \lg(n)$$

**Answer**: $3 + \lg(n)$

**b) $\lg(n^2)$**

**Solution**:
$$\lg(n^2) = 2\lg(n)$$

**Answer**: $2\lg(n)$

**c) $\lg(n^{10})$**

**Solution**:
$$\lg(n^{10}) = 10\lg(n)$$

**Answer**: $10\lg(n)$

**d) $\lg(\sqrt{n})$**

**Solution**:
$$\lg(\sqrt{n}) = \lg(n^{1/2}) = \frac{1}{2}\lg(n)$$

**Answer**: $\frac{1}{2}\lg(n)$

**e) $\lg(n^n)$**

**Solution**:
$$\lg(n^n) = n\lg(n)$$

**Answer**: $n\lg(n)$

### Example 5: Binary Search Algorithm Analysis

**Problem**: Determine the number of times the while loop is executed in the worst case for binarySearch algorithm.

**Solution**:
In binary search, each iteration of the while loop reduces the search space by half. Starting with n elements:
- After 1 iteration: n/2 elements remain
- After 2 iterations: n/4 elements remain  
- After 3 iterations: n/8 elements remain
- After k iterations: n/2^k elements remain

The loop continues until we have 1 or fewer elements to search, so we need:
$$\frac{n}{2^k} \geq 1$$
$$n \geq 2^k$$
$$\lg(n) \geq k$$

Therefore, the maximum number of iterations is $k = \lfloor \lg(n) \rfloor + 1$.

**Examples given**:
- Search 3770 student records: $\lfloor \lg(3770) \rfloor + 1 = \lfloor 11.87 \rfloor + 1 = 11 + 1 = 12$ iterations
- Search 332,000,000 people: $\lfloor \lg(332,000,000) \rfloor + 1 = \lfloor 28.31 \rfloor + 1 = 28 + 1 = 29$ iterations

**Answer**: $\lfloor \lg(n) \rfloor + 1$ iterations in the worst case

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_