# Theory of NP-Completeness - Lecture Notes Solutions

## Overview

This document provides complete solutions to the fill-in-the-blank sections and proofs from the Theory of NP-Completeness lecture notes.

---

## 1. TSPVerify Algorithm (Page 3)

**Problem:** Complete the TSPVerify algorithm to show that TSP is in the class NP.

### Complete Algorithm

```
TSPVerify(w, B)
{
    // w is an n x n matrix, w[i][j] is the weight of edge ij
    // Assumption: w[i][j] > 0 whenever i and j are adjacent
    // B is a bound
    // Form a guess (a tour of n cities) and check to see if
    // (1) the guess is a tour and (2) total cost of tour <= B

    for i = 1 to n
        visited[i] = false

    for i = 1 to n
    {
        S[i] = guess(V)         // pick a vertex to visit
        visited[S[i]] = true
    }

    for i = 1 to n
    {
        if (!visited[i])        // not all vertices in the cycle
            return false
    }

    // CHECK THAT CONSECUTIVE VERTICES ARE ADJACENT
    for i = 1 to n-1
    {
        if (w[S[i]][S[i+1]] == 0)   // not adjacent (no edge)
            return false
    }

    // CHECK THAT LAST VERTEX IS ADJACENT TO FIRST (COMPLETING THE CYCLE)
    if (w[S[n]][S[1]] == 0)
        return false

    // CALCULATE TOTAL WEIGHT OF THE TOUR
    totalWeight = 0
    for i = 1 to n-1
    {
        totalWeight = totalWeight + w[S[i]][S[i+1]]
    }
    totalWeight = totalWeight + w[S[n]][S[1]]   // add edge back to start

    // CHECK IF TOTAL WEIGHT IS WITHIN BOUND
    if (totalWeight > B)
        return false

    return true
}
```

### Running Time Analysis

| Section | Operations | Time |
|---------|-----------|------|
| Initialize visited array | n iterations | O(n) |
| Create random guess S | n iterations | O(n) |
| Check all vertices visited | n iterations | O(n) |
| Check consecutive vertices adjacent | n-1 iterations | O(n) |
| Check last-to-first adjacency | 1 operation | O(1) |
| Calculate total weight | n iterations | O(n) |
| Compare to bound | 1 operation | O(1) |

**Total Running Time: O(n) + O(n) + O(n) + O(n) + O(1) + O(n) + O(1) = O(n)**

Since O(n) is polynomial, **TSP is in the class NP**.

---

## 2. Polynomial-Time Reduction from HC to TSP (Page 6)

**Claim:** Instance I1 has a Hamiltonian cycle if and only if Instance I2 has a minimum tour of total weight at most B = n.

### Proof of (=>) Direction

**Assume I1 has a Hamiltonian cycle.**

Let the Hamiltonian cycle in graph G be the sequence of vertices v1, v2, ..., vn, v1.

Since this is a Hamiltonian cycle in G:
- All n vertices are visited exactly once
- Each consecutive pair (vi, vi+1) for i = 1 to n-1 are adjacent in G
- The pair (vn, v1) are adjacent in G (completing the cycle)

In the transformed instance I2:
- The same vertices and edges exist
- Each edge has weight 1 (by our transformation: w[i][j] = A[i][j])

Since every edge in the Hamiltonian cycle exists and has weight 1:
- The tour visits all n vertices
- The tour uses exactly n edges (one between each consecutive pair, plus return to start)
- Total weight = n × 1 = n = B

**Therefore, I2 has a tour with total weight exactly B = n, which satisfies the condition "at most B".**

### Proof of (<=) Direction

**Assume I2 has a minimum tour of total weight at most B = n.**

In the transformed graph G':
- All edges have weight 1 (from our transformation)
- Non-edges have weight 0 (no edge exists)

A valid tour must:
- Visit all n vertices exactly once
- Use n edges to complete the cycle
- Each edge used must exist (weight > 0, which means weight = 1)

Since each edge has weight exactly 1 and the tour uses exactly n edges:
- Minimum possible tour weight = n × 1 = n

If the tour has total weight at most n, and each edge has weight 1, the tour must use exactly n edges, each with weight 1.

