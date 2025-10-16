# Breadth and Depth First Search Activity - Solutions

## Part 1: Understanding O(V + E) Complexity

### Problem 1: Basic Complexity Analysis

**Graph 1:**

```
0: [1, 3]
1: [0, 2, 4]
2: [1, 5]
3: [0, 4, 6]
4: [1, 3, 5, 7]
5: [2, 4]
6: [3, 7]
7: [4, 6]
```

**a) BFS from vertex 0:**

**Traversal order:** 0, 1, 3, 2, 4, 6, 5, 7

**How many vertices are visited?** 8 (all vertices)

**How many edges are examined?** 20 (each edge is examined twice in an undirected graph - once from each endpoint)

**Step-by-step BFS:**

```
Queue: [0], Visited: []
Visit 0: Queue = [1, 3], Visited = [0]
Visit 1: Queue = [3, 2, 4], Visited = [0, 1]
Visit 3: Queue = [2, 4, 6], Visited = [0, 1, 3]
Visit 2: Queue = [4, 6, 5], Visited = [0, 1, 3, 2]
Visit 4: Queue = [6, 5, 7], Visited = [0, 1, 3, 2, 4]
Visit 6: Queue = [5, 7], Visited = [0, 1, 3, 2, 4, 6]
Visit 5: Queue = [7], Visited = [0, 1, 3, 2, 4, 6, 5]
Visit 7: Queue = [], Visited = [0, 1, 3, 2, 4, 6, 5, 7]
```

**Edges examined:**

- From 0: (0,1), (0,3) = 2
- From 1: (1,0), (1,2), (1,4) = 3
- From 3: (3,0), (3,4), (3,6) = 3
- From 2: (2,1), (2,5) = 2
- From 4: (4,1), (4,3), (4,5), (4,7) = 4
- From 6: (6,3), (6,7) = 2
- From 5: (5,2), (5,4) = 2
- From 7: (7,4), (7,6) = 2
- **Total: 20 edge examinations** (= 2|E| since each of 10 edges examined from both endpoints)

**b) DFS from vertex 0:**

**Traversal order:** 0, 1, 2, 5, 4, 3, 6, 7

**How many vertices are visited?** 8 (all vertices)

**How many edges are examined?** 20 (same as BFS - each edge examined twice)

**Step-by-step DFS (recursive):**

```
Visit 0 → neighbors: [1, 3]
  Visit 1 → neighbors: [0✓, 2, 4]
    Visit 2 → neighbors: [1✓, 5]
      Visit 5 → neighbors: [2✓, 4]
        Visit 4 → neighbors: [1✓, 3, 5✓, 7]
          Visit 3 → neighbors: [0✓, 4✓, 6]
            Visit 6 → neighbors: [3✓, 7]
              Visit 7 → neighbors: [4✓, 6✓]
```

**c) Complexity Questions:**

**In the worst case for a connected graph, how many vertices will BFS/DFS visit?**  
All |V| vertices (for a connected graph)

**In an adjacency list representation, how many times will each edge be examined during BFS?**  
Twice - once from each endpoint. For a directed graph, once. For an undirected graph, twice (since each edge appears in two adjacency lists).

**Why is the time complexity O(V + E) and not O(V × E)?**

The complexity is O(V + E) because:

1. **We visit each vertex exactly once:** O(V) work
2. **We examine each edge a constant number of times:** O(E) work
   - For each vertex v, we iterate through its adjacency list once
   - The sum of all adjacency list lengths = 2|E| for undirected, |E| for directed
   - We don't re-examine edges for already-visited vertices

The key insight: We iterate through the adjacency list of each vertex exactly once. Since the total size of all adjacency lists combined is O(E), the total work is O(V + E), not O(V × E).

If it were O(V × E), we'd be checking every possible edge for every vertex, which would be the case with an adjacency matrix where we scan entire rows.

---

## Part 2: Disconnected Graphs

### Problem 2: Multiple Components

**Graph 2:**

```
0: [1, 2]        Component 1: {0, 1, 2, 3}
1: [0, 3]        Component 2: {4, 5, 6, 7}
2: [0]           Component 3: {8, 9}
3: [1]
4: [5, 6]
5: [4]
6: [4, 7]
7: [6]
8: [9]
9: [8]
```

**a) BFS from vertex 0:**

**Traversal order:** 0, 1, 2, 3

**Which vertices are NOT reachable from 0?** 4, 5, 6, 7, 8, 9

**b) To visit ALL vertices, from which additional vertices must you start BFS/DFS?**

You need to start from one vertex in each unreached component:

- Start from **4** (or any of 4, 5, 6, 7) to reach component 2
- Start from **8** (or 9) to reach component 3

Minimum additional starting vertices: **2** (one per remaining component)

**c) Total complexity for visiting all vertices:**

**Number of components:** 3

**Total vertices visited:** 10 (all vertices)

