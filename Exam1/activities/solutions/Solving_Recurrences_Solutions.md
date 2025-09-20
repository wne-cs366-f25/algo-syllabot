# Solving Recurrences - Solutions

## Activity Overview

This activity focuses on understanding and solving recurrence relations, particularly for analyzing the time complexity of recursive algorithms like MergeSort.

## Problem Analysis

### MergeSort Recurrence Relation

From the given MergeSort algorithm:

```
T(n) = { θ(1),           if n = 1
       { 2T(n/2) + θ(n), if n > 1
```

### Key Questions and Solutions

#### 1. How much time is required for the merge operation?

**Answer:** θ(n)

**Explanation:** The merge operation needs to examine each element in both subarrays to combine them into a single sorted array. Since we're merging two subarrays that together contain n elements, the merge operation takes linear time θ(n).

#### 2. Solving the recurrence by the Iteration Method

**Given:** T(n) = 2 \* T(n/2) + n

**Step-by-step iteration:**

```
T(n) = 2 * T(n/2) + n
     = 2 * [2 * T(n/4) + n/2] + n
     = 2 * [2 * [2 * T(n/8) + n/4] + n/2] + n
     = 4 * T(n/4) + n + n
     = 8 * T(n/8) + n + n + n
     = 2^k * T(n/2^k) + k*n
```

**Where k = log₂(n)** (when n/2^k = 1)

**Final solution:**

```
T(n) = 2^(log₂n) * T(1) + (log₂n) * n
     = n * θ(1) + n * log₂n
     = θ(n log n)
```

#### 3. Recursion Tree Analysis

**Tree Structure:**

```
Level 0:           T(n)                    Cost: n
                  /    \
Level 1:      T(n/2)  T(n/2)              Cost: n/2 + n/2 = n
             /   \    /   \
Level 2:  T(n/4) T(n/4) T(n/4) T(n/4)     Cost: 4*(n/4) = n
         ...
Level k:  n leaf nodes                     Cost: n*θ(1) = θ(n)
```

**Analysis:**

- **Height of tree:** log₂(n) levels
- **Cost per level:** n (except the last level)
- **Number of levels with cost n:** log₂(n)
- **Total cost:** n \* log₂(n) + θ(n) = θ(n log n)

#### 4. Final Answer

**T(n) = θ(n log n)**

This means MergeSort has a time complexity of θ(n log n), which is optimal for comparison-based sorting algorithms.

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
