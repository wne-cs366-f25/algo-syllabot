# Syllabus - CS366: Design & Analysis of Algorithms

### **Fall 2025 - Professor Gray**

## Course Information

- **Instructor**: Declan Gray-Mullen - Lecturer - declan.gray-mullen@wne.edu
- **Meeting Times**: Tuesday/Thursday 9:30-10:50 AM (CS366-01) or 11:00 AM-12:20 PM (CS366-03)
- **Office Hours**:
  - Wednesday 12:30-1:30 PM (Herman 207)
  - Tuesday 12:30-1:30 PM (Herman 207)
- **GitHub**: Create a GitHub account to complete Programming Assignments
- **Discord**: Join the [Course Discord Server](https://discord.gg/tzywKCNM2j) - set your nickname to something similar to your IRL name or your GitHub username
- **_Optional_** - **Textbook**: Introduction to Algorithms (CLRS), 3rd Edition
- **_Optional_** - **Syllabot**: Open this repository as a folder in VSCode, then as a devContainer. You may need to install the 'Dev Containers' VS Code extension. Run `claude` in your terminal or click the claude icon. You'll be redirected to [claude.ai](https://claude.ai) to create a free account. The `Claude.md` file provides course context to Claude automatically

## Syllabot - AI Syllabus Assistant for Students

Claude is configured in this repositories devContainer to full context of the course schedule, materials, and assignments as they are posted. Follow the instructions in Course Information and ask:

- "What's the next assignment due?"
- "Explain the Master Theorem"
- "Help me implement Dijkstra's algorithm"
- "What topics are on Exam 1?"

Programming Assignments are intended to be completed based on the provided course material and in-class lectures. Remember Claude make mistakes and can only accomplish what you can describe. Use algorithms for learning at your own risk.

## Critical Dates

- Tuesday, Aug 26: First class
- Friday, Sept 5: Last add/drop
- Thursday, Oct 2: **Exam 1**
- Tuesday, Oct 14: No Class (Fall Break)
- Monday, Oct 20: In-progress grades
- Monday, Oct 27: Last withdraw
- Thursday, Nov 6: **Exam 2**
- Thursday, Nov 27: No Class (Thanksgiving)
- Thursday, Dec 4: Last class
- December 8-12: **Exam 3 / Final Exam** (TBD)
- Monday, Dec 15: Final grades posted

## Repository Structure

```
cs366/
├── .devcontainer/      # Development environment configuration
├── CLAUDE.md           # Course context for AI assistant
├── README.md           # This file
├── Exam1/              # Algorithm Analysis and Foundations
│   ├── 00_AlgorithmAnalysisIntro.md
│   ├── 01_IntroductionAndPeakFinding.md
│   ├── 02_DataStructuresAndSequences.md
│   ├── 03_AsymptoticNotation.md
│   ├── 04_BinarySearchTrees.md
│   ├── 05_RecurrenceRelations.md
│   ├── 06_SortingAlgorithms.md
│   ├── 07_LinearSorting.md
│   └── 08_HashingAndHashTables.md
├── Exam2/              # Advanced Data Structures and Graph Algorithms
│   ├── 09_AVLTrees.md
│   ├── 10_BinaryHeaps.md
│   ├── 11_GraphAlgorithmsBasics.md
│   ├── 12_GraphsAndBFS.md
│   ├── 13_DepthFirstSearch.md
│   ├── 14_BellmanFord.md
│   ├── 15_GreedyAlgorithms.md
│   ├── 16_DijkstraAndJohnson.md
│   └── 17_ShortestPaths.md
└── Exam3/              # Dynamic Programming and Computational Complexity
    ├── 18_DynamicProgrammingIntro.md
    ├── 19_DynamicProgrammingSequences.md
    ├── 20_AdvancedDynamicProgramming.md
    ├── 21_KnapsackAndPseudopolynomial.md
    ├── 22_MinimumSpanningTrees.md
    ├── 23_ComputationalComplexity.md
    ├── 24_NPCompleteness.md
    └── 25_CourseReview.md
```

## Course Structure

The course is organized into three main units, each culminating in an exam:

### Exam 1: Algorithm Analysis and Foundations (Weeks 0-5)

- **Algorithm Analysis Introduction** - Problem-solving approaches and complexity basics
- **Introduction and Peak Finding** - Algorithmic thinking and divide-and-conquer
- **Data Structures and Sequences** - Arrays, linked lists, and dynamic arrays
- **Asymptotic Notation** - Big O, Theta, and Omega analysis
- **Binary Search Trees** - BST operations and tree traversals
- **Recurrence Relations** - Solving recurrences and the Master Theorem
- **Sorting Algorithms** - Insertion sort, merge sort, and analysis
- **Linear Sorting** - Counting sort, radix sort, and lower bounds
- **Hashing and Hash Tables** - Dictionary operations and collision resolution
- **Exam 1**: Thursday, October 2

### Exam 2: Advanced Data Structures and Graph Algorithms (Weeks 6-11)

- **Balanced Binary Search Trees (AVL)** - Rotations and height guarantees
- **Binary Heaps and Priority Queues** - Heap operations and heap sort
- **Graph Algorithms Basics** - Graph fundamentals and representations
- **Graph Representations and BFS** - Graph basics and breadth-first search
- **Depth-First Search and Applications** - DFS and topological sort
- **Bellman-Ford Algorithm** - Shortest paths with negative weights
- **Greedy Algorithms** - Greedy paradigm and optimization techniques
- **Dijkstra's and Johnson's Algorithms** - Efficient shortest path algorithms
- **Shortest Paths** - Advanced shortest path algorithms and applications
- **Exam 2**: Thursday, November 6

### Exam 3: Dynamic Programming and Computational Complexity (Weeks 12-15)

- **Introduction to Dynamic Programming** - Memoization and tabulation
- **DP on Sequences** - LCS, LIS, and edit distance
- **Advanced Dynamic Programming** - Matrix chain, Floyd-Warshall, and tree DP
- **Knapsack and Pseudopolynomial Algorithms** - Optimization with constraints
- **Minimum Spanning Trees** - Kruskal's and Prim's algorithms
- **Computational Complexity Theory** - P, NP, and computational hardness
- **NP-Completeness** - NP-complete problems and reductions
- **Course Review and Advanced Topics** - Synthesis and future directions
- **Exam 3 / Final Exam**: During Finals Week (December 8-12)

### Programming Assignments

0. **PA0**: [Starter Assignment Git & GitHub](https://classroom.github.com/a/eKRl38tz) - Due Sept 4 (Week 1)
1. **PA1**: Algorithm Analysis Practice - Due September 18 (Week 3)
2. **PA2**: Divide & Conquer Implementation - Due October 2 (Week 5)
3. **PA3**: Graph Algorithm Implementation - Due October 23 (Week 8)
4. **PA4**: Dynamic Programming Problems - Due November 6 (Week 10)
5. **PA5**: Greedy Algorithm Implementation - Due November 20 (Week 12)
6. **PA6**: NP-Complete Problem Reduction - Due December 4 (Week 14)

## Learning Objectives

By the end of this course, students will be able to:

- Analyze the time and space complexity of algorithms
- Design efficient algorithms using divide-and-conquer, greedy, and dynamic programming paradigms
- Implement and use fundamental data structures
- Solve graph problems using appropriate algorithms
- Understand computational complexity and identify intractable problems
- Apply algorithmic thinking to real-world problems

## Assessment

- Exam 1: 15%
- Exam 2: 15%
- Exam 3: 15%
- Programming Assignments: 55%
  - 7 PAs with the lowest grade dropped.

Exam 1 and Exam 2 will be given in-class, Exam 3 will be administered during the final exam period (TBD). All Exams will be completed with the Lockdown browser. Email the instructor to coordinate an accommodation or makeup.

Programming Assignments are due in biweekly in GitHub on Thursday at 11:59 PM with solutions posted the following Thursday. Late policy: 10% deduction per day, maximum 5 days late. Lowest grade dropped.

Grades will be posted to Kodiak with feedback available on GitHub within 2 weeks of the original assignment deadline. Exams grades will be posted ASAP.

## Appeals

To appeal a grade that you believe is erroneous, contact your
instructor by email and include the following information:

- Your full name.
- The course and section.
- The assignment, exam, or quiz in question.
- The question(s) or part that you are concerned about.
- A brief description of the problem and why you think the score is incorrect.

Appeals for a particular score must be made within 1 week of that score
being posted.

## Academic Integrity

All programming assignments must be your own work. You may:

- Discuss concepts with classmates
- Use Claude for understanding concepts
- Reference the textbook and course materials

You may NOT:

- Copy code from other students
- Use Claude to write complete solutions
- Submit work from previous semesters

## Student Accessibility Services

I am committed to creating a course that is inclusive in its design. If you encounter barriers, please let me know immediately so we can determine if there is a design adjustment that can be made. I am happy to consider creative solutions as long as they do not compromise the intent of the assessment or learning activity. If you have a disability, or think you may have a disability, you may also want to meet with Student Accessibility Services. The contact information is listed below:

Student Accessibility Services
Herman Hall, SAS Suite 105
Office Phone: 413-782-1258
Email: accessibility@wne.edu

Once I have a copy of your approved accommodations from SAS we can plan a time to connect to discuss your accommodation needs. In addition, if you are approved for exam accommodations, please consult with me at least two weeks before any scheduled exam date to confirm the testing arrangements.

## Informal Prerequisites

- **Programming experience** (preferably in Java or Python)

  - You've implemented an assignment using recursion before, completed a few methods/classes for homework but maybe never worked on a project without starter code. You can identify 'clean' code and have a concept of an 'efficient' implementation.

- **Discrete mathematics**

  - You've performed long-multiplication before, can recognize the summation symbol and know a few binary operators. You've solved a problem that used set notation, functions, or boolean logic. You've written your own or understood the explanation of a formal proof.

- **Basic data structures knowledge**

  - You know the difference between a stack and list, know a balanced binary search tree runs in O(log n) and can order constant, linear, and exponential pseudocode algorithms.

## Ask for help!

1. Post in the course Discord channels or message an instructor
2. Ask Claude
3. Email me at declan.gray-mullen@wne.edu
4. Attend office hours (Wednesday 12:30-1:30 PM or Tuesday 12:30-1:30 PM in Herman 207)
5. Form study groups with classmates
6. Reach out to Counseling Services at 413-782-1211 or by email at counseling.services@wne.edu

Happy coding and algorithm analysis!

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
