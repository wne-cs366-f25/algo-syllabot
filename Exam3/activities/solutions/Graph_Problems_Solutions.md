# Graph Problems - Activity Solutions

## Problem #1: k-Colorability (Vertex Coloring)

**Real-world context:** Given a set of cell towers, assign a minimum number of frequencies to the cell towers so that towers within the same range are assigned different frequencies.

### Question 1: State as a Decision Problem

**k-Colorability Problem**
- **Given:** A graph G, and an upper bound k
- **Problem:** Is X(G) <= k? That is, is there an assignment of at most k colors to the vertices of G so that adjacent vertices receive different colors?

### Question 2: Show k-Colorability is in NP

```
kColorVerify(a, k)    // a is the adjacency matrix
{
    for i = 1 to n
        color[i] = random(1, k)    // SOLUTION: guess a random color 1..k

    // go through the adjacency matrix a and
    // check that adjacent vertices received different colors
    for i = 1 to n
    {
        for j = 1 to n
        {
            if (a[i][j] == 1)
                if (color[i] == color[j])
                    return false
        }
    }
    return true
}
```

**Running time:** O(n^2), which is polynomial.

**Conclusion:** k-Colorability is in the class NP.

### Question 3: Conclusion about NP-completeness

Since k-Colorability:
- Is in NP (shown above)
- Is NP-hard (polynomial-time reduction from Satisfiability exists)

**Conclusion: k-Colorability is NP-complete**

### Question 4: Special case k = 2

A BFS algorithm can determine if a graph is 2-colorable (bipartite) in O(n + m) time.

**Conclusion: 2-Colorability is in the class P**

(Since BFS is O(n + m), which is polynomial)

---

## Problem #2: Maximum Clique

**Real-world context:** In a given set of users on Facebook, find the largest group of users among them such that every pair of users is friends with each other.

### Question 5: State as a Decision Problem

**Maximum Clique Problem**
- **Given:** A graph G, and **a lower bound** B
- **Problem:** Is omega(G) >= B? (Or is there a set of at least B vertices, all of which are pairwise adjacent?)

### Question 6: Show Maximum Clique is in NP

```
maximumCliqueVerify(a, B)
{
    // the following constructs a guess S
    // check that there are at least B vertices in S

    count = 0
    for i = 1 to n
    {
        S[i] = guess{true, false}    // true <=> vertex i is in S

        if (S[i])
            count = count + 1
    }

    if (count < B)
        return false

    // check that all pairs of vertices in S are adjacent
    for i = 1 to n
    {
        for j = 1 to n
        {
            if (S[i] && S[j] && (i != j))
                if (a[i][j] == 0)
                    return false
        }
    }
    return true
}
```

**Running time:** O(n^2), which is polynomial.

**Conclusion:** Maximum Clique is in the class NP.

### Question 7: Conclusion about NP-completeness

Since Maximum Clique:
- Is in NP (shown above)
- Is NP-hard (polynomial-time reduction from Vertex Cover exists)

**Conclusion: Maximum Clique is NP-complete**

**Note:** Uriel Feige has written an approximation algorithm that finds a clique with a number of vertices within a certain factor of the maximum. It is the best known approximation to date.

---

## Problem #3: Vertex Cover

**Real-world context:** A set of security cameras are to be placed in a museum at various locations so that all hallways are able to be viewed by at least one of the security cameras. Determine the minimum number of security cameras needed.

### Question 8: State as a Decision Problem

**Vertex Cover Problem**
- **Given:** A graph G, and **an upper bound** B
- **Problem:** Is there a set S of at most B vertices such that every edge of G is incident with at least one vertex of S?

### Question 9: Show Vertex Cover is in NP

```
vertexCoverVerify(adj, B)
{
    // randomly select vertices and store in S
    // check that there are at most B vertices in S

    count = 0
    for i = 1 to n
    {
        S[i] = guess{true, false}    // true = vertex i is in S

        if (S[i])
            count = count + 1
    }

    if (count > B)
        return false

    // check that every edge in G is incident with at least
    // one vertex of S
    for i = 1 to n
    {
        // If vertex i belongs to S, then all its incident edges
        // are covered; if not, process i's list by checking to
        // see if each adjacent vertex is in S.

        if (!S[i])
        {
            trav = adj[i]
            while (trav != null)
            {
                if (!S[trav.vertex])
                    return false
                else
                    trav = trav.next
            }
        }
    }
    return true
}
```

**Running time:** O(n + m), which is polynomial.

**Conclusion:** Vertex Cover is in the class NP.

### Question 10: Conclusion about NP-completeness

Since Vertex Cover:
- Is in NP (shown above)
- Is NP-hard (polynomial-time reduction from 3-Satisfiability exists)

**Conclusion: Vertex Cover is NP-complete**

**Note:** Fanica Gavril and Mihalis Yannakakis independently discovered a 2-approximation algorithm for Vertex Cover:
1. Pick an arbitrary edge
2. Include both incident vertices in the set S
3. Delete all edges covered so far and repeat
4. Continue until there are no uncovered edges

Using this algorithm, the number of vertices in the vertex cover S is at most twice the minimum possible (2-approximation).

---

## Summary Table

| Problem | Bound Type | In NP? | Running Time | NP-complete? |
|---------|------------|--------|--------------|--------------|
| k-Colorability | Upper bound k | Yes | O(n^2) | Yes |
| 2-Colorability | Fixed k=2 | Yes | O(n+m) | No - in P |
| Maximum Clique | Lower bound B | Yes | O(n^2) | Yes |
| Vertex Cover | Upper bound B | Yes | O(n+m) | Yes |

---

## Key Insights

1. **Upper vs Lower Bounds:**
   - Minimization problems (coloring, vertex cover) use upper bounds
   - Maximization problems (clique) use lower bounds

2. **Special Cases:**
   - 2-Colorability is in P (can be solved by BFS)
   - k-Colorability for k >= 3 is NP-complete

3. **Approximation Algorithms:**
   - When exact solutions are intractable, approximation algorithms provide near-optimal solutions in polynomial time

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
