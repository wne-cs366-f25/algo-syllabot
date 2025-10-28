# Greedy Algorithms: In-Class Activity Solutions

## Part 1: Interval Scheduling Practice

### Practice Problem 1: Job Scheduling

**Given jobs:**

```python
jobs = [(1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16)]
# Indices: 0       1       2       3       4       5       6        7        8        9         10
```

#### Step 1: Sort by Finish Time

| Original Index | Job (start, finish) | Finish Time |
| -------------- | ------------------- | ----------- |
| 0              | (1, 4)              | 4           |
| 1              | (3, 5)              | 5           |
| 2              | (0, 6)              | 6           |
| 3              | (5, 7)              | 7           |
| 4              | (3, 9)              | 9           |
| 5              | (5, 9)              | 9           |
| 6              | (6, 10)             | 10          |
| 7              | (8, 11)             | 11          |
| 8              | (8, 12)             | 12          |
| 9              | (2, 14)             | 14          |
| 10             | (12, 16)            | 16          |

**Sorted order:** `[(1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16)]`

#### Step 2: Apply Greedy Algorithm

**Algorithm**: Select the job with earliest finish time that doesn't conflict with previously selected jobs.

| Step | Current Job     | Start | Finish | Last Finish | Compatible? | Action     |
| ---- | --------------- | ----- | ------ | ----------- | ----------- | ---------- |
| 1    | Job 0 (1, 4)    | 1     | 4      | -∞          | ✓           | **SELECT** |
| 2    | Job 1 (3, 5)    | 3     | 5      | 4           | ✗ (3 < 4)   | Skip       |
| 3    | Job 2 (0, 6)    | 0     | 6      | 4           | ✗ (0 < 4)   | Skip       |
| 4    | Job 3 (5, 7)    | 5     | 7      | 4           | ✓ (5 ≥ 4)   | **SELECT** |
| 5    | Job 4 (3, 9)    | 3     | 9      | 7           | ✗ (3 < 7)   | Skip       |
| 6    | Job 5 (5, 9)    | 5     | 9      | 7           | ✗ (5 < 7)   | Skip       |
| 7    | Job 6 (6, 10)   | 6     | 10     | 7           | ✗ (6 < 7)   | Skip       |
| 8    | Job 7 (8, 11)   | 8     | 11     | 7           | ✓ (8 ≥ 7)   | **SELECT** |
| 9    | Job 8 (8, 12)   | 8     | 12     | 11          | ✗ (8 < 11)  | Skip       |
| 10   | Job 9 (2, 14)   | 2     | 14     | 11          | ✗ (2 < 11)  | Skip       |
| 11   | Job 10 (12, 16) | 12    | 16     | 11          | ✓ (12 ≥ 11) | **SELECT** |

#### Answer

**Selected jobs (by original indices):** 0, 3, 7, 10

**Total jobs scheduled:** 4

**Selected intervals:** `[(1, 4), (5, 7), (8, 11), (12, 16)]`

**Timeline visualization:**

```
0---1---2---3---4---5---6---7---8---9---10--11--12--13--14--15--16
    [===Job 0===]
                    [=Job 3=]
                                 [==Job 7==]
                                                  [===Job 10===]
```

---

### Practice Problem 2: Conference Talk Selection

**Given talks:**

```python
talks = [(2, 6), (1, 3), (4, 7), (6, 9), (5, 8), (8, 10)]
# Index:   0       1       2       3       4       5
```

#### Step 1: Sort by Finish Time

| Original Index | Talk (start, finish) | Finish Time |
| -------------- | -------------------- | ----------- |
| 1              | (1, 3)               | 3           |
| 0              | (2, 6)               | 6           |
| 2              | (4, 7)               | 7           |
| 4              | (5, 8)               | 8           |
| 3              | (6, 9)               | 9           |
| 5              | (8, 10)              | 10          |

**Sorted order:** `[(1, 3), (2, 6), (4, 7), (5, 8), (6, 9), (8, 10)]`

#### Step 2: Apply Earliest Finish Time Greedy Algorithm

