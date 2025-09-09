# Asymptotic Notation & Math Review Activities

**Week 2 - Tuesday, Sept 9**  
**Exam Unit**: Exam1

## Overview

Hands-on activities for logs, binomial coefficients, and summations - Exam1 prep - Mathematical foundations for algorithm performance

## Materials

CLRS Chapter 3

## Learning Objectives

- Understand formal definitions of Big-O, Omega, and Theta notations
- Apply asymptotic analysis to determine algorithm complexity bounds
- Distinguish between upper bounds, lower bounds, and tight bounds
- Analyze simple algorithms using asymptotic notation
- Connect asymptotic notation to practical algorithm performance

## Big-O Notation (Upper Bound)

### Formal Definition

Given functions f(n) and g(n), we say:

**f(n) = O(g(n))** if and only if there exist positive constants c and n₀ such that:

**0 ≤ f(n) ≤ c·g(n) for all n ≥ n₀**

### Mathematical Intuition

Big-O establishes an **asymptotic upper bound**. It means that for sufficiently large inputs, f(n) grows no faster than g(n), up to a constant factor.

**Key insights:**

- We can choose any c > 0 and n₀ > 0 that make the inequality work
- We only care about behavior for large n (hence n ≥ n₀)
- Constants don't matter (absorbed into c)
- We want the simplest g(n) that bounds f(n)

### Proving Big-O: Step-by-Step Example

**Claim:** f(n) = 3n² + 5n + 2 is O(n²)

**Proof:**
We need to find constants c and n₀ such that 3n² + 5n + 2 ≤ c·n² for all n ≥ n₀.

**Step 1:** For large n, the n² term dominates:

- When n ≥ 1: 5n ≤ 5n²
- When n ≥ 1: 2 ≤ 2n²

**Step 2:** Combine the bounds:
3n² + 5n + 2 ≤ 3n² + 5n² + 2n² = 10n²

**Step 3:** Choose constants:

- c = 10, n₀ = 1
- For all n ≥ 1: 3n² + 5n + 2 ≤ 10n²

**Therefore:** f(n) = O(n²) ✓

## Big-Omega Notation (Lower Bound)

### Formal Definition

Given functions f(n) and g(n), we say:

**f(n) = Ω(g(n))** if and only if there exist positive constants c and n₀ such that:

**0 ≤ c·g(n) ≤ f(n) for all n ≥ n₀**

### Mathematical Intuition

Big-Omega establishes an **asymptotic lower bound**. It means that for sufficiently large inputs, f(n) grows at least as fast as g(n).

**Relationship to Big-O:**

- f(n) = O(g(n)) ⟺ g(n) = Ω(f(n))
- Big-O and Omega are "dual" concepts

### Proving Big-Omega: Example

**Claim:** f(n) = n² + 3n is Ω(n²)

**Proof:**
We need constants c and n₀ such that c·n² ≤ n² + 3n for all n ≥ n₀.

**Step 1:** For any n ≥ 0: n² + 3n ≥ n² (since 3n ≥ 0)
**Step 2:** Choose c = 1, n₀ = 0
**Step 3:** For all n ≥ 0: 1·n² ≤ n² + 3n ✓

**Therefore:** f(n) = Ω(n²) ✓

## Big-Theta Notation (Tight Bound)

### Formal Definition

Given functions f(n) and g(n), we say:

**f(n) = Θ(g(n))** if and only if:

**f(n) = O(g(n)) AND f(n) = Ω(g(n))**

Equivalently, there exist positive constants c₁, c₂, and n₀ such that:

**0 ≤ c₁·g(n) ≤ f(n) ≤ c₂·g(n) for all n ≥ n₀**

### Mathematical Intuition

Big-Theta establishes an **asymptotically tight bound**. It means f(n) and g(n) grow at the same rate - they're equivalent up to constant factors.

**Key insight:** When we have a Theta bound, we know the exact growth rate.

### Proving Big-Theta: Complete Example

**Claim:** f(n) = 2n² + 3n + 1 is Θ(n²)

**Proof:** We need to show both O(n²) and Ω(n²).

**Part 1 - Upper bound (O):**
2n² + 3n + 1 ≤ 2n² + 3n² + n² = 6n² for n ≥ 1
So f(n) = O(n²) with c₂ = 6, n₀ = 1 ✓

**Part 2 - Lower bound (Ω):**
2n² + 3n + 1 ≥ 2n² for n ≥ 0
So f(n) = Ω(n²) with c₁ = 2, n₀ = 0 ✓

**Combining:** c₁ = 2, c₂ = 6, n₀ = 1
For n ≥ 1: 2n² ≤ 2n² + 3n + 1 ≤ 6n²

**Therefore:** f(n) = Θ(n²) ✓

## Common Complexity Classes

### Growth Rate Hierarchy

