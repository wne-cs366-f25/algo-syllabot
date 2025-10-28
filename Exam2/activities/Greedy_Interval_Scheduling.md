# Greedy Algorithms: In-Class Activity

## Overview

Today you'll get hands-on practice with greedy algorithms through three activities:

1. **Interval Scheduling Practice** - Apply the earliest finish time algorithm
2. **Informal Proof Writing** - Practice exchange arguments and greedy-stays-ahead reasoning
3. **Combine Sticks Problem** - Introduction to PA4's problem

---

## Part 1: Interval Scheduling Practice

### Practice Problem 1: Job Scheduling

You need to schedule as many jobs as possible on a single machine. Given the following jobs with start and finish times:

```python
jobs = [(1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16)]
```

**Tasks**:

1. Sort the jobs by finish time
2. Apply the greedy algorithm step-by-step
3. List which jobs are selected (by their indices) and the total count

### Practice Problem 2: Conference Talk Selection

You're organizing a conference and want to accept as many talks as possible in a single room. Here are the proposed talks with (start, finish) times:

```python
talks = [(2, 6), (1, 3), (4, 7), (6, 9), (5, 8), (8, 10)]
```

**Tasks**:

1. Apply the earliest finish time greedy algorithm
2. Show your work step-by-step (list the sorted order and selection process)
3. Could any other greedy strategy (earliest start, shortest duration) work equally well for this input? Try one alternative and compare!

---

## Part 2: Informal Proof Practice

Understanding WHY a greedy algorithm works is just as important as implementing it!

### Proof Technique 1: Exchange Argument

**Template**:

```
Claim: [State what your greedy algorithm optimizes]

Proof (Exchange Argument):
1. Let G be the greedy solution
2. Assume there exists an optimal solution O where O ≠ G
3. Find the first position where O differs from G
4. Show that we can exchange O's choice with G's choice without making O worse
5. After all exchanges, O becomes G and is still optimal
6. Therefore, G must be optimal. ∎
```

### Proof Technique 2: Greedy Stays Ahead

**Template**:

```
Claim: [State what your greedy algorithm optimizes]

Proof (Greedy Stays Ahead):
1. Let G be the greedy solution and O be any optimal solution
2. Show that after each greedy choice, G is "at least as good" as O
   - For interval scheduling: G's last finish time ≤ O's last finish time
3. Since G "stays ahead" at each step, it can fit at least as many items as O
4. Therefore, G is optimal. ∎
```

### Your Turn: Prove Interval Scheduling Correctness

**Problem**: Write an informal proof that the earliest finish time algorithm produces an optimal solution for interval scheduling.

**Choose one approach**:

- **Option A**: Exchange Argument
- **Option B**: Greedy Stays Ahead

**Hints for Exchange Argument**:

- What happens if the optimal solution picks a meeting that finishes later than the greedy choice?
- Can you replace that meeting with the greedy choice without losing the ability to schedule future meetings?

**Hints for Greedy Stays Ahead**:

- After selecting k activities, how does greedy's last finish time compare to optimal's?
- Why does finishing earlier give greedy more opportunities for future selections?

**Write your proof below** (aim for 4-6 sentences):

```
[Your proof here]
```

---

## Part 3: Combine Sticks Problem (PA4 Preview)

### Problem Statement

You have `n` sticks of different lengths. You want to connect them all into one long stick.

**Cost Rule**: Connecting two sticks costs the sum of their lengths.

**Goal**: Minimize the total cost to connect all sticks.

### Example

**Input**: Sticks of length `[2, 4, 3]`

**Approach 1**:

- Connect 2 and 3 → cost = 5, remaining: `[5, 4]`
- Connect 5 and 4 → cost = 9, remaining: `[9]`
- **Total cost = 5 + 9 = 14**

**Approach 2**:

- Connect 2 and 4 → cost = 6, remaining: `[6, 3]`
- Connect 6 and 3 → cost = 9, remaining: `[9]`
- **Total cost = 6 + 9 = 15**

### Your Tasks

**Question 1**: What greedy strategy would minimize the total cost? (Think about which sticks to combine first)

**Question 2**: Try your strategy on this example: `[1, 3, 5, 7]`

- Show each step
- Calculate the total cost
- Compare with at least one alternative approach

**Question 3** (Challenge): Can you sketch an informal proof that your greedy approach is optimal using an exchange argument?

**Hints**:

- Think about how many times each stick's length gets "counted" in the total cost
- Smaller sticks that are combined early get counted more times
- Your proof should explain why combining smallest sticks first minimizes total cost

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
