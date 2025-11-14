# Coin Change Dynamic Programming Solutions
## Section 8.2

---

## Problem Overview

Determine the **minimum number of coins** needed to make change for **A** cents, with a given set of **n** denominations. The denominations are arranged in **decreasing order**, and the smallest denomination is **1**.

### Variables:
- **A** = the amount of change (in cents)
- **denom** = array of denominations (types of available coins)
  - denom[1] > denom[2] > ... > denom[n] = 1
- **C[i][j]** = minimum number of coins needed to make j cents using only coins of denominations: denom[i], denom[i+1], ..., denom[n]
- **used[i][j]** = true if a coin of denomination denom[i] is used in the smallest set of coins to make j cents

---

## Optimal Substructure (Page 2)

### Recurrence Relation

For the (i, j)-subproblem, we must decide whether or not to use one coin of denomination denom[i].

**Two choices:**

1. **Use one coin of denom[i]:**
   - Requires: j ≥ denom[i]
   - Remaining change: j - denom[i]
   - Total coins: 1 + C[i][j-denom[i]]

2. **Don't use coin denom[i]:**
   - Use smaller denominations: denom[i+1], ..., denom[n]
   - Total coins: C[i+1][j]

### Formula:

```
C[i][j] = {
    C[i+1][j],                                    if denom[i] > j
    min{C[i+1][j], 1 + C[i][j-denom[i]]},        if denom[i] ≤ j
}
```

---

## Solution Location

**Question:** Once the array C has been filled, where is the solution to the problem for A cents and allowing all n denominations?

**Answer:** `C[1][A]`

This represents using all denominations (starting from denom[1]) to make A cents with minimum coins.

---

## Complete Algorithm (Page 2)

```
dynamicCoinChange(denom, A)
{
    n = denom.last

    // Base case: using only denomination denom[n] = 1 (pennies)
    for j = 0 to A
    {
        C[n][j] = j        // Need j coins of denomination 1 to make j cents
        used[n][j] = true  // Always use denomination denom[n] = 1
    }
    used[n][0] = false     // No coins needed to make 0 cents

    // Fill table from bottom-up (larger denominations first)
    for i = n - 1 downto 1
    {
        for j = 0 to A
        {
            // Two cases where we DON'T use denom[i]:
            // 1. Coin too large (denom[i] > j)
            // 2. Not using it is better (C[i+1][j] < 1 + C[i][j-denom[i]])
            if (denom[i] > j || C[i+1][j] < 1 + C[i][j-denom[i]])
            {
                C[i][j] = C[i+1][j]      // Don't use denom[i]
                used[i][j] = false
            }
            else
            {
                C[i][j] = 1 + C[i][j-denom[i]]  // Use denom[i]
                used[i][j] = true
            }
        }
    }
}
```

**Running Time:** O(n × A)
- Outer loop: n-1 iterations (from n-1 down to 1)
- Inner loop: A+1 iterations (from 0 to A)
- Total: O(n × A)

---

## Example Solution (Pages 3-4)

### Problem: Make 12 cents change
- **A = 12**
- **denom = [10, 6, 1]**
- **n = 3**

### Why This Example Matters: Greedy Fails!

**Important**: This denomination set [10, 6, 1] demonstrates why greedy coin selection doesn't always work!

**Greedy Approach (always pick largest coin first):**
- Pick 10¢ → 2 cents remaining
- Can't use 6¢ (too large)
- Pick 1¢ → 1 cent remaining
- Pick 1¢ → 0 cents remaining
- **Greedy result: 3 coins (10¢ + 1¢ + 1¢)**

**Optimal Dynamic Programming Solution:**
- Pick 6¢ → 6 cents remaining
- Pick 6¢ → 0 cents remaining
- **Optimal result: 2 coins (6¢ + 6¢)**

This is why we need DP! The greedy algorithm makes locally optimal choices but misses the globally optimal solution.

### Complete Tables

#### C Table (Minimum Number of Coins)

