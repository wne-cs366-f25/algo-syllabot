# Data Structures and Sequences

**Week 2 - Thursday, Sept 4**  
**Exam Unit**: Exam1

## Overview

Arrays, linked lists, and dynamic arrays

## Materials

CLRS Chapter 10-11

## Class Plan

1. **Intro & Java Connections** (10 min)
   - Connect to familiar Java classes (ArrayList, LinkedList)
   - Core sequence operations overview
2. **Array Implementation** (15 min)
   - Static arrays: O(1) access, costly insertion
   - Dynamic arrays: Resizing strategy
   - **Key**: Amortized O(1) for append
3. **Linked List Implementation** (15 min)
   - Node structure and pointers
   - O(1) insertion at head, O(n) access
   - Singly vs Doubly linked
4. **Performance Comparison** (10 min)
   - Time complexity table
   - When to use each structure
   - Cache performance insights
5. **Practice Problems** (20 minutes)
   - Q1-Q2: Warm-up analysis questions
   - Q3-Q4: Implementation challenges
   - Q5-Q6: Understanding Check

## Learning Objectives

- Understand the sequence abstract data type and its essential operations
- Master the implementation trade-offs between arrays and linked lists
- Analyze time and space complexity of sequence operations
- Learn amortized analysis through dynamic arrays
- Apply sequence operations to solve computational problems
- Connect sequence performance to the [word-RAM model from Lesson 1](/Exam1/01_AlgorithmIntroduction.md#computational-model)
- Practice algorithm design using fundamental data structures

## The Sequence Abstract Data Type

A sequence is a fundamental data structure that stores elements in a specific order, providing indexed access to elements. This connects directly to our algorithmic analysis from Lessons 1-2 where we manipulated ordered data.

### Java Classes You Already Know

Before diving into implementations, let's connect to familiar Java classes:

- **`ArrayList<E>`**: Dynamic array implementation (like Python's list)
- **`LinkedList<E>`**: Doubly linked list implementation
- **`Vector<E>`**: Thread-safe dynamic array (mostly deprecated for ArrayList)
- **`ArrayDeque<E>`**: Resizable array deque (double-ended queue)
- **`Stack<E>`**: Stack implementation (extends Vector)

### Core Operations

The sequence interface defines these essential operations:

- **Container operations**:
  - `build(X)`: Create sequence from iterable X - O(?)
  - `len()`: Return number of elements - O(?)
- **Static operations** (don't change size):
  - `get_at(i)`: Return element at index i - O(?)
  - `set_at(i, x)`: Set element at index i to x - O(?)
- **Dynamic operations** (change size):
  - `insert_at(i, x)`: Insert element x at index i - O(?)
  - `delete_at(i)`: Remove and return element at index i - O(?)
  - `insert_first(x)`: Insert x at beginning - O(?)
  - `insert_last(x)`: Insert x at end - O(?)
- **Query operations**:
  - `find(x)`: Return index of first occurrence of x - O(?)

The complexities (marked with ?) depend on the underlying implementation. This is where data structure choice becomes critical!

## Array-Based Sequences

### Static Array Implementation

Static arrays use contiguous memory blocks, connecting directly to our word-RAM model from Lesson 01.

#### Memory Layout

```
Array A[0..n-1] in memory:
[A[0]][A[1]][A[2]]...[A[n-1]]
 Base   +w     +2w       +(n-1)w
```

Where w = word size (typically 8 bytes on 64-bit systems)

#### Implementation Details

**Java Equivalent**: Plain arrays `int[] arr = new int[capacity];`

_Python version_:

```python
class StaticArray:
    def __init__(self, capacity):
        self.data = [None] * capacity  # Allocate fixed space
        self.capacity = capacity
        self.size = 0

    def get_at(self, i):
        if 0 <= i < self.size:
            return self.data[i]  # O(1) - direct memory access
        raise IndexError("Index out of bounds")

    def set_at(self, i, x):
        if 0 <= i < self.size:
            self.data[i] = x     # O(1) - direct memory access
        else:
            raise IndexError("Index out of bounds")

    def insert_at(self, i, x):
        if self.size >= self.capacity:
            raise OverflowError("Array full")

        # Shift elements right: O(n-i) operations
        for j in range(self.size, i, -1):
            self.data[j] = self.data[j-1]

        self.data[i] = x
        self.size += 1

    def delete_at(self, i):
        if i >= self.size:
            raise IndexError("Index out of bounds")

        x = self.data[i]

        # Shift elements left: O(n-i-1) operations
        for j in range(i, self.size - 1):
            self.data[j] = self.data[j+1]

        self.size -= 1
        return x
```

#### Complexity Analysis

| Operation      | Time Complexity | Space Complexity | Fundamental Operations   |
| -------------- | --------------- | ---------------- | ------------------------ |
| get_at(i)      | O(1)            | O(1)             | 1 memory access          |
| set_at(i,x)    | O(1)            | O(1)             | 1 memory write           |
| insert_at(i,x) | O(n-i)          | O(1)             | Up to n-i memory moves   |
| delete_at(i)   | O(n-i-1)        | O(1)             | Up to n-i-1 memory moves |
| find(x)        | O(n)            | O(1)             | Up to n comparisons      |

**Why O(1) for get/set?** Direct address calculation: `base_address + i * word_size`

### Dynamic Array Implementation

Dynamic arrays solve the fixed-size limitation through automatic resizing. This introduces a crucial concept: **amortized analysis**.

**Java Equivalent**: `ArrayList<E>` - automatically resizes when full (default: grows by 50%)

#### The Resizing Strategy

```python
class DynamicArray:
    def __init__(self):
        self.data = [None] * 1    # Start small
        self.capacity = 1
        self.size = 0

    def _resize(self, new_capacity):
        """Resize internal array - expensive but infrequent"""
        old_data = self.data
        self.data = [None] * new_capacity  # O(new_capacity) allocation

        # Copy existing elements: O(size) operations
        for i in range(self.size):
            self.data[i] = old_data[i]

        self.capacity = new_capacity

    def insert_last(self, x):
        """The key operation for amortized analysis"""
        if self.size == self.capacity:
            self._resize(2 * self.capacity)  # Double when full

        self.data[self.size] = x
        self.size += 1

    def insert_at(self, i, x):
        if self.size == self.capacity:
            self._resize(2 * self.capacity)

        # Shift elements right: O(n-i) operations
        for j in range(self.size, i, -1):
            self.data[j] = self.data[j-1]

        self.data[i] = x
        self.size += 1
```

#### Amortized Analysis of insert_last() (Key Concept!)

**The Big Idea**: Even though resizing costs O(n), we get O(1) amortized time!

**Simple Explanation**:

- We double capacity when full: 1 → 2 → 4 → 8 → 16 → ...
- Total resize cost for n insertions: 1 + 2 + 4 + ... < 2n
- Cost per operation: 2n/n = O(1) amortized!

**Java ArrayList Note**: Uses 50% growth instead of doubling, still O(1) amortized.

## Linked List Implementation

### Singly Linked List

Linked lists trade direct access for flexible insertion/deletion. Each element stores both data and a reference to the next element.

**Java Equivalent**: While Java's `LinkedList<E>` is doubly-linked, the concept is similar.

#### Node Structure and Basic Implementation

_Python version_:

```python
class Node:
    def __init__(self, item, next_node=None):
        self.item = item
        self.next = next_node

class SinglyLinkedList:
    def __init__(self):
        self.head = None
        self.size = 0

    def get_at(self, i):
        """O(i) - must traverse from head"""
        if i >= self.size:
            raise IndexError("Index out of bounds")

        current = self.head
        for _ in range(i):  # i traversal steps
            current = current.next
        return current.item

    def set_at(self, i, x):
        """O(i) - traverse then modify"""
        if i >= self.size:
            raise IndexError("Index out of bounds")

        current = self.head
        for _ in range(i):
            current = current.next
        current.item = x

    def insert_first(self, x):
        """O(1) - just update head pointer"""
        new_node = Node(x, self.head)
        self.head = new_node
        self.size += 1

    def delete_first(self):
        """O(1) - just update head pointer"""
        if self.head is None:
            raise IndexError("Cannot delete from empty list")

        item = self.head.item
        self.head = self.head.next
        self.size -= 1
        return item

    def insert_at(self, i, x):
        """O(i) - traverse to position i-1, then insert"""
        if i == 0:
            self.insert_first(x)
            return

        # Find node at position i-1
        current = self.head
        for _ in range(i-1):
            current = current.next

        # Insert new node
        new_node = Node(x, current.next)
        current.next = new_node
        self.size += 1
```

#### Memory Layout Comparison

**Array (contiguous)**:

```
[data₀][data₁][data₂][data₃] ... all in sequence
```

**Linked List (scattered)**:

```
Node₀: [data₀|ptr] → Node₁: [data₁|ptr] → Node₂: [data₂|ptr] → ...
```

Nodes can be anywhere in memory!

### Doubly Linked List

Adds backward traversal capability and O(1) operations at both ends.

**Java Equivalent**: `LinkedList<E>` - Java's standard linked list is doubly-linked!

```python
class DoublyLinkedNode:
    def __init__(self, item, next_node=None, prev_node=None):
        self.item = item
        self.next = next_node
        self.prev = prev_node

class DoublyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None  # Key addition for O(1) end operations
        self.size = 0

    def insert_last(self, x):
        """O(1) - no traversal needed with tail pointer"""
        new_node = DoublyLinkedNode(x)

        if self.tail is None:  # Empty list
            self.head = self.tail = new_node
        else:
            new_node.prev = self.tail
            self.tail.next = new_node
            self.tail = new_node

        self.size += 1

    def delete_last(self):
        """O(1) - direct access via tail pointer"""
        if self.tail is None:
            raise IndexError("Cannot delete from empty list")

        item = self.tail.item

        if self.head == self.tail:  # Only one element
            self.head = self.tail = None
        else:
            self.tail = self.tail.prev
            self.tail.next = None

        self.size -= 1
        return item
```

**Space Overhead**: Each node requires extra pointer (prev), but enables bidirectional traversal and O(1) operations at both ends.

## Implementation Comparison

### Performance Table

| Operation         | Static Array | Dynamic Array     | Singly Linked | Doubly Linked | Best Choice                 |
| ----------------- | ------------ | ----------------- | ------------- | ------------- | --------------------------- |
| get_at(i)         | O(1)         | O(1)              | O(i)          | O(i)          | Array                       |
| set_at(i,x)       | O(1)         | O(1)              | O(i)          | O(i)          | Array                       |
| insert_first(x)   | O(n)         | O(n)\*            | O(1)          | O(1)          | Linked List                 |
| delete_first()    | O(n)         | O(n)\*            | O(1)          | O(1)          | Linked List                 |
| insert_last(x)    | O(n)         | O(1)\*            | O(n)          | O(1)          | Dynamic Array/Doubly Linked |
| delete_last()     | O(n)         | O(1)\*            | O(n)          | O(1)          | Dynamic Array/Doubly Linked |
| find(x)           | O(n)         | O(n)              | O(n)          | O(n)          | Equal                       |
| Space per element | 1 word       | 1 word + overhead | 2 words       | 3 words       | Static Array                |

\*Amortized time complexity

### Memory Characteristics

| Aspect                | Arrays                 | Linked Lists            |
| --------------------- | ---------------------- | ----------------------- |
| **Cache Performance** | Excellent (contiguous) | Poor (scattered)        |
| **Memory Overhead**   | Minimal                | High (pointers)         |
| **Memory Allocation** | Single block           | Multiple small blocks   |
| **Fragmentation**     | Low                    | Can cause fragmentation |

## Choosing the Right Implementation

### When to Use Static Arrays:

- Fixed, known size requirements
- Memory is constrained
- Maximum performance for get/set operations
- Embedded systems or performance-critical code

### When to Use Dynamic Arrays:

- Unknown final size, but expect growth
- Frequent random access (get_at/set_at)
- Appending elements frequently
- Good cache performance needed
- **Examples**: Implementing stacks, resizable buffers, most general-purpose lists

### When to Use Singly Linked Lists:

- Frequent insertion/deletion at beginning
- Size varies dramatically
- Don't need random access or end operations
- **Examples**: Implementing stacks where you only need push/pop at one end

### When to Use Doubly Linked Lists:

- Need efficient insertion/deletion at both ends
- Implementing queues (deque)
- Need to traverse in both directions
- **Examples**: Browser history, undo/redo operations, LRU caches

### Real-World Examples

| Language/Library     | Data Structure         | Implementation Type | Growth Strategy        |
| -------------------- | ---------------------- | ------------------- | ---------------------- |
| Python `list`        | Dynamic Array          | Contiguous memory   | Overallocate by ~12.5% |
| Java `ArrayList<E>`  | Dynamic Array          | Contiguous memory   | Grow by 50%            |
| Java `LinkedList<E>` | Doubly Linked List     | Scattered nodes     | No resizing needed     |
| Java `ArrayDeque<E>` | Circular Dynamic Array | Contiguous memory   | Double when full       |
| C++ `vector`         | Dynamic Array          | Contiguous memory   | Usually doubles        |
| C++ `list`           | Doubly Linked List     | Scattered nodes     | No resizing needed     |

## Practice Problems

**Q1:** **Array Insertion Analysis**: How many fundamental operations does inserting an element at the beginning of a static array of size n require (give both an expression and the big-O asymtotic form of that expression)?

**A:**

**Q2:** **Dynamic Array Doubling**: Why do we double the capacity instead of increasing by a fixed amount (e.g., +100)?

**A:**

**Q3:** **Reverse Sequence**: Implement efficient reversal for linked lists.

**A:**

**Q4:** **Middle Element**: Find the middle element of a linked list in one pass.

**A:**

**Q5:** **Java ArrayList vs LinkedList**: When would you choose each in a real application?

**A:**

**Q6:** **Understanding Check**: What's the complexity of finding the middle element in an array vs a linked list?

**A:**

## Key Takeaways

### Fundamental Trade-offs

1. **Arrays vs Linked Lists**: Memory layout affects both performance and complexity
2. **Static vs Dynamic**: Fixed size vs flexibility comes with amortized analysis
3. **Cache Performance**: Contiguous memory beats scattered allocation in practice
4. **Space vs Time**: Sometimes extra space (like tail pointers) enables better time complexity

### Connection to Previous Lessons

- **Lesson 1**: Used fundamental operations counting - each pointer dereference and array access is O(1)
- **Lesson 2**: Peak finding relied on array indexing - O(1) access enabled O(log n) algorithm
- **Going forward**: These sequence operations are building blocks for more complex algorithms

### Amortized Analysis Introduction

- **Key insight**: Some operations can be expensive occasionally but cheap on average
- **Method**: Analyze total cost over sequence of operations, not per operation
- **Applications**: Will see this again in hash tables, union-find, and other advanced structures

### Practical Implications

1. **Default choice**: Dynamic arrays (Python lists, Java ArrayList) work well for most cases
2. **Specialized needs**: Consider linked lists when insertion/deletion patterns favor them
3. **Performance tuning**: Cache effects often dominate theoretical complexity for large data

## Next Lesson

We'll formalize our complexity analysis with asymptotic notation (Big-O, Theta, Omega) and learn to compare algorithms rigorously.

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