| Class        | Notation   | Example Algorithm | n=10 | n=100 | n=1000 |
| ------------ | ---------- | ----------------- | ---- | ----- | ------ |
| Constant     | O(1)       | Array access      | 1    | 1     | 1      |
| Logarithmic  | O(log n)   | Binary search     | 3    | 7     | 10     |
| Linear       | O(n)       | Linear search     | 10   | 100   | 1000   |
| Linearithmic | O(n log n) | Merge sort        | 33   | 664   | 9966   |
| Quadratic    | O(n²)      | Bubble sort       | 100  | 10⁴   | 10⁶    |
| Cubic        | O(n³)      | Matrix multiply   | 1000 | 10⁶   | 10⁹    |
| Exponential  | O(2ⁿ)      | Subset generation | 1024 | 2¹⁰⁰  | 2¹⁰⁰⁰  |

### Understanding Each Class

#### O(1) - Constant Time

- **Definition:** Operations that take the same time regardless of input size
- **Examples:** Array indexing, hash table lookup (average), stack push/pop
- **Key insight:** May still involve multiple operations, but count doesn't grow with n

#### O(log n) - Logarithmic Time

- **Definition:** Operations that eliminate a constant fraction of remaining work each step
- **Examples:** Binary search, balanced BST operations, heap operations
- **Key insight:** Very efficient - log₂(1,000,000) ≈ 20 steps!

#### O(n) - Linear Time

- **Definition:** Operations that examine each input element a constant number of times
- **Examples:** Linear search, array traversal, finding min/max
- **Key insight:** Optimal for problems requiring examining all data

#### O(n log n) - Linearithmic Time

- **Definition:** Typically divide-and-conquer algorithms
- **Examples:** Merge sort, heap sort, efficient sorting algorithms
- **Key insight:** Often the best possible for comparison-based sorting

#### O(n²) - Quadratic Time

- **Definition:** Nested operations over input
- **Examples:** Bubble sort, insertion sort, naive algorithms
- **Key insight:** Often improvable with better algorithms or data structures

#### O(2ⁿ) - Exponential Time

- **Definition:** Operations that double with each additional input element
- **Examples:** Brute-force subset enumeration, some recursive algorithms
- **Key insight:** Quickly becomes intractable - avoid if possible!

## Algorithm Analysis Examples

### Example 1: Linear Search Analysis

```python
def linear_search(arr, target):
    for i in range(len(arr)):        # Loop: 1 to n iterations
        if arr[i] == target:         # 1 comparison per iteration
            return i                 # Found!
    return -1                        # Not found
```

**Complexity Analysis:**

- **Best case:** 1 comparison (target at index 0) → Ω(1)
- **Worst case:** n comparisons (target not found or at end) → O(n)
- **Average case:** n/2 comparisons → Θ(n)

### Example 2: Nested Loop Analysis

```python
def nested_example(n):
    total = 0
    for i in range(n):               # Outer loop: n iterations
        for j in range(n):           # Inner loop: n iterations each
            total += 1               # O(1) operation
    return total
```

**Complexity Analysis:**

- Inner loop executes n times for each of n outer iterations
- Total operations: n × n = n²
- **Time Complexity:** Θ(n²)

### Example 3: Logarithmic Search

```python
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:             # O(log n) iterations
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1
```

**Complexity Analysis:**

- Each iteration eliminates half the search space
- Maximum iterations: ⌈log₂(n)⌉
- **Time Complexity:** Θ(log n)

## Rules for Asymptotic Analysis

### Rule 1: Drop Constants

All constant factors can be ignored in asymptotic analysis.

```python
# All of these are Θ(n):
f₁(n) = n
f₂(n) = 5n
f₃(n) = 1000n + 500
```

### Rule 2: Drop Lower-Order Terms

Only the fastest-growing term matters for large n.

```python
# All of these are Θ(n²):
f₁(n) = n²
f₂(n) = n² + n + 1
f₃(n) = n² + 1000n + 500000
```

### Rule 3: Sequential Operations (Addition)

When operations are performed in sequence, add their complexities.

```python
def sequential_example(arr):
    # Phase 1: O(n)
    for x in arr:
        print(x)

    # Phase 2: O(n²)
    for i in range(len(arr)):
        for j in range(len(arr)):
            pass

    # Total: O(n) + O(n²) = O(n²)
```

### Rule 4: Nested Operations (Multiplication)

When operations are nested, multiply their complexities.

```python
def nested_example(arr):
    for i in range(len(arr)):        # n iterations
        arr.sort()                   # O(n log n) each iteration

    # Total: n × O(n log n) = O(n² log n)
```

## Practice Problems

_see activity Big Oh_

## Key Takeaways

### Fundamental Concepts

1. **Big-O provides upper bounds** - "grows no faster than"
2. **Big-Omega provides lower bounds** - "grows at least as fast as"
3. **Big-Theta provides tight bounds** - "grows at the same rate as"

### Practical Guidelines

1. **Focus on dominant terms** for large inputs
2. **Drop constants and lower-order terms**
3. **Consider worst-case behavior** unless specified otherwise
4. **Use the simplest bounding function** that captures the growth rate

### Connection to Algorithm Design

- Asymptotic analysis helps us compare algorithms objectively
- Guides us toward more efficient algorithmic approaches
- Essential for understanding scalability and performance trade-offs

## Next Lesson

We'll apply these asymptotic analysis tools to binary search trees, connecting data structure design to performance guarantees.

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