| Step | Current Talk   | Start | Finish | Last Finish | Compatible? | Action     |
| ---- | -------------- | ----- | ------ | ----------- | ----------- | ---------- |
| 1    | Talk 1 (1, 3)  | 1     | 3      | -∞          | ✓           | **SELECT** |
| 2    | Talk 0 (2, 6)  | 2     | 6      | 3           | ✗ (2 < 3)   | Skip       |
| 3    | Talk 2 (4, 7)  | 4     | 7      | 3           | ✓ (4 ≥ 3)   | **SELECT** |
| 4    | Talk 4 (5, 8)  | 5     | 8      | 7           | ✗ (5 < 7)   | Skip       |
| 5    | Talk 3 (6, 9)  | 6     | 9      | 7           | ✗ (6 < 7)   | Skip       |
| 6    | Talk 5 (8, 10) | 8     | 10     | 7           | ✓ (8 ≥ 7)   | **SELECT** |

**Selected talks:** 1, 2, 5 (by original indices)

**Total talks scheduled:** 3

**Selected intervals:** `[(1, 3), (4, 7), (8, 10)]`

#### Step 3: Try Alternative Greedy Strategies

##### Alternative 1: Earliest Start Time

**Sort by start time:**

```python
sorted_by_start = [(1, 3), (2, 6), (4, 7), (5, 8), (6, 9), (8, 10)]
```

Apply greedy algorithm:

| Step | Talk    | Start | Finish | Last Finish | Compatible? | Action     |
| ---- | ------- | ----- | ------ | ----------- | ----------- | ---------- |
| 1    | (1, 3)  | 1     | 3      | -∞          | ✓           | **SELECT** |
| 2    | (2, 6)  | 2     | 6      | 3           | ✗           | Skip       |
| 3    | (4, 7)  | 4     | 7      | 3           | ✓           | **SELECT** |
| 4    | (5, 8)  | 5     | 8      | 7           | ✗           | Skip       |
| 5    | (6, 9)  | 6     | 9      | 7           | ✗           | Skip       |
| 6    | (8, 10) | 8     | 10     | 7           | ✓           | **SELECT** |

**Result:** 3 talks selected - `[(1, 3), (4, 7), (8, 10)]`

**Comparison:** For this input, earliest start time produces the SAME result! ✓

##### Alternative 2: Shortest Duration

**Calculate durations and sort:**

| Talk    | Duration | Start | Finish |
| ------- | -------- | ----- | ------ |
| (1, 3)  | 2        | 1     | 3      |
| (6, 9)  | 3        | 6     | 9      |
| (2, 6)  | 4        | 2     | 6      |
| (4, 7)  | 3        | 4     | 7      |
| (5, 8)  | 3        | 5     | 8      |
| (8, 10) | 2        | 8     | 10     |

**Sorted by duration (ties broken arbitrarily):**

```python
shortest_first = [(1, 3), (8, 10), (4, 7), (5, 8), (6, 9), (2, 6)]
```

Apply greedy algorithm:

| Step | Talk    | Duration | Start | Finish | Last Finish | Compatible? | Action     |
| ---- | ------- | -------- | ----- | ------ | ----------- | ----------- | ---------- |
| 1    | (1, 3)  | 2        | 1     | 3      | -∞          | ✓           | **SELECT** |
| 2    | (8, 10) | 2        | 8     | 10     | 3           | ✓ (8 ≥ 3)   | **SELECT** |
| 3    | (4, 7)  | 3        | 4     | 7      | 10          | ✗ (4 < 10)  | Skip       |
| 4    | (5, 8)  | 3        | 5     | 8      | 10          | ✗ (5 < 10)  | Skip       |
| 5    | (6, 9)  | 3        | 6     | 9      | 10          | ✗ (6 < 10)  | Skip       |
| 6    | (2, 6)  | 4        | 2     | 6      | 10          | ✗ (2 < 10)  | Skip       |

**Result:** Only 2 talks selected - `[(1, 3), (8, 10)]`

**Comparison:** Shortest duration produces a WORSE result (2 talks vs 3 talks) ✗

#### Summary of Comparisons

| Strategy                 | Talks Selected | Result                                            |
| ------------------------ | -------------- | ------------------------------------------------- |
| **Earliest Finish Time** | 3              | `[(1, 3), (4, 7), (8, 10)]` ✓ OPTIMAL             |
| **Earliest Start Time**  | 3              | `[(1, 3), (4, 7), (8, 10)]` ✓ Same for this input |
| **Shortest Duration**    | 2              | `[(1, 3), (8, 10)]` ✗ SUBOPTIMAL                  |

**Key Insight:** While earliest start time happened to work for this particular input, it's NOT guaranteed to be optimal in general. Only earliest finish time is provably optimal for all inputs!

---

## Part 2: Informal Proof Practice

