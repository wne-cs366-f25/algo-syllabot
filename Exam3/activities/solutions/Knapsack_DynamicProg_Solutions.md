# Dynamic Programming – Knapsack Problem Solutions
## (Simplified Version – Boolean Tabulation)

---

## Problem Overview

Given a set of n items with sizes S[1], S[2], ..., S[n] and a capacity k, find a subset of items so that the total size of the chosen items does not exceed the capacity and is a maximum possible (least amount of space left over).

---

## Example Problem: n = 5, k = 16, S = [2, 3, 7, 5, 6]

### Understanding the Subproblem Notation

**exist[i][j]** = TRUE if there is **some** subset from among the first **i** items whose sizes add up to **exactly j**

**belong[i][j]** = TRUE if, when constructing the subsolution for exist[i][j] = TRUE, item **i** belongs to the set of items corresponding to the (i,j)-subsolution

### Answers to Initial Questions (Page 1)

**exist[2][5] = TRUE**
- Reasoning: First 2 items are [2, 3]. Can we make exactly 5? Yes: 2 + 3 = 5

**belong[2][5] = TRUE**
- Reasoning: Item 2 (size 3) belongs to the solution that makes 5 (using items 2 and 3)

**exist[3][6] = FALSE**
- Reasoning: First 3 items are [2, 3, 7]. Can we make exactly 6? No valid combination
  - 2 alone = 2
  - 3 alone = 3
  - 7 alone = 7
  - 2+3 = 5
  - 2+7 = 9
  - 3+7 = 10
  - 2+3+7 = 12
  - None equal 6

**exist[5][6] = TRUE**
- Reasoning: First 5 items are [2, 3, 7, 5, 6]. Can we make exactly 6? Yes: item 5 has size 6

**belong[5][6] = TRUE**
- Reasoning: Item 5 (size 6) belongs to the solution

**exist[3][5] = TRUE**
- Reasoning: First 3 items are [2, 3, 7]. Can we make exactly 5? Yes: 2 + 3 = 5

**belong[3][5] = FALSE**
- Reasoning: Item 3 (size 7) does NOT belong to the solution for making 5. The solution uses items 1 and 2.

---

## Solution Location (Page 2)

**Question:** Once the array exist has been filled, where is the solution to the problem for all n items and capacity k?

**Answer:** `exist[n][k]` which is `exist[5][16]`

However, if exist[5][16] is FALSE, we need to search backwards in row 5 to find the largest j where exist[5][j] is TRUE to maximize knapsack usage.

---

## Complete Table Solution (Page 4)

### n = 5, k = 16, S = [2, 3, 7, 5, 6]

Items breakdown:
- Item 1: size 2
- Item 2: size 3
- Item 3: size 7
- Item 4: size 5
- Item 5: size 6

#### exist Table

| exist | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
|-------|---|---|---|---|---|---|---|---|---|---|----|----|----|----|----|----|----|
| **0** | T | F | F | F | F | F | F | F | F | F | F  | F  | F  | F  | F  | F  | F  |
| **1** | T | F | T | F | F | F | F | F | F | F | F  | F  | F  | F  | F  | F  | F  |
| **2** | T | F | T | T | F | T | F | F | F | F | F  | F  | F  | F  | F  | F  | F  |
| **3** | T | F | T | T | F | T | F | T | F | T | T  | F  | T  | F  | F  | F  | F  |
| **4** | T | F | T | T | F | T | F | T | T | T | T  | F  | T  | F  | T  | T  | F  |
| **5** | T | F | T | T | F | T | T | T | T | T | T  | T  | T  | T  | T  | T  | T  |

#### belong Table

| belong | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
|--------|---|---|---|---|---|---|---|---|---|---|----|----|----|----|----|----|----|
| **0**  | - | - | - | - | - | - | - | - | - | - | -  | -  | -  | -  | -  | -  | -  |
| **1**  | F | - | T | - | - | - | - | - | - | - | -  | -  | -  | -  | -  | -  | -  |
| **2**  | F | - | F | T | - | T | - | - | - | - | -  | -  | -  | -  | -  | -  | -  |
| **3**  | F | - | F | F | - | F | - | T | - | T | T  | -  | T  | -  | -  | -  | -  |
| **4**  | F | - | F | F | - | F | - | F | T | F | F  | -  | F  | -  | T  | T  | -  |
| **5**  | F | - | F | F | - | F | T | F | F | F | F  | T  | F  | T  | F  | F  | T  |