This means all n edges in the tour exist in G' (and therefore in G, since G' = G with weights added).

**Therefore, the sequence of vertices in this tour forms a Hamiltonian cycle in the original graph G = I1.**

### Summary

The transformation algorithm:
```
n = A.length
B = n
for i = 1 to n
    for j = 1 to n
        w[i][j] = A[i][j]
```

- **Transformation time:** O(n^2) - polynomial
- **Correctness:** Proven in both directions above
- **Conclusion:** TSP is at least as hard as HC

---

## 3. Key Definitions Summary

### Class P
The set of decision problems that can be **solved** in polynomial time.

### Class NP
The set of decision problems that can be **verified** in polynomial time.
- NP stands for "Nondeterministic Polynomial" (NOT "non-polynomial")

### Important Relationship
**P is a subset of NP (P ⊆ NP)**

If you can solve a problem in polynomial time, you can certainly verify a solution in polynomial time (just solve it and compare).

### The P = NP Question
- One of the most important open problems in computer science
- Millennium Prize Problem ($1,000,000 prize)
- Common assumption: P ≠ NP (but unproven)

### NP-hard
A problem is NP-hard if every problem in NP can be reduced to it in polynomial time.

### NP-complete
A problem is NP-complete if:
1. It is in NP (polynomial verifiability)
2. It is NP-hard (every NP problem reduces to it)

### Proving NP-completeness
To prove a problem P2 is NP-complete:
1. Show P2 is in NP (write a polynomial verification algorithm)
2. Find a polynomial-time reduction from a known NP-hard/NP-complete problem P1 to P2

---

## 4. Important NP-complete Problems

The following problems have been proven NP-complete:

| Problem | Reduces From |
|---------|--------------|
| SAT (Satisfiability) | First proven NP-complete (Cook's Theorem, 1971) |
| 3-SAT | SAT |
| Vertex Cover | 3-SAT |
| 3-Colorability | 3-SAT |
| 3-Dimensional Matching | 3-SAT |
| Hamiltonian Cycle | Vertex Cover |
| Clique | Vertex Cover |
| K-Colorability | 3-Colorability |
| Partition | 3-Dimensional Matching |
| Traveling Salesman | Hamiltonian Cycle |
| Independent Set | Clique |
| Knapsack | Partition |

---

## 5. Converting Optimization Problems to Decision Problems

**Key Technique:** Introduce a bound

| Optimization Problem | Decision Problem |
|---------------------|------------------|
| TSP: Find minimum tour | TSP: Is there a tour with cost ≤ B? |
| Shortest Path: Find minimum path | Shortest Path: Is there a path with length ≤ B? |
| Knapsack: Find maximum value | Knapsack: Is there a subset with value ≥ B? |
| Coin Change: Find minimum coins | Coin Change: Can we make change with ≤ B coins? |

**Important Notes:**
1. If we can solve the optimization problem efficiently, we can solve the decision problem efficiently (solve optimization, compare to bound)
2. If the decision problem is hard, the optimization problem is at least as hard

---

## 6. Practice Questions

### Question 1
Why is the Hamiltonian Cycle problem in NP?

**Answer:** We can verify a solution in polynomial time by:
1. Checking that all n vertices appear in the sequence - O(n)
2. Checking no vertex is repeated - O(n)
3. Checking consecutive vertices are adjacent - O(n)
4. Checking the last vertex connects back to the first - O(1)

Total: O(n) which is polynomial.

### Question 2
What does it mean for TSP to be NP-complete?

**Answer:**
1. TSP is in NP (we can verify a tour in polynomial time)
2. TSP is NP-hard (every problem in NP can be reduced to TSP)
3. If we could solve TSP in polynomial time, we could solve ALL NP problems in polynomial time (which would prove P = NP)

### Question 3
If someone claims to have found a polynomial-time algorithm for the Hamiltonian Cycle problem, what would this imply?

**Answer:** Since HC is NP-complete, a polynomial-time algorithm for HC would mean:
- P = NP
- All NP-complete problems could be solved in polynomial time
- This would be one of the most significant discoveries in computer science
- They should submit their proof for the $1,000,000 Millennium Prize

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
