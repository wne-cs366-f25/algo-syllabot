# CS 366 Design and Analysis of Algorithms

## Practice Exam 3 - SOLUTIONS

### Fall 2025

---

## Question 1: Dynamic Programming - Coin Change (10 pts)

**Given:** A = 15 cents, denom = [11, 5, 1]

### Part (a) (7 pts) - Complete the C table

The table is filled from bottom-up. Row 3 (denom=1) is the base case where we need j coins to make j cents.

For row 2 (denom=5): For each j, choose minimum of:

- Not using a 5¢ coin: C[3][j]
- Using a 5¢ coin (if j ≥ 5): 1 + C[2][j-5]

For row 1 (denom=11): For each j, choose minimum of:

- Not using an 11¢ coin: C[2][j]
- Using an 11¢ coin (if j ≥ 11): 1 + C[1][j-11]

| C                | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  | 13  | 14  | 15    |
| ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- |
| **1** (denom=11) | 0   | 1   | 2   | 3   | 4   | 1   | 2   | 3   | 4   | 5   | 2   | 1   | 2   | 3   | 4   | **3** |
| **2** (denom=5)  | 0   | 1   | 2   | 3   | 4   | 1   | 2   | 3   | 4   | 5   | 2   | 3   | 4   | 5   | 6   | 3     |
| **3** (denom=1)  | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  | 13  | 14  | 15    |

**Explanation of key cells:**

- C[2][5] = min(C[3][5], 1+C[2][0]) = min(5, 1+0) = 1 (use one 5¢)
- C[2][10] = min(C[3][10], 1+C[2][5]) = min(10, 1+1) = 2 (use two 5¢)
- C[2][15] = min(C[3][15], 1+C[2][10]) = min(15, 1+2) = 3 (use three 5¢)
- C[1][11] = min(C[2][11], 1+C[1][0]) = min(3, 1+0) = 1 (use one 11¢)
- C[1][15] = min(C[2][15], 1+C[1][4]) = min(3, 1+4) = 3 (three 5¢ is optimal!)

### Part (b) (2 pts)

**Minimum number of coins:** **3**

**Coins used:** **Three 5-cent coins** (5¢ + 5¢ + 5¢ = 15¢)

_Traceback:_ At C[1][15], we compare using 11¢ (giving 1+C[1][4]=5) vs not using 11¢ (C[2][15]=3). Since 3 < 5, we don't use 11¢. At C[2][15], we use 5¢, then at C[2][10] we use 5¢, then at C[2][5] we use 5¢.

_Note: The greedy approach would try 11¢ first, giving 11¢ + 1¢ + 1¢ + 1¢ + 1¢ = 5 coins. DP finds the optimal 3-coin solution!_

### Part (c) (1 pt)

**Running Time:** **Θ(n × A)** or equivalently O(nA)

---

## Question 2: Dynamic Programming - 0/1 Knapsack (14 pts)

**Given:** s = [4, 6, 3, 5], k = 12

### Part (a) (6 pts) - Complete the exist table

| exist       | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12    |
| ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- |
| **0**       | T   | F   | F   | F   | F   | F   | F   | F   | F   | F   | F   | F   | F     |
| **1** (s=4) | T   | F   | F   | F   | T   | F   | F   | F   | F   | F   | F   | F   | F     |
| **2** (s=6) | T   | F   | F   | F   | T   | F   | T   | F   | F   | F   | T   | F   | F     |
| **3** (s=3) | T   | F   | F   | T   | T   | F   | T   | T   | F   | T   | T   | F   | F     |
| **4** (s=5) | T   | F   | F   | T   | T   | T   | T   | T   | T   | T   | T   | T   | **T** |

**Explanation:**

- Row 1: Can make 0 (no items) and 4 (item 1)
- Row 2: Can also make 6 (item 2) and 10 (items 1+2)
- Row 3: Add item 3 (s=3): can make 3, 7 (4+3), 9 (6+3)
- Row 4: Add item 4 (s=5): can make 5, 8 (3+5), 11 (6+5), 12 (4+3+5 or 7+5)

### Part (b) (4 pts) - Complete the belong table

| belong      | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12    |
| ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- |
| **0**       | F   | F   | F   | F   | F   | F   | F   | F   | F   | F   | F   | F   | F     |
| **1** (s=4) | F   | F   | F   | F   | T   | F   | F   | F   | F   | F   | F   | F   | F     |
| **2** (s=6) | F   | F   | F   | F   | F   | F   | T   | F   | F   | F   | T   | F   | F     |
| **3** (s=3) | F   | F   | F   | T   | F   | F   | F   | T   | F   | T   | F   | F   | F     |
| **4** (s=5) | F   | F   | F   | F   | F   | T   | F   | F   | T   | F   | F   | T   | **T** |

**Explanation:** belong[i][j] = T only when item i is actually used to achieve sum j (not inherited from previous row)

### Part (c) (2 pts)

**Largest total size:** **12**

The items used can be found by traceback:

- belong[4][12] = T, so use item 4 (s=5), remaining = 12-5 = 7
- belong[3][7] = T, so use item 3 (s=3), remaining = 7-3 = 4
- belong[2][4] = F, check belong[1][4] = T, so use item 1 (s=4), remaining = 0

**Items selected:** Items 1, 3, and 4 with sizes 4 + 3 + 5 = 12

**Running Time:** **Θ(n × k)** or equivalently O(nk)

---

## Question 3: Boolean Satisfiability (SAT) (10 pts)