**Total edges examined:** 14 (= 2 × 7 edges, since undirected)

**Overall complexity:** O(V + E) = O(10 + 7) = O(17)

**Important:** Even with multiple components, the complexity remains O(V + E) because:

- We still visit each vertex exactly once
- We still examine each edge exactly twice (once from each endpoint)
- Multiple BFS/DFS calls don't change the asymptotic complexity

---

## Part 3: Dense vs Sparse Graphs

### Problem 3: Graph Density Analysis

**Graph 3a (Sparse):**

```
0: [1, 2]
1: [0, 3]
2: [0, 4, 5]
3: [1]
4: [2]
5: [2]
```

**Graph 3a BFS from 0:** 0, 1, 2, 3, 4, 5

**Graph 3b (Dense - Complete Graph):**

```
0: [1, 2, 3, 4, 5]
1: [0, 2, 3, 4, 5]
2: [0, 1, 3, 4, 5]
3: [0, 1, 2, 4, 5]
4: [0, 1, 2, 3, 5]
5: [0, 1, 2, 3, 4]
```

**Graph 3b BFS from 0:** 0, 1, 2, 3, 4, 5

**Note:** The BFS order is the same, but the work done is very different!

**Analysis:**

**In Graph 3a (sparse), what is |E| in terms of |V|?**  
|E| = 5 = |V| - 1 (this is a tree). Generally for sparse graphs: |E| = O(|V|)

**In Graph 3b (dense), what is |E| in terms of |V|?**  
|E| = 15 = |V|(|V|-1)/2 = 6(5)/2. Generally for dense graphs: |E| = O(|V|²)

**For sparse graphs, O(V + E) ≈ O(V)**
(because E = O(V), so V + E = O(V))

**For dense graphs, O(V + E) ≈ O(V²)**  
(because E = O(V²), so V + E = O(V²) since V² dominates)

**Practical Implications:**

- Sparse graph (|E| = 5): BFS examines ~10 edges
- Dense graph (|E| = 15): BFS examines ~30 edges
- Same number of vertices, but 3× more work in dense graph!

---

## Part 4: Adjacency Matrix vs Adjacency List

### Problem 4: Representation Comparison

**Graph:**

```
0: [1, 2]
1: [0, 2, 3]
2: [0, 1, 4]
3: [1, 4]
4: [2, 3]
```

**a) Adjacency Matrix:**

```
    0  1  2  3  4
0 [ 0  1  1  0  0 ]
1 [ 1  0  1  1  0 ]
2 [ 1  1  0  0  1 ]
3 [ 0  1  0  0  1 ]
4 [ 0  0  1  1  0 ]
```

**b) BFS Complexity Analysis:**

**Using Adjacency List:**

- **Time to find all neighbors of vertex v:** O(degree(v)) - just iterate through the list
- **Total time complexity:** O(V + E)
  - Visit all V vertices: O(V)
  - Sum of all degree(v) = 2E for undirected graph: O(E)
  - Total: O(V + E)

**Using Adjacency Matrix:**

- **Time to find all neighbors of vertex v:** O(V) - must scan entire row of V columns
- **Total time complexity:** O(V²)
  - Visit all V vertices: O(V)
  - For each vertex, scan V columns: O(V²)
  - Total: O(V²)

**c) Which representation is better for sparse graphs? Why?**

**Adjacency List is better for sparse graphs** because:

1. **Space efficiency:**

   - List: O(V + E) ≈ O(V) for sparse graphs
   - Matrix: O(V²) always

2. **Time efficiency for BFS/DFS:**

   - List: O(V + E) ≈ O(V) for sparse graphs
   - Matrix: O(V²) always

3. **Example:** For |V| = 1000, |E| = 2000 (sparse):
   - List space: ~3,000 entries
   - Matrix space: 1,000,000 entries
   - List is 300× more space efficient!

**When is adjacency matrix better?**

- Dense graphs where E ≈ V²
- Need O(1) edge existence checks
- Need to quickly check if edge (u,v) exists

---

## Part 5: Application Preview

### Problem 5: Distance and Reachability

**Graph 5:**

```
0: [1, 3]
1: [0, 2, 4]
2: [1, 5]
3: [0, 4, 6]
4: [1, 3, 7]
5: [2, 8]
6: [3]
7: [4, 8]
8: [5, 7]
```

**a) BFS from vertex 0 with distances:**

```
Vertex:    0  1  2  3  4  5  6  7  8
Distance:  0  1  2  1  2  3  2  3  4
```

**BFS with distance tracking:**

```
Level 0: [0]
Level 1: [1, 3]
Level 2: [2, 4, 6]
Level 3: [5, 7]
Level 4: [8]
```

**b) Why does BFS (but not DFS) give shortest paths in unweighted graphs?**

**BFS guarantees shortest paths** because:

1. It explores vertices in order of increasing distance from the source
2. When BFS first reaches a vertex v, it has found the shortest path to v
3. All paths of length d are explored before any path of length d+1

