Section 4.5: Hamiltonian Cycle Problem - ANSWER KEY

================================================================================
PART 1: Hamiltonian Cycle Problem
================================================================================

Given:           a graph  G = (V, E) of order  n  and size  m
Find:          a Hamiltonian cycle in G, that is, find a cycle in  G  that 
               includes every vertex of  V; or indicate that no such 
               Hamiltonian cycle exists.

More formally, find an ordering of all  n  vertices of  V, say
                                        v1, v2, …, vn, v1
so that  
* vi  and  vi+1  are adjacent for all  i = 1, 2, …, n – 1
* vn  and  v1  are adjacent
* no vertex is repeated in the list  v1, v2, …, vn
* the list  v1, v2, …, vn  contains all  n  vertices of  V

--------------------------------------------------------------------------------
ADJACENCY MATRIX CHECK:
--------------------------------------------------------------------------------

If we successfully find a Hamiltonian cycle, then
        for all  i = 1, 2, ..., n-1,  the vertex  x[i]  must be adjacent to  x[i+1]
                a[ x[i] ][ x[i+1] ] = 1
        x[n]  must be adjacent to  x[1]
                a[ x[n] ][ x[1] ] = 1

--------------------------------------------------------------------------------
MAIN ALGORITHM:
--------------------------------------------------------------------------------

hamiltonian(a, x){
  n = a.last
  x[1] = 1                // can assume any Hamiltonian cycle 
  used[1] = true          // begins and ends at vertex 1
  for i = 2 to n
    used[i] = false
  if (rhamiltonian(a, 2 , x))
        // output solution
}

--------------------------------------------------------------------------------
RECURSIVE BACKTRACKING:
--------------------------------------------------------------------------------

rhamiltonian(a, k, x){
// returns true if x[1],x[2],...,x[k] is a (partial) solution
  n = a.last

  for j = 2 to n {

    x[k] = j
    if (path_ok(a, k, x)){

      used[x[k]] = true
      if (k == n) {
            // output x (use a loop since x is an array)
         return true
         }
         else
            rhamiltonian(a, k+1, x)

      used[x[k]] = false
    }
  }
  return false
}

--------------------------------------------------------------------------------
PATH VALIDATION:
--------------------------------------------------------------------------------

path_ok(a, k, x){
// returns true if vertex x[k] is "unused" and x[k-1] is adjacent 
// to x[k]; if k = n, it also checks if x[k] is adjacent to x[1] 
  n = a.last
  if (used[x[k]])
    return false
  if (k < n)
    return (a[x[k-1]][x[k]] == 1)
  else
    return (a[x[k-1]][x[k]] == 1 && a[x[k]][x[1]] == 1)
}


================================================================================
PART 2: Traveling Salesperson Problem (TSP)
================================================================================

Given a set of  n  cities and the cost of travel between various cities, 
determine the cheapest way for a traveling salesperson to visit each city 
exactly once and return to the starting city.

In graph theoretic terms:
Given:    a weighted graph  G = (V, E) of order  n  and size  m  
          with weight function  w, defined on the edges
Find:     a Hamiltonian cycle in G of minimum total weight

More formally, find an ordering of all  n  vertices of  V, say
                                        v1, v2, …, vn, v1
so that  
* vi  and  vi+1  are adjacent for all  i = 1, 2, …, n – 1
* vn  and  v1  are adjacent
* no vertex is repeated in the list  v1, v2, …, vn
* the list  v1, v2, …, vn  contains all  n  vertices of  V
* among all possible orderings, w(v1v2) + w(v2v3) + ... + w(vn-1vn) + w(vnv1) 
  is a minimum

--------------------------------------------------------------------------------
MAIN TSP ALGORITHM:
--------------------------------------------------------------------------------

tsp(weight, x){
  // minCost will contain the cost of a minimum tour
  // minTour will contain the ordering (tour) of vertices
  // Assume both minCost and minTour are global variables
  // weight is the weight matrix (data for the weights of edges)
  // x is the array used to backtrack through possible tours
  // used keeps track of which vertices are used – no repeats

  n = adj.last
  x[1] = 1                // can assume any tour of vertices 
  used[1] = true          // begins and ends at vertex 1

  minCost = MAXINT
  minTour[1] = 1

  for i = 2 to n
    used[i] = false
  rtsp(weight, 2 , x)
}

--------------------------------------------------------------------------------
RECURSIVE TSP BACKTRACKING:
--------------------------------------------------------------------------------

rtsp(w, k, x) {
// returns true if x[1],x[2],...,x[k] is a (partial) tour
  n = adj.last
  for j = 2 to n {
    x[k] = j
    if (path_ok(w, k, x)) {
      used[x[k]] = true
      if (k == n) { 
        // found a tour; find total cost and compare to minCost
        cost = 0
        for i = 1 to n-1
          cost = cost + w[x[i]][x[i+1]]
        cost = cost + w[x[n]][x[1]]
        
        if (cost < minCost) {
          minCost = cost
          for i = 1 to n
            minTour[i] = x[i]
        }
      }
      else
        rtsp(w, k+1, x)
      used[x[k]] = false
    }
  }
  return false
}

--------------------------------------------------------------------------------
TSP PATH VALIDATION:
--------------------------------------------------------------------------------

path_ok(w, k, x) {
  n = a.last
  if (used[x[k]])
    return false
  if (k < n) {          // check if x[k-1] and x[k] are adjacent
    if (w[x[k-1]][x[k]] == MAXINT)
      return false
    else
      return true
  }
  else {  
    if (w[x[k-1]][x[k]] == MAXINT || w[x[k]][x[1]] == MAXINT)
      return false
    else
      return true
  }
}

---

**!!! IMPLEMENTATION NOTE: Handling MAXINT (Infinity) !!!**
When translating `MAXINT` (representing infinity or no edge) to a programming language like Java, be cautious about integer overflow. If you add to `Integer.MAX_VALUE`, it can wrap around to a negative number, potentially leading to incorrect path comparisons.
**Recommendation:**
1.  Check for `MAXINT` before performing additions (e.g., `if (w[u][v] == MAXINT) continue;`).
2.  Use a "safe infinity" value (e.g., `Integer.MAX_VALUE / 2`) that allows for additions without overflow.
3.  Consider using `long` for `cost` accumulation if weights can be large.

---

================================================================================
KEY CONCEPTS FOR DISCUSSION:
================================================================================

1. HAMILTONIAN CYCLE:
   - We're looking for ANY Hamiltonian cycle (existence problem)
   - Returns true/false when found/not found
   - Fixed starting vertex (vertex 1) is okay due to cycle symmetry

2. TSP (OPTIMIZATION):
   - We need to find the MINIMUM cost Hamiltonian cycle
   - Must explore ALL possible tours
   - Keep track of best tour found so far (minCost and minTour)
   - Cannot stop early when first tour is found

3. BACKTRACKING STRUCTURE:
   - Try each unused vertex at position k
   - Check if it forms a valid partial path
   - Recursively fill next position
   - Backtrack by marking vertex as unused

4. PATH VALIDATION DIFFERENCES:
   - Hamiltonian: Just check adjacency (a[i][j] == 1)
   - TSP: Check if edge weight exists (w[i][j] != MAXINT)
   
5. WHEN k == n:
   - Hamiltonian: Check if x[n] connects back to x[1], return true if yes
   - TSP: Calculate total cost, update minimum if better, continue searching

6. TIME COMPLEXITY:
   - Both algorithms have O(n!) worst-case time complexity
   - TSP is worse because it must examine all tours, not just find one

---

_Course content developed by Declan Gray-Mullen for WNEU with Gemini_