**Given:** [[1, 2], [-1, 3], [-2, -3]]

### Part (a) (2 pts)

**CNF Expression:** **(a ∨ b) ∧ (¬a ∨ c) ∧ (¬b ∨ ¬c)**

### Part (b) (3 pts)

**Satisfiable:** **Yes**

**Assignment:** a = **True**, b = **True**, c = **True**

**Verification:**

- Clause 1: (T ∨ T) = T ✓
- Clause 2: (¬T ∨ T) = (F ∨ T) = T ✓
- Clause 3: (¬T ∨ ¬T) = (F ∨ F) = F ✗

Let me try another assignment: a = True, b = False, c = True

**Verification:**

- Clause 1: (T ∨ F) = T ✓
- Clause 2: (¬T ∨ T) = (F ∨ T) = T ✓
- Clause 3: (¬F ∨ ¬T) = (T ∨ F) = T ✓

**Correct Assignment:** a = **True**, b = **False**, c = **True**

### Part (c) (5 pts)

**Answer:** **True**

**Explanation:** SAT is a problem in NP, and in fact SAT is NP-complete (this was proven by Cook in 1971). By definition, if P = NP, then every problem in NP can be solved in polynomial time. Since SAT is in NP, if P = NP were true, then SAT would be solvable in polynomial time.

---

## Question 4: Hamiltonian Cycle & TSP (12 pts)

**Given 4-vertex complete graph with weights:**

|     | 1   | 2   | 3   | 4   |
| --- | --- | --- | --- | --- |
| 1   | 0   | 8   | 15  | 12  |
| 2   | 8   | 0   | 6   | 9   |
| 3   | 15  | 6   | 0   | 10  |
| 4   | 12  | 9   | 10  | 0   |

### Part (a) (3 pts)

**Hamiltonian Cycle exists:** **Yes**

**One cycle:** 1 → **2** → **3** → **4** → 1

(In a complete graph on 4 vertices, every vertex is connected to every other vertex, so Hamiltonian cycles always exist.)

### Part (b) (6 pts)

Let's enumerate all distinct Hamiltonian cycles starting at vertex 1:

1. **1 → 2 → 3 → 4 → 1:** 8 + 6 + 10 + 12 = **36**
2. **1 → 2 → 4 → 3 → 1:** 8 + 9 + 10 + 15 = **42**
3. **1 → 3 → 2 → 4 → 1:** 15 + 6 + 9 + 12 = **42**
4. **1 → 3 → 4 → 2 → 1:** 15 + 10 + 9 + 8 = **42**
5. **1 → 4 → 2 → 3 → 1:** 12 + 9 + 6 + 15 = **42**
6. **1 → 4 → 3 → 2 → 1:** 12 + 10 + 6 + 8 = **36**

**Minimum tour:** 1 → **2** → **3** → **4** → 1 (or equivalently 1 → 4 → 3 → 2 → 1)

**Total cost:** **36**

### Part (c) (3 pts)

**Explanation:**

The **Hamiltonian Cycle problem** is a _decision problem_ - it only asks "Does a Hamiltonian cycle exist?" Once we find ANY valid cycle that visits all vertices exactly once and returns to the start, we can answer "Yes" and stop. The backtracking algorithm can terminate as soon as it finds one solution.

The **Traveling Salesperson Problem** is an _optimization problem_ - it asks "What is the minimum-weight Hamiltonian cycle?" Even after finding a valid tour, we cannot stop because there might be a cheaper tour we haven't explored yet. We must examine ALL possible tours (or use clever pruning) to guarantee we've found the optimal solution.

This is why TSP's backtracking must explore all n!/2 possible tours in the worst case, while HC can potentially stop much earlier.

---

## Question 5: Computational Complexity Classification (4 pts)

**(a) Unsolvable:** **The Halting Problem** (or Post Correspondence Problem, Entscheidungsproblem)

**(b) Class P:** **Sorting** (or Shortest Path, MST, Matrix Multiplication, GCD)

**(c) Class NP:** **Graph Coloring** (or Subset Sum, Integer Factorization)

**(d) NP-complete:** **SAT** (or Vertex Cover, Clique, Independent Set, Subset Sum)

---

## BONUS: NP-Completeness Reduction (4 pts)

### Part (a) (2 pts)

**Verification Algorithm for Vertex Cover:**

```
verify_vertex_cover(G, k, certificate):
    // certificate is a proposed set S of vertices

    1. Check |S| ≤ k                          // O(1)
    2. For each edge (u,v) in G:              // O(m) edges
       If u ∉ S AND v ∉ S:
           return FALSE  // edge not covered
    3. return TRUE
```

This runs in **O(m + k)** time, which is polynomial in the input size. Therefore, Vertex Cover is in NP because any "yes" instance has a certificate (the vertex cover itself) that can be verified in polynomial time.

### Part (b) (2 pts)

If A ≤_p B (A reduces to B in polynomial time), it means:

- We can transform any instance of problem A into an instance of problem B in polynomial time
- The answer to the B instance is YES if and only if the answer to the A instance is YES

This shows B is "at least as hard" as A because:

- If we had a polynomial-time algorithm for B, we could solve A in polynomial time (transform A to B, then solve B)
- Contrapositive: If A cannot be solved in polynomial time, then B cannot be solved in polynomial time either

In other words, B is at least as computationally difficult as A. If B were "easy" (in P), then A would also have to be easy. Since A is hard, B must also be hard.