| C   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|-----|---|---|---|---|---|---|---|---|---|---|----|----|----|
| **1 (10¢)** | 0 | 1 | 2 | 3 | 4 | 5 | 1 | 2 | 3 | 4 | 1  | 2  | 2  |
| **2 (6¢)**  | 0 | 1 | 2 | 3 | 4 | 5 | 1 | 2 | 3 | 4 | 5  | 6  | 2  |
| **3 (1¢)**  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |

#### used Table (Is Denomination Used?)

| used | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|------|---|---|---|---|---|---|---|---|---|---|----|----|----|
| **1 (10¢)** | F | F | F | F | F | F | F | F | F | F | T  | T  | F  |
| **2 (6¢)**  | F | F | F | F | F | F | T | T | T | T | T  | T  | T  |
| **3 (1¢)**  | F | T | T | T | T | T | T | T | T | T | T  | T  | T  |

### Table Construction Explanation

#### Row 3 (Base case - only 1¢ coins available):
- C[3][0] = 0 (no coins needed for 0 cents)
- C[3][1] = 1, C[3][2] = 2, ..., C[3][12] = 12
- used[3][j] = true for all j > 0 (always use pennies)

#### Row 2 (6¢ and 1¢ coins available):
- **C[2][0] = 0:** No coins for 0 cents
- **C[2][1] through C[2][5]:** Can't use 6¢ (too big), so copy from row 3
  - C[2][1] = C[3][1] = 1
  - C[2][2] = C[3][2] = 2
  - C[2][3] = C[3][3] = 3
  - C[2][4] = C[3][4] = 4
  - C[2][5] = C[3][5] = 5
  - used[2][1..5] = false (6¢ not used)

- **C[2][6]:** Compare options
  - Don't use 6¢: C[3][6] = 6 pennies
  - Use 6¢: 1 + C[2][0] = 1 + 0 = 1
  - Choose 1 < 6, so C[2][6] = 1, used[2][6] = true

- **C[2][7] through C[2][9]:** Each uses one 6¢ coin plus remaining 1¢ coins
  - C[2][7] = 2, C[2][8] = 3, C[2][9] = 4
  - used[2][7..9] = true (all use 6¢)

- **C[2][10]:** Compare options
  - Don't use 6¢: C[3][10] = 10 pennies
  - Use 6¢: 1 + C[2][4] = 1 + 4 = 5 (one 6¢ + four 1¢)
  - Choose 5 < 10, so C[2][10] = 5, used[2][10] = true

- **C[2][11]:** Compare options
  - Don't use 6¢: C[3][11] = 11 pennies
  - Use 6¢: 1 + C[2][5] = 1 + 5 = 6 (one 6¢ + five 1¢)
  - Choose 6 < 11, so C[2][11] = 6, used[2][11] = true

- **C[2][12]:** Compare options
  - Don't use 6¢: C[3][12] = 12 pennies
  - Use 6¢: 1 + C[2][6] = 1 + 1 = 2 (two 6¢ coins)
  - Choose 2 < 12, so C[2][12] = 2, used[2][12] = true

#### Row 1 (10¢, 6¢, and 1¢ coins available):
- **C[1][0] through C[1][9]:** Can't use 10¢ (too big)
  - Copy from row 2
  - C[1][6] = C[2][6] = 1 (one 6¢)
  - used[1][1..9] = false

- **C[1][10]:** Compare options
  - Don't use 10¢: C[2][10] = 5 (from row 2: one 6¢ + four 1¢)
  - Use 10¢: 1 + C[1][0] = 1 + 0 = 1
  - Choose 1 < 5, so C[1][10] = 1, used[1][10] = true

- **C[1][11]:** Compare options
  - Don't use 10¢: C[2][11] = 6 (from row 2: one 6¢ + five 1¢)
  - Use 10¢: 1 + C[1][1] = 1 + 1 = 2 (one 10¢ + one 1¢)
  - Choose 2 < 6, so C[1][11] = 2, used[1][11] = true

