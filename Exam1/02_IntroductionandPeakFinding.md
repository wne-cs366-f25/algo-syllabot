# Introduction and Peak Finding

**Week 2 - Tuesday, Sept 2**  
**Exam Unit**: Exam1

## Overview

Algorithmic thinking and divide-and-conquer

## Learning Objectives

- Apply algorithm analysis concepts from Lesson 0 to concrete problems
- Learn algorithmic thinking through the peak finding problem
- Compare and analyze time complexity of different algorithmic approaches
- Understand divide-and-conquer as a fundamental algorithmic paradigm
- Practice correctness arguments for recursive algorithms

An algorithm is a well-defined computational procedure that takes input and produces output. It's a sequence of computational steps that transform the input into the output.

Recall from Lesson 0 the four fundamental properties we analyze:

1. **Correctness**: Does it produce correct output for all valid inputs?
2. **Efficiency**: How does runtime and space usage grow with input size?
3. **Clarity**: Can it be understood and implemented?
4. **Generality**: Does it solve a class of problems, not just one instance?

### Key Questions in Algorithm Design

For every algorithm we design, we ask:

1. **Does it work?** (Correctness) - Can we prove it finds a valid solution?
2. **How fast is it?** (Time Complexity) - Count fundamental operations
3. **Can we do better?** (Optimization) - Are there faster approaches?
4. **What paradigm applies?** - Divide & conquer, greedy, dynamic programming?

## The Peak Finding Problem

Peak finding demonstrates how the same computational problem can be solved with dramatically different efficiencies.

### Problem Definition

**Input**: Array A[0...n-1] of numbers  
**Output**: Index i such that A[i] is a peak

### 1D Peak Finding

Given an array A[0...n-1], position i is a peak if:

- the i'th value in the array is greater than or equal to left neighbor (if it exists) and greater than or equal to right neighbor (if it exists)

Formally:

- A[i] ≥ A[i-1] (if i > 0) and A[i] ≥ A[i+1] (if i < n-1)

Examples:

- Array [1, 2, 3, 1]: index 2 is a peak (3 ≥ 2 and 3 ≥ 1)
- Array [5, 4, 3, 2, 1]: index 0 is a peak (no left neighbor, 5 ≥ 4)
- Array [1, 2, 3, 4, 5]: index 4 is a peak (5 ≥ 4, no right neighbor)
- Array [2, 4, 3, 5]: index 1 and 3 are peaks (4 ≥ 2 and 4 ≥ 3, 5 ≥ 3, no right neighbor)

**Important**: Every array has at least one peak (why?)

The 1D Peak Finding Problem is to output a peak index i given input array A.

### Understanding Brute Force Algorithms

**Definition**: A brute force (or naive) algorithm solves a problem by trying all possible solutions in a systematic way. It guarantees finding the correct answer but often at the cost of efficiency.

**Characteristics of Brute Force Approaches**:

- **Exhaustive**: Examines all possible candidates
- **Simple to understand**: Usually straightforward to implement and verify
- **Guaranteed correct**: Will always find a solution if one exists
- **Often inefficient**: May do unnecessary work

**Trade-offs**:

- ✅ **Pros**: Easy to implement, guaranteed to work, good baseline for comparison
- ❌ **Cons**: Often slow for large inputs, doesn't exploit problem structure

### Approach 1: Linear Scan (Brute Force)

The straightforward approach: check every position to see if it's a peak.

```pseudocode
FIND-PEAK-LINEAR(A):
    for i = 0 to n-1:
        if (i = 0 or A[i] ≥ A[i-1]) and
           (i = n-1 or A[i] ≥ A[i+1]):
            return i
    // This line never reached (every array has a peak)
```

**Correctness**:

- We check every position systematically
- Peak condition is correctly implemented with boundary checks
- Since every array has at least one peak, we will find one

**Time Complexity Analysis**:

- **Best Case**: O(1) - first element is a peak
- **Worst Case**: O(n) - peak is at the last position checked
- **Average Case**: O(n) - on average, we check half the array

**Space Complexity**: O(1) - only uses constant extra space

**Fundamental Operations Count**:

- Comparisons: at most 2n (two per iteration)
- Array accesses: at most 3n (A[i], A[i-1], A[i+1])
- Total: O(n) operations

### Approach 2: Divide and Conquer

Key insight: We don't need to examine every element. If the middle element isn't a peak, we can determine which half of the array must contain a peak.

```pseudocode
FIND-PEAK-BINARY(A, left, right):
    if left > right:
        return -1  // Should never happen

    mid = ⌊(left + right) / 2⌋

    // Check if mid is a peak
    if (mid = 0 or A[mid] ≥ A[mid-1]) and
       (mid = n-1 or A[mid] ≥ A[mid+1]):
        return mid

    // If left neighbor is larger, peak must exist on left half
    if mid > 0 and A[mid-1] > A[mid]:
        return FIND-PEAK-BINARY(A, left, mid-1)

    // Otherwise, peak must exist on right half
    else:
        return FIND-PEAK-BINARY(A, mid+1, right)
```

**Initial call**: `FIND-PEAK-BINARY(A, 0, n-1)`

**Correctness Argument**:

1. **Base case**: If mid is a peak, we return it correctly
2. **Recursive case**: If A[mid-1] > A[mid], then:
   - Moving left from mid gives us an increasing sequence
   - Either we hit a peak, or we reach the leftmost element (which is a peak)
   - Similar logic applies when moving right
3. **Termination**: Array size decreases by at least half each call

**Time Complexity Analysis**:

- **Recurrence relation**: T(n) = T(n/2) + O(1)
- **Solution**: T(n) = O(log n)
- **Intuition**: We eliminate half the search space each iteration