**DFS does NOT guarantee shortest paths** because:

1. DFS goes deep first, potentially finding a long path to a vertex
2. A shorter path might exist through a different branch not yet explored
3. DFS order depends on the recursion/stack order, not distance

**Example in this graph:**

- BFS finds distance to vertex 2 = 2 (path: 0→1→2)
- DFS might go 0→3→4→1→2, finding distance = 4
- BFS correctness: when 2 is first discovered (at distance 2), no shorter path exists

**c) How would you modify BFS to actually compute and store these distances?**

```python
BFS-with-distances(G, s):
    for each vertex v in G.V:
        v.distance = ∞
        v.parent = null

    s.distance = 0
    Q = empty queue
    Q.enqueue(s)

    while Q is not empty:
        u = Q.dequeue()
        for each v in G.adj[u]:
            if v.distance == ∞:  // unvisited
                v.distance = u.distance + 1  // Set distance
                v.parent = u                 // Track path
                Q.enqueue(v)
```

**Key modification:** Track `distance` array, update when discovering new vertex

---

## Part 6: Cycle Detection

### Problem 6: Understanding Graph Structure

**Graph 6:**

```
0: [1, 2]
1: [0, 3, 4]
2: [0, 5]
3: [1]
4: [1, 5, 6]
5: [2, 4]
6: [4]
```

**a) DFS from vertex 0 with edge classification:**

**DFS traversal order:** 0, 1, 3, 4, 5, 2, 6

**Edge classifications:**

```
(0,1): T   (0,2): T   (1,3): T   (1,4): T
(2,5): T   (4,5): B   (4,6): T   (1,0): B
```

**Detailed DFS tree:**

```
       0
      / \
     1   2
    / \   \
   3   4   5
       |   (back to 4)
       6
```

**Edge classification explanation:**

- **Tree edges (T):** Edges that lead to unvisited vertices (form the DFS tree)
  - (0,1), (0,2), (1,3), (1,4), (2,5), (4,6)
- **Back edges (B):** Edges to ancestors in DFS tree
  - (4,5): 5 is ancestor of 4 (path: 0→2→5, and 4 is descendant of 0)
  - (1,0): 0 is ancestor of 1

**b) Does this graph contain a cycle? How can you tell from the DFS edge classification?**

**YES, this graph contains cycles.**

**How to tell:** A graph contains a cycle if and only if DFS finds a **back edge**.

**Cycles in this graph:**

- **Cycle 1:** 0→1→0 (back edge from 1 to 0)
- **Cycle 2:** 0→2→5→4→1→0 (back edge from 4 to 5, which connects to ancestor 0)

**Why back edges indicate cycles:**

- A back edge (u,v) means v is an ancestor of u in the DFS tree
- This creates a cycle: path from v to u in tree + edge (u,v) = cycle
- In undirected graphs, ignore edges to immediate parent (not real back edges)

**General rule for cycle detection:**

- **Undirected graph:** Has cycle ⟺ DFS finds back edge (not to parent)
- **Directed graph:** Has cycle ⟺ DFS finds back edge

---

## Challenge Problems

### Challenge 1: Worst-Case Analysis

**For a graph with |V| = n vertices:**

**Maximum edges in simple undirected graph:** n(n-1)/2 = O(n²)

- Each vertex can connect to (n-1) others
- Divide by 2 because each edge counted twice
- For n=4: max 6 edges

**Maximum edges in simple directed graph:** n(n-1) = O(n²)

- Each vertex can have directed edge to (n-1) others
- No division by 2 since edges are directed
- For n=4: max 12 edges

**In the worst case, is O(V + E) = O(V²)?** YES

- When E = O(V²) (dense graph), V + E = O(V²)
- V² dominates V, so O(V + V²) = O(V²)
- This is why adjacency list BFS is O(V + E) = O(V²) worst case

### Challenge 2: Practical Complexity

**A social network:** 1 million users, 50 million friendships

**What is |V|?** 1,000,000 (users)

**What is |E|?** 50,000,000 (friendships)

**Is this graph sparse or dense?** SPARSE

- Maximum edges: |V|(|V|-1)/2 ≈ 500,000,000,000 (500 billion)
- Actual edges: 50,000,000 (50 million)
- This is only 0.01% of maximum possible edges!

**Space needed with adjacency list:** O(V + E) = O(1M + 50M) = O(51M) entries

- Store 51 million integers (≈ 200 MB with overhead)

**Space needed with adjacency matrix:** O(V²) = O(1M²) = O(1 trillion) entries

- 1 trillion bits = 125 GB minimum!

**For BFS/DFS, which representation is more efficient?** ADJACENCY LIST

- List: O(V + E) = O(51M) ≈ 51 million operations
- Matrix: O(V²) = O(1T) ≈ 1 trillion operations
- List is ~20,000× more efficient!

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