- **C[1][12]:** Compare options (THIS IS KEY!)
  - Don't use 10¢: C[2][12] = 2 (two 6¢ coins)
  - Use 10¢: 1 + C[1][2] = 1 + 2 = 3 (one 10¢ + two 1¢)
  - Choose 2 < 3, so C[1][12] = 2, used[1][12] = false (10¢ NOT used in optimal!)

**Final Answer: C[1][12] = 2 coins (6¢ + 6¢)**

**This demonstrates the key insight:** Even though we have a 10¢ coin available, the optimal solution doesn't use it! The greedy approach would use the 10¢ coin and get 3 total coins, but DP finds the better solution of two 6¢ coins.

---

## Finding the Actual Coins

To determine which coins are used in the optimal solution:

### Traceback Algorithm

```
findCoins(C, used, denom, A)
{
    coins = []
    i = 1
    j = A

    while (j > 0 && i <= n)
    {
        if (used[i][j])
        {
            // Use a coin of denomination denom[i]
            coins.add(denom[i])
            j = j - denom[i]  // Reduce remaining amount
            // Stay at same i (can use same denomination again)
        }
        else
        {
            // Move to smaller denominations
            i = i + 1
        }
    }

    return coins
}
```

### Traceback for A = 12, denom = [10, 6, 1]

Starting at C[1][12] = 2, we trace back to find which coins were used:

1. **Start: i=1, j=12**
   - used[1][12] = false → move to i=2 (don't use 10¢)

2. **i=2, j=12**
   - used[2][12] = true → add 6¢ coin
   - New amount: j = 12 - 6 = 6
   - Stay at i=2

3. **i=2, j=6**
   - used[2][6] = true → add 6¢ coin
   - New amount: j = 6 - 6 = 0
   - Stop (j = 0)

**Coins used: 6¢ + 6¢ = 12¢ with 2 coins ✓**

**Compare to greedy approach which would give: 10¢ + 1¢ + 1¢ = 12¢ with 3 coins ✗**

---

## Practice Problems

### Problem 1: Make 37 cents
- denom = [25, 10, 5, 1]
- Answer: 4 coins (1 quarter + 1 dime + 2 pennies)

### Problem 2: Make 30 cents
- denom = [25, 10, 5, 1]
- Answer: 2 coins (3 dimes)

### Problem 3: Non-standard denominations
- Make 12 cents with denom = [7, 3, 1]
- Answer: 4 coins (3 + 3 + 3 + 3)

---

## Key Insights

1. **Bottom-Up Tabulation:** This algorithm uses bottom-up dynamic programming (tabulation), starting with the base case (smallest denomination only) and building up to include all denominations

2. **Greedy vs DP - WHY GREEDY FAILS:** This is the most important lesson! Coin change is NOT always optimal with greedy approaches!

   **Our class example demonstrates this perfectly:**
   - **Denomination set: [10, 6, 1]**
   - **Amount: 12 cents**
   - **Greedy approach (always pick largest):** 10¢ + 1¢ + 1¢ = **3 coins** ✗
   - **Optimal (DP):** 6¢ + 6¢ = **2 coins** ✓

   **Why greedy fails:** Greedy makes locally optimal choices (pick the largest coin that fits) but misses the globally optimal solution. By greedily choosing the 10¢ coin, we commit to needing 2 more pennies. If we had considered skipping the 10¢ coin, we'd find the better solution of two 6¢ coins.

3. **Optimal Substructure:** If we know the minimum coins for smaller amounts, we can build up to larger amounts by considering all choices

4. **Why DP Works:** The problem has:
   - **Overlapping subproblems:** We repeatedly compute the same subamounts (e.g., computing change for 6 cents multiple times)
   - **Optimal substructure:** The optimal solution for amount A uses optimal solutions for smaller amounts

   These properties make it perfect for dynamic programming!

5. **Pseudopolynomial Time:** O(n × A) depends on the numeric value A (not just the number of bits to represent A), making it pseudopolynomial rather than truly polynomial

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