**Space Complexity**:

- O(log n) due to recursion stack depth
- Can be made O(1) with iterative implementation

**Why This Works**:
The key insight is that if A[mid-1] > A[mid], then the left half must contain a peak. Why? Because as we move left, we either:

1. Find a position where A[i] ≥ A[i-1] (creating a peak), or
2. Reach position 0 (which is automatically a peak)

### Comparing the Approaches

| Approach         | Time Complexity | Space Complexity | Operations | Key Insight              | When to Use                                |
| ---------------- | --------------- | ---------------- | ---------- | ------------------------ | ------------------------------------------ |
| Linear Scan      | O(n)            | O(1)             | Up to 3n   | Check every element      | Small arrays, simple implementation needed |
| Divide & Conquer | O(log n)        | O(log n)         | ~3log₂(n)  | Eliminate half each step | Large arrays, performance critical         |

**Efficiency Comparison**:

For an array of size n=1024:

- **Linear Scan**: Up to 3,072 operations (worst case)
- **Divide & Conquer**: About 30 operations (log₂(1024) = 10, with ~3 operations per level)

**Improvement Factor**: ~100x faster for large arrays!

**Key Insight**: The brute force approach provides a crucial baseline that helps us:

1. **Verify correctness**: More complex algorithms can be tested against the simple brute force
2. **Measure improvement**: Quantify how much better the optimized version is
3. **Understand the problem**: Starting with brute force helps identify optimization opportunities

**Example Walkthrough**:
Array: [1, 2, 3, 4, 5, 4, 3, 2, 1]

_Linear approach_: Checks positions 0,1,2,3,4 → finds peak at index 4
_Divide & conquer_: mid=4 → A[4]=5, A[3]=4, A[5]=4 → peak found!

Only 1 comparison vs. 5 comparisons!

## Key Insights and Algorithm Design Principles

### Fundamental Insights

1. **Not all problems require examining all data**: The linear scan examines every element, but divide-and-conquer shows we can find a peak by examining only O(log n) elements.

2. **Divide-and-conquer power**: By eliminating half the search space each step, we achieve exponential improvement in performance.

3. **Local decisions → global solutions**: At each step, we make a local decision (go left or right) that guarantees global success (finding a peak).

4. **Problem structure matters**: Peak finding has the special property that we can always determine which half contains a peak.

### When Divide-and-Conquer Works

Divide-and-conquer is effective when:

- Problem can be split into similar subproblems
- We can determine which subproblem contains the solution
- Combining results is efficient (or not needed, as in peak finding)

### When Brute Force is Acceptable

Despite being "inefficient," brute force approaches are often the right choice:

**1. Small Input Sizes**

- For n ≤ 100, the difference between O(n) and O(log n) is negligible
- Implementation simplicity often outweighs minor performance gains

**2. One-Time Computations**

- If the algorithm runs once or infrequently, development time matters more than runtime
- O(n) vs O(log n) difference irrelevant for occasional use

**3. Prototyping and Testing**

- Start with brute force to verify correctness
- Use as a baseline to test optimized versions
- Easier to debug and understand

**4. Code Maintenance**

- Simpler code is easier to maintain and modify
- Fewer bugs due to straightforward logic
- Better for collaborative development

**5. Development Constraints**

- Limited development time
- Junior developers on the team
- Code needs to be readable by non-experts

**Real-World Example**:
If you're finding peaks in sensor data arrays of size 50, use the O(n) linear scan. The 150 operations complete in microseconds, but the O(log n) version adds complexity that increases development time and bug potential.

### Connection to Lesson 0 Concepts

**Computational Model**: Each comparison and array access is a fundamental operation taking O(1) time.

**Worst-Case Analysis**: We analyzed the maximum number of operations needed, providing upper bound guarantees.

**Algorithmic Paradigms**: Divide-and-conquer is one of the key paradigms mentioned in Lesson 0 for designing algorithms.

## Practice Problems

**Q1. Peak Counter**: Can you modify the 1D algorithm to count all peaks? What's the time complexity?

**A:**

**Time Complexity**: O(n) - we cannot do better than linear time because we need to examine every position. Divide-and-conquer doesn't help here because we need the complete count, not just one peak.

**Q2. Valley Finding**: Define a valley as the opposite of a peak. Design an efficient algorithm.

**A:**

**Q3. Plateau Peak**: What if we define a peak as any element part of a sequence of equal maximum values?

**A:**

**Time Complexity**: O(n) - we must examine all elements to find the maximum value. Divide-and-conquer cannot improve this because we need global information (the maximum value).

**Q4. 1D Peak Existence**: Justify that every array has at least one peak.

**A:**

**Q5. Modified Peak**: What if we define a peak as strictly greater than both neighbors (A[i] > A[i-1] and A[i] > A[i+1])?

**A:**

## Summary

### Key Takeaways

1. **Multiple solutions exist**: The same computational problem often has solutions with dramatically different efficiencies

2. **Algorithm analysis guides design**: Understanding time/space complexity helps us choose the right approach

3. **Paradigms provide templates**: Divide-and-conquer gives us a systematic way to approach certain classes of problems

4. **Always question efficiency**: Ask "Can we do better?" - the answer led us from O(n) to O(log n)

### Connecting Forward

The divide-and-conquer paradigm we've introduced will appear throughout the course:

- Merge sort and quick sort (sorting algorithms)
- Binary search trees (data structures)
- Master theorem (recurrence analysis)
- Closest pair of points (computational geometry)

## Next Lesson

We'll go back to basics and learn the algorithms necessary to implement a sequence data structure

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
