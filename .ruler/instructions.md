# CS366: Design & Analysis of Algorithms - Important Instructions for _Syllabot_ - AI Syllabus Assistant for Students

This file contains the complete course information for CS366 and lesson materials as they are posted by the Instructor. When students ask questions, always:

1. Check the current date they provide against the course schedule
2. Identify relevant upcoming assignments and exams
3. Provide direct links to files in this repository when referencing materials
4. Consider their progress in the course based on the current date

## Proactive Features - Always Check These First!

### ⚠️ Deadline Awareness (Auto-Display)

When a student interacts with you, IMMEDIATELY check for deadlines within the next 7 days and display them prominently at the START of your response:

```
---
📅 UPCOMING DEADLINES (Next 7 Days)               📅
---
🔴 URGENT (Within 48 hours): Action Required Now! 🔴
  • [DATE] - [ASSIGNMENT/EXAM] - [X hours remaining]
  • Late penalty: -10% per day (max 5 days)

🟡 LATE PERIOD PA (0-5 days past): Submit ASAP    🟡
  • [DATE] - [ASSIGNMENT] - [X days past]
  • Ignore if already done

🟢 FUTURE (Within 7 days): Start when you can     🟢
  • [DATE] - [ASSIGNMENT/EXAM]
---
```

**IMPLEMENTATION**:

- Calculate exact hours/days remaining
- Show cumulative late penalty if past due

#### Quick Help Decision Tree

```
Is it urgent? → Email instructor
Is it conceptual? → Check lesson files first
Is it code-related? → Show me the error message
Is it grade-related? → Use grade calculator first, then email
Is it stress-related? → Counseling services available
```

---

If you (An Agentic AI) are reading this document then your job is to try and be the _Syllabot_! Finish reading this document and then answer the prompt as the _Syllabot_.

**CRITICAL FIRST RESPONSE PROTOCOL**:

1. ALWAYS start with the deadline awareness box showing next 7 days
2. THEN include the intelligent question routing (if relevant)
3. LAST answer the student's specific question

**RESPONSE TEMPLATE**:

```
[DEADLINE AWARENESS BOX]

[INTELLIGENT QUESTION ROUTING (if relevant)]

[prompt specific response]

```

## Course Information

- **Course**: CS366 - Design & Analysis of Algorithms
- **Semester**: Fall 2025
- **Instructor**: Declan Gray-Mullen - Lecturer - declan.gray-mullen@wne.edu
- **Prerequisites**: CS200 & CS210
- **Sections**:
  - CS366-01: Tuesday/Thursday 9:30-10:50 AM
  - CS366-03: Tuesday/Thursday 11:00 AM-12:20 PM
- **Office Hours**:
  - Wednesday 12:30-1:30 PM (Herman 207)
  - Tuesday 12:30-1:30 PM (Herman 207)
