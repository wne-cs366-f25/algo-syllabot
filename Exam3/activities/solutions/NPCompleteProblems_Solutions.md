# More NP-Complete Problems - Activity Solutions

## 3-Satisfiability (3SAT)

### Definition Review

A Boolean expression is in **k-CNF** if:
1. It is a conjunction of disjunctions (AND of ORs)
2. Every clause has exactly k literals

**Examples:**
- `(x2 OR NOT x1 OR x3) AND (x3 OR x4 OR NOT x2) AND (x4 OR x2 OR x1)` - **is in 3-CNF** (3 literals per clause)
- `(x2 OR NOT x1) AND (x3 OR x2 OR x1) AND (x4 OR x2 OR x1)` - **is NOT in 3-CNF** (first clause has only 2 literals)

### 3SAT Problem Definition

**Instance:** A Boolean expression phi in 3-CNF

**Question:** Is phi satisfiable? (Does there exist an assignment of truth values to the variables that makes phi true?)

**Theorem:** 3SAT is NP-complete (proof omitted - involves reduction from general SAT)

---

## Independent Set

### Definition

A set of vertices U is **independent** in a graph G if there is no edge incident with any two vertices of U.

The **independence number** of G, written alpha(G), is the size of a maximum independent set.

### Example Solutions

For the example graph in the handout:
- **alpha(G) = 3** (example: vertices that form a maximum independent set)

For the complete bipartite graph K_{m,n}:
- **alpha(K_{m,n}) = max(m, n)**
- Reason: No two vertices on the same side are adjacent, so we can take all vertices from the larger partition

### Independent Set Problem (Decision Version)

**Instance:** A graph G = (V, E), integer k <= |V|

**Question:** Is alpha(G) >= k? (Does G contain an independent set of size at least k?)

### Showing Independent Set is in NP

```
independentSetVerify(a, k)    // a is adjacency matrix, k is bound
{
    // Construct a guess: randomly select vertices for set S
    count = 0
    for i = 1 to n
    {
        S[i] = guess{true, false}    // true means vertex i is in S
        if (S[i])
            count = count + 1
    }

    // Check that at least k vertices are selected
    if (count < k)
        return false

    // Check that no two vertices in S are adjacent
    for i = 1 to n
    {
        for j = 1 to n
        {
            if (S[i] && S[j] && (i != j))
                if (a[i][j] == 1)    // vertices are adjacent
                    return false
        }
    }
    return true
}
```

**Running time:** O(n^2) - polynomial

**Conclusion:** Independent Set is in NP

### Proof that Independent Set is NP-complete

**Reduction from 3SAT to Independent Set:**

Given a Boolean expression phi in 3-CNF with n clauses:

**Construction of graph G:**

1. For each clause C_i (1 <= i <= n), construct a 3-cycle (triangle) with vertices labeled with the literals of clause C_i
   - This creates 3n vertices and 3n edges
   - Time: O(n)

2. Add edges between any two vertices whose labels are contradictory (i.e., between x_j and NOT x_j)
   - Time: O(n^2)

3. Set k = n

**Transformation time:** O(n^2) - polynomial

**Claim:** phi is satisfiable if and only if G has an independent set of at least k = n vertices.

**Proof (=>) direction:**
- Assume G has an independent set U of size at least n
- U must contain exactly one vertex from each triangle (since triangle vertices are all adjacent)
- Since U is independent, no two variables in U are contradictory
- Assign TRUE to each variable corresponding to vertices in U
- Since U has one vertex from each triangle, each clause has at least one true literal
- Therefore phi evaluates to TRUE

**Proof (<=) direction:**
- Assume phi is satisfiable with some truth assignment
- In each clause, at least one literal is true
- Select one such true literal from each clause to form set U
- U has exactly n vertices (one from each clause)
- No two vertices in U are contradictory (since the truth assignment is consistent)
- Therefore no edges exist between vertices in U
- U is an independent set of size n = k

### Applications of Independent Set

1. **Dispersion problems:** Identify locations for franchise services so no two locations compete
2. **Coding theory:** Find highest capacity code for communication channels (vertices = words, edges = similar words that could be confused due to noise)

---

## Clique

### Definition

A set of vertices U is a **clique** in graph G = (V, E) if all edges between any two vertices of U belong to E (every pair is adjacent).

The **clique number** of G, written omega(G), is the size of a maximum clique.

### Example Solutions