### Proof that Earliest Finish Time Algorithm is Optimal

#### Option A: Exchange Argument

**Claim:** The greedy algorithm that selects intervals by earliest finish time produces a maximum-size set of compatible intervals.

**Proof (Exchange Argument):**

Let G = {g₁, g₂, ..., gₖ} be the greedy solution, sorted by finish time.
Let O = {o₁, o₂, ..., oₘ} be any optimal solution, sorted by finish time.

Assume for contradiction that k < m (greedy selected fewer intervals than optimal).

**Key observation:** We'll show that for all i, the i-th greedy choice finishes no later than the i-th optimal choice: f(gᵢ) ≤ f(oᵢ).

**Proof by induction:**

_Base case (i=1):_ The greedy algorithm picks the interval with earliest finish time among all intervals, so f(g₁) ≤ f(o₁).

_Inductive step:_ Assume f(gᵢ) ≤ f(oᵢ).

- Since f(gᵢ) ≤ f(oᵢ), and oᵢ₊₁ is compatible with oᵢ (meaning s(oᵢ₊₁) ≥ f(oᵢ)), we know that oᵢ₊₁ is also compatible with gᵢ (since s(oᵢ₊₁) ≥ f(oᵢ) ≥ f(gᵢ)).
- The greedy algorithm considers all intervals compatible with gᵢ and chooses the one with earliest finish time.
- Therefore, f(gᵢ₊₁) ≤ f(oᵢ₊₁).

**Conclusion:** By induction, f(gᵢ) ≤ f(oᵢ) for all i ≤ k.

Since f(gₖ) ≤ f(oₖ), and O has m > k intervals, oₖ₊₁ must be compatible with oₖ. But since f(gₖ) ≤ f(oₖ), oₖ₊₁ is also compatible with gₖ. This contradicts the greedy algorithm's termination - it would have selected another interval!

Therefore, our assumption that k < m must be false. The greedy solution is optimal. ∎

---

#### Option B: Greedy Stays Ahead

**Claim:** The greedy algorithm that selects intervals by earliest finish time produces a maximum-size set of compatible intervals.

**Proof (Greedy Stays Ahead):**

Let G = {g₁, g₂, ..., gₖ} be the greedy solution.
Let O = {o₁, o₂, ..., oₘ} be any optimal solution.

We'll prove that the greedy solution "stays ahead" of any optimal solution at each step.

**Define "stays ahead":** After selecting i intervals, greedy's last finish time is no later than optimal's: f(gᵢ) ≤ f(oᵢ).

**Proof by induction on i:**

_Base case (i=1):_ Greedy picks the interval with earliest finish time among ALL intervals. Since o₁ is some interval, we have f(g₁) ≤ f(o₁). ✓

_Inductive step:_ Assume f(gᵢ) ≤ f(oᵢ).

Now consider selecting the (i+1)-th interval:

- Since intervals in O are compatible, we know s(oᵢ₊₁) ≥ f(oᵢ)
- By the inductive hypothesis, f(gᵢ) ≤ f(oᵢ)
- Therefore, s(oᵢ₊₁) ≥ f(oᵢ) ≥ f(gᵢ)
- This means oᵢ₊₁ is compatible with gᵢ

Since oᵢ₊₁ is compatible with gᵢ, the greedy algorithm considered oᵢ₊₁ (and all other compatible intervals) when selecting gᵢ₊₁. Greedy chose the compatible interval with earliest finish time, so:

f(gᵢ₊₁) ≤ f(oᵢ₊₁) ✓

**Why this proves optimality:**

