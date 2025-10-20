# Heaps Activity Solutions

## Section 3.5: Heaps Activity

### Problem 1: Which of the following are heaps?

**Array 1:**

```
array a = [100, 19, 36, 19, 3, 25, 1, 2, 7]
         [  1,  2,  3,  4, 5,  6, 7, 8, 9]
a.heapSize = 9
a.length = 9
```

**Answer: YES** - This IS a heap.

**Explanation:**
The heap property states that for every node i other than the root, the data stored at the parent of i must be greater than or equal to the data stored at node i: a[parent(i)] ≥ a[i].

Let's check each parent-child relationship:

- Node 1 (100): Root - OK
- Node 2 (19): parent = 1 (100), 100 ≥ 19 ✓
- Node 3 (36): parent = 1 (100), 100 ≥ 36 ✓
- Node 4 (19): parent = 2 (19), 19 ≥ 19 ✓
- Node 5 (3): parent = 2 (19), 19 ≥ 3 ✓
- Node 6 (25): parent = 3 (36), 36 ≥ 25 ✓
- Node 7 (1): parent = 3 (36), 36 ≥ 1 ✓
- Node 8 (2): parent = 4 (19), 19 ≥ 2 ✓
- Node 9 (7): parent = 4 (19), 19 ≥ 7 ✓

Wait, let me recheck this more carefully. Actually, this IS a valid heap - all parent-child relationships satisfy the heap property.

**Corrected Answer: YES** - This IS a heap.

---

**Array 2:**

```
array a = [100, 19, 36, 17, 3, 40, 1, 2, 7, 8]
         [  1,  2,  3,  4, 5,  6, 7, 8, 9, 10]
a.heapSize = 7
a.length = 10
```

**Answer: NO** - This is NOT a heap.

**Explanation:**
Since heapSize = 7, we only consider elements at indices 1-7: [100, 19, 36, 17, 3, 40, 1]

Let's check the heap property:

- Node 1 (100): Root - OK
- Node 2 (19): parent = 1 (100), 100 ≥ 19 ✓
- Node 3 (36): parent = 1 (100), 100 ≥ 36 ✓
- Node 4 (17): parent = 2 (19), 19 ≥ 17 ✓
- Node 5 (3): parent = 2 (19), 19 ≥ 3 ✓
- Node 6 (40): parent = 3 (36), 36 ≥ 40 ✗ **VIOLATION!**
- Node 7 (1): parent = 3 (36), 36 ≥ 1 ✓

The heap property is violated at node 6 where 40 > 36 (its parent).

---

**Array 3:**

```
array a = [100, 19, 36, 17, 3, 40, 1, 2, 7, 8]
         [  1,  2,  3,  4, 5,  6, 7, 8, 9, 10]
a.heapSize = 5
a.length = 10
```

**Answer: YES** - This IS a heap.

**Explanation:**
Since heapSize = 5, we only consider elements at indices 1-5: [100, 19, 36, 17, 3]

Let's check the heap property:

- Node 1 (100): Root - OK
- Node 2 (19): parent = 1 (100), 100 ≥ 19 ✓
- Node 3 (36): parent = 1 (100), 100 ≥ 36 ✓
- Node 4 (17): parent = 2 (19), 19 ≥ 17 ✓
- Node 5 (3): parent = 2 (19), 19 ≥ 3 ✓

All parent-child relationships satisfy the heap property.

### Problem 2: Maximum Value Location

**Question:** For an array that does represent a heap with heapSize equal to the length of the array, where can you find the maximum value of the array?

**Answer:** At index 1 (the root of the heap).

**Explanation:**
In a max heap, the heap property guarantees that the parent is always greater than or equal to its children. Since the root (at index 1) has no parent and all other nodes have the root as an ancestor, the root must contain the maximum value in the entire heap.

### Problem 3: Heap Height

**Question:** What is the height of a heap with n nodes?

**Answer:** ⌊log₂(n)⌋ (floor of log base 2 of n)

**Explanation:**
A heap is a complete binary tree, which means:

- All levels are completely filled except possibly the last level
- The last level is filled from left to right

In a complete binary tree with n nodes:

- The height h satisfies: 2ʰ ≤ n < 2ʰ⁺¹
- Taking log₂ of all parts: h ≤ log₂(n) < h + 1
- Therefore: h = ⌊log₂(n)⌋

**Examples:**

- n = 1: height = ⌊log₂(1)⌋ = ⌊0⌋ = 0
- n = 2: height = ⌊log₂(2)⌋ = ⌊1⌋ = 1
- n = 3: height = ⌊log₂(3)⌋ = ⌊1.58⌋ = 1
- n = 4: height = ⌊log₂(4)⌋ = ⌊2⌋ = 2
- n = 7: height = ⌊log₂(7)⌋ = ⌊2.81⌋ = 2
- n = 8: height = ⌊log₂(8)⌋ = ⌊3⌋ = 3

### Problem 4: updateKey Algorithm

**Question:** Write an algorithm for the updateKey operation that maintains the heap property after the key at index i has been changed.

**Answer:**

```pseudocode
updateKey(v, i, n)
// v is the heap array
// i is the index where the key was changed
// n is the heapSize
// Assumption: only v[i] violates the heap property

// The key at position i might be larger than its parent (need to move up)
// or smaller than its children (need to move down)

// First, try moving up (in case the new key is larger)
while (i > 1 && v[i] > v[parent(i)])
{
    swap(v[i], v[parent(i)])
    i = parent(i)
}

// Then, try moving down (in case the new key is smaller)
// Use the existing siftdown operation
siftdown(v, i, n)
```

**Alternative Implementation (more explicit):**

```pseudocode
updateKey(v, i, n)
// v is the heap array
// i is the index where the key was changed  
// n is the heapSize

// Case 1: Key might be too large (violates heap property with parent)
// Move up the tree until heap property is restored
current = i
while (current > 1 && v[current] > v[parent(current)])
{
    swap(v[current], v[parent(current)])
    current = parent(current)
}

// Case 2: Key might be too small (violates heap property with children)
// Move down the tree until heap property is restored
current = i
while (left(current) <= n) // while current has at least a left child
{
    child = left(current)
    
    // Find the larger child
    if (right(current) <= n && v[right(current)] > v[left(current)])
        child = right(current)
    
    // If current violates heap property with larger child, swap
    if (v[child] > v[current])
    {
        swap(v[current], v[child])
        current = child
    }
    else
        break // heap property restored
}
```

**Explanation:**
The updateKey operation handles the case where a key at position i has been modified and may violate the heap property. The violation can occur in two ways:

1. **Key increased**: The new key might be larger than its parent, violating the heap property upward
2. **Key decreased**: The new key might be smaller than its children, violating the heap property downward

The algorithm handles both cases:
- First, it moves the element up the tree if it's too large for its current position
- Then, it moves the element down the tree if it's too small for its current position

**Time Complexity:** O(log n) - In the worst case, we traverse from a leaf to the root (or vice versa)

**Space Complexity:** O(1) - Only uses a constant amount of extra space

## Summary

1. **Array 1**: YES - Valid heap (all parent-child relationships satisfy heap property)
2. **Array 2**: NO - Invalid heap (node 6 value 40 > parent node 3 value 36)
3. **Array 3**: YES - Valid heap (considering only first 5 elements)
4. **Maximum location**: Always at index 1 (root) in a max heap
5. **Heap height**: ⌊log₂(n)⌋ for n nodes
6. **updateKey algorithm**: Move up if key increased, then move down if needed

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