### Table Explanation

**Row 0 (no items):**
- exist[0][0] = TRUE (can make 0 with empty set)
- exist[0][j] = FALSE for all j > 0 (can't make positive sum with no items)

**Row 1 (item 1, size 2):**
- Can make 0 (empty set) or 2 (take item 1)
- belong[1][2] = TRUE (item 1 used)

**Row 2 (items 1-2, sizes [2,3]):**
- Can make: 0, 2, 3, 5
- 5 = 2+3, so belong[2][5] = TRUE

**Row 3 (items 1-3, sizes [2,3,7]):**
- Can make: 0, 2, 3, 5, 7, 9, 10, 12
- 7 is new (item 3 alone), belong[3][7] = TRUE
- 9 = 2+7, 10 = 3+7, 12 = 2+3+7

**Row 4 (items 1-4, sizes [2,3,7,5]):**
- Adds item 4 (size 5)
- New sums: 8 = 3+5, 14 = 7+5+2, 15 = 7+5+3

**Row 5 (items 1-5, sizes [2,3,7,5,6]):**
- Adds item 5 (size 6)
- Can now make: 6, 11, 13, 16 (new)
- **exist[5][16] = TRUE** - can completely fill the knapsack!

---

## Traceback Algorithm (Page 5)

### Algorithm to Find Which Items Are in the Knapsack

```
findKnapsackItems(belong, S, n, k)
{
    // Find the largest total that can be achieved
    totalSize = k
    while (totalSize > 0 && !exist[n][totalSize])
        totalSize--

    // Traceback to find which items belong
    selectedItems = []
    i = n
    j = totalSize

    while (j > 0 && i > 0)
    {
        if (belong[i][j])
        {
            // Item i belongs to the solution
            selectedItems.add(i)
            j = j - S[i]  // subtract this item's size
        }
        i = i - 1  // move to previous item
    }

    return selectedItems
}
```

### Traceback for Our Example (n=5, k=16)

Starting at exist[5][16] = TRUE (knapsack can be completely filled)

1. **Check belong[5][16] = TRUE**
   - Item 5 (size 6) is selected
   - New total: 16 - 6 = 10
   - Move to exist[4][10]

2. **Check belong[4][10] = FALSE**
   - Item 4 not used for this subproblem
   - Stay at total 10
   - Move to exist[3][10]

3. **Check belong[3][10] = TRUE**
   - Item 3 (size 7) is selected
   - New total: 10 - 7 = 3
   - Move to exist[2][3]

4. **Check belong[2][3] = TRUE**
   - Item 2 (size 3) is selected
   - New total: 3 - 3 = 0
   - Move to exist[1][0]

5. **j = 0, stop**

**Selected Items: {2, 3, 5}**
**Sizes: [3, 7, 6]**
**Total: 3 + 7 + 6 = 16 ✓**

---

## Algorithm Complexity

**Time Complexity:** O(n × k)
- Two nested loops: outer loop runs n times, inner loop runs k times

**Space Complexity:** O(n × k)
- Two 2D arrays (exist and belong), each of size (n+1) × (k+1)

---

## Key Insights

1. **Bottom-Up Approach:** Build solutions from smaller subproblems (fewer items, smaller capacities)

2. **Optimal Substructure:** Solution to (i,j) depends on solutions to smaller subproblems:
   - Either we use item i: check exist[i-1][j-S[i]]
   - Or we don't: check exist[i-1][j]

3. **Boolean Tabulation:** This simplified version only tracks whether exact sums are possible (TRUE/FALSE), not the maximum value

4. **Traceback Array:** The belong array lets us reconstruct which items were selected, not just whether a solution exists

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