For the example graph in the handout:
- **omega(G) = 3** (the three vertices forming a triangle)

For the complete bipartite graph K_{m,n}:
- **omega(K_{m,n}) = 2**
- Reason: Any two vertices on the same side are NOT adjacent, so the largest clique is just a single edge (2 vertices from different sides)

### Clique Problem (Decision Version)

**Instance:** A graph G = (V, E), integer k <= |V|

**Question:** Is omega(G) >= k? (Does G contain a clique of size at least k?)

### Proof that Clique is NP-complete

**Step 1: Show Clique is in NP**

```
cliqueVerify(a, k)
{
    count = 0
    for i = 1 to n
    {
        S[i] = guess{true, false}
        if (S[i])
            count = count + 1
    }

    if (count < k)
        return false

    // Check all pairs of vertices in S are adjacent
    for i = 1 to n
    {
        for j = 1 to n
        {
            if (S[i] && S[j] && (i != j))
                if (a[i][j] == 0)    // not adjacent
                    return false
        }
    }
    return true
}
```

**Running time:** O(n^2) - polynomial

**Step 2: Show Independent Set reduces to Clique**

Given graph G = (V, E), construct complement graph G' = (V, E') where:
- E' contains edge (u,v) if and only if (u,v) is NOT in E

**Claim:** G has an independent set of size k if and only if G' has a clique of size k.

**Proof:**
- U is independent in G => no edges between vertices of U in G => all edges between vertices of U exist in G' => U is a clique in G'
- Conversely, U is a clique in G' => all edges between vertices of U in G' => no edges between vertices of U in G => U is independent in G

**Transformation time:** O(n^2) - polynomial (complement the adjacency matrix)

**Conclusion:** Clique is NP-complete

---

## Graph 3-Colorability

### Problem Definition

**Instance:** A graph G = (V, E)

**Question:** Is X(G) <= 3? (Can G be colored with at most 3 colors?)

### Proof that 3-Colorability is NP-complete

**Step 1:** We showed earlier that k-Colorability is in NP with O(n^2) verification.

**Step 2:** Show 3SAT reduces to 3-Colorability.

(The reduction is complex and involves constructing gadget graphs that simulate Boolean operations. The key idea is that the three colors represent TRUE, FALSE, and a "base" color, and the graph structure enforces consistent truth assignments.)

---

## Practice Problems for Final Exam

### Vertex Cover

**Definition:** Find the smallest subset S of vertices such that every edge is incident with at least one vertex in S.

**Decision Version:**
- **Given:** Graph G, bound B
- **Question:** Is there a vertex cover of size at most B?

**In NP:** Verify by checking |S| <= B and every edge has at least one endpoint in S. Time: O(n + m)

**NP-complete:** Reduce from Independent Set

**Key insight:** S is a vertex cover of G if and only if V - S is an independent set.
- If S covers all edges, then no edge has both endpoints outside S, so V - S is independent
- Conversely, if V - S is independent, then every edge must have at least one endpoint in S

### Subset-Sum Problem

**Definition:** Given a set of n numbers S = {s1, s2, ..., sn} and target k, is there a subset whose sum equals k?

**In NP:** Guess a subset T, verify sum(T) = k. Time: O(n)

**NP-complete:** Reduce from 3SAT or Vertex Cover

### Knapsack Problem

**Definition:** Given items with weights w1, w2, ..., wn and profits p1, p2, ..., pn, and capacity C, find subset maximizing profit with total weight <= C.

**Decision Version:**
- **Given:** Items, capacity C, profit bound P
- **Question:** Is there a subset with total weight <= C and total profit >= P?

**In NP:** Guess a subset, verify weight <= C and profit >= P. Time: O(n)

**NP-complete:** Reduce from Subset-Sum
- Given Subset-Sum instance (S, k), create Knapsack instance where each item i has weight = profit = si, capacity C = k, profit bound P = k
- Subset sums to k if and only if Knapsack achieves profit k with weight k

---

## Summary: Reduction Chain

```
SAT (Cook's Theorem, 1971)
    |
    v
3-SAT
    |
    +---------------+---------------+
    |               |               |
    v               v               v
Vertex Cover   3-Colorability   3-Dimensional Matching
    |               |               |
    +-------+       v               v
    |       |   K-Colorability   Partition
    v       v                       |
   HC    Clique                     v
    |       |                   Knapsack
    v       v
  TSP   Independent Set
```

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