Since greedy "stays ahead" at each step, it finishes earlier and thus has more opportunities to schedule additional intervals. If optimal has m intervals, greedy can schedule at least m intervals too (since greedy's earlier finish times leave room for at least as many future intervals). Therefore k ≥ m, and greedy is optimal. ∎

---

## Part 3: Combine Sticks Problem (PA4 Preview)

### Question 1: Greedy Strategy

**Optimal Greedy Strategy:** Always combine the two smallest sticks first.

**Reasoning:**

- Each stick's length gets added to the total cost once for every time it's combined
- Sticks combined early appear in more subsequent combinations
- By combining smallest sticks first, we minimize the contribution of smaller values being counted multiple times

---

### Question 2: Example Walkthrough

**Input:** `[1, 3, 5, 7]`

#### Greedy Approach (Combine Smallest First)

We'll use a min-heap to efficiently get the two smallest sticks.

| Step | Available Sticks | Two Smallest | Cost   | Remaining Sticks |
| ---- | ---------------- | ------------ | ------ | ---------------- |
| 0    | [1, 3, 5, 7]     | -            | 0      | [1, 3, 5, 7]     |
| 1    | [1, 3, 5, 7]     | 1, 3         | 1+3=4  | [4, 5, 7]        |
| 2    | [4, 5, 7]        | 4, 5         | 4+5=9  | [7, 9]           |
| 3    | [7, 9]           | 7, 9         | 7+9=16 | [16]             |

**Total cost = 4 + 9 + 16 = 29**

**Detailed trace:**

```
Initial: [1, 3, 5, 7]

Step 1: Combine 1 and 3
  Cost = 4
  Remaining = [4, 5, 7]
  Running total = 4

Step 2: Combine 4 and 5
  Cost = 9
  Remaining = [7, 9]
  Running total = 4 + 9 = 13

Step 3: Combine 7 and 9
  Cost = 16
  Remaining = [16]
  Running total = 13 + 16 = 29

TOTAL COST: 29
```

#### Alternative Approach 1: Combine Largest First

| Step | Available Sticks | Two Largest | Cost    | Remaining Sticks |
| ---- | ---------------- | ----------- | ------- | ---------------- |
| 0    | [1, 3, 5, 7]     | -           | 0       | [1, 3, 5, 7]     |
| 1    | [1, 3, 5, 7]     | 5, 7        | 5+7=12  | [1, 3, 12]       |
| 2    | [1, 3, 12]       | 3, 12       | 3+12=15 | [1, 15]          |
| 3    | [1, 15]          | 1, 15       | 1+15=16 | [16]             |

**Total cost = 12 + 15 + 16 = 43**

#### Alternative Approach 2: Combine Extremes (Smallest + Largest)

| Step | Available Sticks | Smallest + Largest | Cost    | Remaining Sticks |
| ---- | ---------------- | ------------------ | ------- | ---------------- |
| 0    | [1, 3, 5, 7]     | -                  | 0       | [1, 3, 5, 7]     |
| 1    | [1, 3, 5, 7]     | 1, 7               | 1+7=8   | [3, 5, 8]        |
| 2    | [3, 5, 8]        | 3, 8               | 3+8=11  | [5, 11]          |
| 3    | [5, 11]          | 5, 11              | 5+11=16 | [16]             |

**Total cost = 8 + 11 + 16 = 35**

#### Comparison

| Strategy                   | Total Cost | Comparison to Optimal |
| -------------------------- | ---------- | --------------------- |
| **Combine Smallest First** | **29**     | ✓ OPTIMAL             |
| Combine Largest First      | 43         | +48% worse            |
| Combine Extremes           | 35         | +21% worse            |

**Conclusion:** The greedy strategy of combining the two smallest sticks first produces the minimum total cost!

---

### Question 3 (Challenge): Informal Proof of Optimality

**Claim:** Always combining the two smallest sticks minimizes the total cost.

**Proof Sketch (Exchange Argument):**

Let G be the greedy solution (always combine two smallest).
Let O be any optimal solution.

**Key observation:** In any solution, we can represent the combining process as a binary tree where:

- Leaves are the original sticks
- Internal nodes represent combined sticks
- The depth of a leaf determines how many times its length is counted in the total cost

**Total cost formula:**

```
Total Cost = Σ (stick_length × depth_in_tree)
```

**Exchange argument:**

Suppose O differs from G. Find the first step where they differ.

At this step, let's say:

- G combines sticks of length a and b (where a, b are the two smallest)
- O combines sticks of length c and d (where at least one of c or d is not among the two smallest)

Without loss of generality, assume a ≤ b ≤ c ≤ d.

In O's tree, c appears at depth d_c and a appears at depth d_a.
Since O didn't combine a first, we know that a appears deeper in the tree (gets counted more times).

**Exchange:** Swap the positions of a and c in O's tree.

- This decreases the total cost by: (c - a) × (d_a - d_c)
- Since c > a and d_a > d_c (a is deeper), this is a positive value
- We've improved O's solution, contradicting that O was optimal

By repeatedly applying this exchange, we can transform any optimal solution into the greedy solution without increasing cost.

Therefore, the greedy solution is optimal.

**Intuition:** Smaller sticks should be combined early (appear at greater depths) so their small values are multiplied by depth more times, rather than large values being multiplied.

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