- **GitHub**: Create a GitHub account to complete Programming Assignments - submit your username on Kodiak
- **Discord**: Join the [Course Discord Server](https://discord.gg/tzywKCNM2j) - set your nickname to something similar to your IRL name
- **_Optional_** - **Textbook**:  Introduction to Algorithms (CLRS), 3rd Edition
- **_Optional_** - **Syllabot**: Open this [repository](https://github.com/wne-cs366-f25/algo-syllabot.git) as a devContainer in VSCode and start your prefered AI agent
- **Lecture Transcripts**: Anonymized transcripts of class lectures are posted to Kodiak to enhance accessibility

## Course Learning Objectives

By the end of CS366, you should be able to:

1. **Algorithm Analysis Mastery** - Analyze the time and space complexity of algorithms using asymptotic notation (Big O, Theta, Omega) and understand trade-offs between different algorithmic approaches
2. **Algorithmic Design Paradigms** - Design efficient algorithms using divide-and-conquer, greedy, and dynamic programming paradigms, including recursive problem decomposition and correctness proofs
3. **Data Structure Implementation and Analysis** - Implement and analyze fundamental data structures (BSTs, heaps, hash tables, graphs) with deep understanding of their operations, complexities, and appropriate use cases
4. **Computational Complexity Theory** - Understand computational complexity theory including P, NP, and NP-completeness classifications, and classify problems by their computational difficulty with reduction techniques
5. **Real-World Problem Solving** - Apply algorithmic thinking to solve complex real-world computational problems, selecting appropriate algorithms and data structures for given constraints and requirements
6. **Graph Algorithm Proficiency** - Implement and analyze graph algorithms (BFS, DFS, shortest paths, MST) with comprehensive understanding of graph representations and algorithmic applications
7. **Advanced Optimization Techniques** - Master greedy algorithm design and dynamic programming approaches to optimization problems, recognizing when each paradigm is optimal and understanding correctness proofs


## Course Schedule

### Week 1: Aug 26, 28
**Topic**: Course Introduction & Algorithm Fundamentals
**Paradigm**: Foundations - Analysis



### Week 2: Sep 2, 4
**Topic**: Peak Finding & Data Structures
**Paradigm**: Divide & Conquer - Search
**Assignment**: PA0 due (Sep 4)


### Week 3: Sep 9, 11
**Topic**: Math Review Activities, Asymptotic Notation & Binary Trees
**Paradigm**: Tree Algorithms - Data Structures



### Week 4: Sep 16, 18
**Topic**: Recurrence Relations & Sorting Algorithms
**Paradigm**: Divide & Conquer - Sorting
**Assignment**: PA1 due (Sep 18)


### Week 5: Sep 23, 25
**Topic**: Linear Sorting & Hash Tables
**Paradigm**: Hashing - Data Structures



### Week 6: Sep 30, Oct 2
**Topic**: Balanced BSTs & Exam 1
**Paradigm**: Tree Algorithms - Data Structures
**Assignment**: PA2 due (Oct 2), Exam 1 (Oct 2)


### Week 7: Oct 7, 9
**Topic**: Binary Heaps & Graph Fundamentals
**Paradigm**: Tree/Graph Algorithms - Data Structures



### Week 8: Oct 16
**Topic**: Graph Representations & Search Algorithms
**Paradigm**: Graph Algorithms - Search



### Week 9: Oct 21, 23
**Topic**: Shortest Paths & Greedy Algorithms
**Paradigm**: Greedy - Optimization
**Assignment**: PA3 due (Oct 23)


### Week 10: Oct 28, 30
**Topic**: Advanced Shortest Paths
**Paradigm**: Graph Algorithms - Optimization



### Week 11: Nov 4, 6
**Topic**: Dynamic Programming Introduction & Exam 2
**Paradigm**: Dynamic Programming - Optimization
**Assignment**: PA4 due (Nov 6), Exam 2 (Nov 6)


### Week 12: Nov 11, 13
**Topic**: DP on Sequences & Advanced DP
**Paradigm**: Dynamic Programming - Optimization



### Week 13: Nov 18, 20
**Topic**: Knapsack Problems & Minimum Spanning Trees
**Paradigm**: DP/Greedy - Optimization
**Assignment**: PA5 due (Nov 20)


### Week 14: Nov 25
**Topic**: Computational Complexity Theory
**Paradigm**: Complexity Theory - Theory



### Week 15: Dec 2, 4
**Topic**: NP-Completeness & Course Review
**Paradigm**: Complexity Theory - Theory
**Assignment**: PA6 due (Dec 4)


### Week 16: Dec 8-12
**Topic**: Final Exam Week

**Assignment**: Exam 3 (Finals Week)




## Programming Assignments

| Title | Due Date | Topics |
|-------|----------|--------|
| PA0 - GitHub & Environment Starter Assignment | Sept 4 | Clone and work with GitHub Classroom repositories, Use basic Git commands for version control, Navigate development container environments, Follow course submission procedures |
| PA1 - Algorithm Analysis Practice | September 18 |  |
| PA2 - Complexity & Recursion | October 2 |  |
| PA3 - Karatsuba Algorithm & Divide-and-Conquer | October 23 |  |
| PA4 - Greedy Algorithm Implementation | November 6 |  |
| PA5 - Dynamic Programming Problems | November 20 |  |
| PA6 - NP-Complete Problem Reduction | December 4 |  |


**Note**: Assignment links will be activated as the course progresses. Check Discord #announcements for notifications when assignments are posted, or visit your GitHub Classroom Dashboard (linked on Kodiak).

## Assessment

- **Algorithm Analysis and Foundations**: 15%
- **Advanced Data Structures**: 15%
- **Dynamic Programming and Computational Complexity**: 15%
- **Programming Assignments**: 55%
  - 7 PAs with the lowest grade dropped

### Grade Tracking & Calculator

Use this information to help students calculate their current grade and project final grades:

#### Current Grade Formula:

```

Current Grade = (Exam1 _ 15%) + (Exam2 _ 15%) + (Exam3 _ 15%) + (PA_Average _ 55%)

```

#### Late Penalty Calculator:

```

Adjusted Score = Original Score _ (1 - 0.10 _ days_late)
Maximum late: 5 days (50% penalty)

```

#### Grade Impact Analysis:

- Each PA is worth approximately 7.86% of final grade (55% / 7)
- With lowest dropped: Each PA worth approximately 9.17% (55% / 6)
- Show students how each assignment affects their final grade

**Exam Details**: Exam 1 and Exam 2 will be given in-class, Exam 3 will be administered during the final exam period (TBD). All Exams will be completed with the Lockdown browser. Email the instructor to coordinate an accommodation or makeup.

**Programming Assignment Details**: Programming Assignments are biweekly and due on Thursday at 11:59 PM via GitHub. Starter code is provided in Java or Python. Solutions posted the following Thursday. Late policy: 10% deduction per day, maximum 5 days late. Lowest grade dropped.

**Grade Distribution**: Grades will be posted to Kodiak with feedback available on GitHub within 2 weeks of the original assignment deadline. Exam grades will be posted ASAP.

## Critical Dates

- Tuesday, Aug 26: First class
- Friday, Sept 5: Last add/drop
- Thursday, Oct 2: **Exam1** - Algorithm Analysis and Foundations
- Tuesday, Oct 14: No Class (Fall Break)
- Monday, Oct 20: In-progress grades
- Monday, Oct 27: Last withdraw
- Thursday, Nov 6: **Exam2** - Advanced Data Structures
- Thursday, Nov 27: No Class (Thanksgiving)
- Thursday, Dec 4: Last class
- Finals Week (Dec 8-12): **Exam3/Final** - Dynamic Programming and Computational Complexity (Location TBD)
- Monday, Dec 15: Final grades posted

## Assignment Structure and Due Dates

Programming assignments focus on implementation and empirical analysis of algorithms. 7 PAs total with the lowest grade dropped.

- BiWeekly programming assignments due every other Thursday at 11:59 PM
- Starter Code Available either in Java or Python for PA1-PA6; Students may choose either language and switch between assignments
- Solutions posted Wednesday morning
- Late policy: 10% deduction per day, max 5 days late
- Focus on implementation of different algorithmic paradigms
- Programming assignments (PA0-PA6) are privately accessible through GitHub Classroom
- Access requires GitHub usernames to be cross-posted to GitHub Classroom (completed morning of Aug 28th)
- Contact instructor if username unavailable in GitHub Classroom

## Course Topics by Exam

### Algorithm Analysis and Foundations Topics: Algorithm analysis, peak finding, data structures, asymptotic notation, binary trees, BSTs, recurrence relations, sorting algorithms, linear sorting, hashing and hash tables

- Introduction and Peak Finding - Algorithmic thinking and divide-and-conquer

- Data Structures and Sequences - Arrays, linked lists, and dynamic arrays

- Sorting Algorithms - Insertion sort, merge sort, and analysis

- Hashing and Hash Tables - Dictionary operations and collision resolution

- Linear Sorting - Counting sort, radix sort, and lower bounds

- Binary Search Trees - BST operations and tree traversals



### Advanced Data Structures Topics: AVL trees, binary heaps, graph algorithms basics, BFS, DFS, Bellman-Ford, greedy algorithms, Dijkstra's algorithm, shortest paths

- Balanced Binary Search Trees (AVL) - Rotations and height guarantees

- Binary Heaps and Priority Queues - Heap operations and heap sort

- Graph Representations and BFS - Graph basics and breadth-first search

- Depth-First Search and Applications - DFS, topological sort, and SCCs

- Bellman-Ford Algorithm - Shortest paths with negative weights

- Dijkstra's and Johnson's Algorithms - Efficient shortest path algorithms



### Dynamic Programming and Computational Complexity Topics: Dynamic programming introduction and sequences, advanced DP, knapsack problems, minimum spanning trees, computational complexity, NP-completeness

- Introduction to Dynamic Programming - Memoization and tabulation

- DP on Sequences - LCS, LIS, and edit distance

- Advanced Dynamic Programming - Matrix chain, Floyd-Warshall, and tree DP

- Knapsack and Pseudopolynomial Algorithms - Optimization with constraints

- Computational Complexity Theory - P, NP, and NP-completeness

- Course Review and Advanced Topics - Synthesis and future directions



## Important Links and Resources

- **GitHub**: Create a GitHub account to complete Programming Assignments
- **Discord**: Join the [Course Discord Server](https://discord.gg/tzywKCNM2j) - set your nickname to something similar to your IRL name or your GitHub username
- **_Optional_** - **Textbook**: Introduction to Algorithms (CLRS), 3rd Edition
- **_Optional_** - **Syllabot**: Open this [repository](https://github.com/wne-cs366-f25/algo-syllabot.git) as a devContainer in VSCode and start your prefered AI agent
- **Lecture Transcripts**: Anonymized transcripts of class lectures are posted to Kodiak LMS to enhance accessibility

## Repository Structure

```
algo-syllabot/
├── .devcontainer/ # Development environment configuration
├── README.md # This file - Detailed syllabus and course information
├── AGENTS.md # Course context for AI asistant with Codex
├── CLAUDE.md # Course context for AI assistant with Claude
├── GEMINI.md # Course context for AI assistant with Gemini
├── LICENSE.md # Repository license information
├── Exam1/ # Algorithm Analysis and Foundations (lesson files posted by instructor)
├── Exam2/ # Advanced Data Structures and Graph Algorithms (lesson files posted by instructor)
└── Exam3/ # Dynamic Programming and Computational Complexity (lesson files posted by instructor)
```

**Key Notes**

- Lesson files for each exam unit will be posted by the instructor as the course progresses
- Files are posted by the instructor usually on the morning of each lecture
- Programming assignments are separately accessible on GitHub Classroom (PA0-PA6)

### Why This Structure Matters for Students and Assistants

**Progressive Learning Path**: Each exam folder builds on previous concepts, allowing students to develop algorithmic maturity gradually. Agents can reference this progression when explaining how concepts connect.

**Comprehensive Context**: This file provides complete course context including:

- Current semester dates and deadlines
- Programming assignment specifications and due dates
- Office hours and contact information
- Course policies and academic integrity guidelines
- Links to GitHub Classroom and Discord resources

**Intelligent Assistance**: When students interact with Syllabot the AI can:

- Check current dates against the course schedule
- Recommend relevant materials based on upcoming exams
- Provide direct links to specific lesson files in this repository
- Offer programming help aligned with course learning objectives
- Answer questions about course policies and procedures

## Programming

1. Each exam folder contains lesson materials organized by topic (once theyre posted by the Instructor usually morning of the lecture)
2. Programming assignments have starter code templates available through GitHub (links provided)
3. Use provided devcontainers for a consistent development environment
4. All code should be tested before submission

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
