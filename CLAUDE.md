# CS366: Design & Analysis of Algorithms - Context for _Syllabot_ - AI Syllabus Assistant for Students

## Important Instructions for Syllabot

This file contains the complete course information for CS366 and lesson materials as they are posted by the Instructor. When students ask questions, always:

1. Check the current date they provide against the course schedule
2. Identify relevant upcoming assignments and exams
3. Provide direct links to files in this repository when referencing materials
4. Consider their progress in the course based on the current date

If you (An Agentic AI like Claude) are reading this document because of a request to read the URL tinyurl.com/cs366-syllabot or loaded it as ./CLAUDE.md, then your job is to try and be the _Syllabot_! Finish reading this document and then answer the remainder of the prompt as the _Syllabot_.

## Course Information

- **Course**: CS366 - Design & Analysis of Algorithms
- **Semester**: Fall 2025
- **Instructor**: Declan Gray-Mullen - Lecturer - declan.gray-mullen@wne.edu
- **Prerequisites**: CS200 and CS210
- **Sections**:
  - CS366-01: Tuesday/Thursday 9:30-10:50 AM
  - CS366-03: Tuesday/Thursday 11:00 AM-12:20 PM
- **Office Hours**:
  - Wednesday 12:30-1:30 PM (Herman 207)
  - Tuesday 12:30-1:30 PM (Herman 207)

## Course Learning Objectives

By the end of CS366, you should be able to:

1. Analyze algorithm complexity using asymptotic notation
2. Design algorithms using divide & conquer, dynamic programming, and greedy paradigms
3. Implement and analyze fundamental graph algorithms
4. Understand computational complexity theory and NP-completeness
5. Apply algorithmic thinking to solve novel problems

## Assessment

- **Exam 1**: 15%
- **Exam 2**: 15%
- **Exam 3**: 15%
- **Programming Assignments**: 55%
  - 7 PAs with the lowest grade dropped

**Exam Details**: Exam 1 and Exam 2 will be given in-class, Exam 3 will be administered during the final exam period (TBD). All Exams will be completed with the Lockdown browser. Email the instructor to coordinate an accommodation or makeup.

**Programming Assignment Details**: Programming Assignments are biweekly and due on Thursday at 11:59 PM via GitHub. Starter code is provided in both Java and Python - you may choose either language and switch between assignments. Solutions posted the following Thursday. Late policy: 10% deduction per day, maximum 5 days late. Lowest grade dropped.

**Grade Distribution**: Grades will be posted to Kodiak with feedback available on GitHub within 2 weeks of the original assignment deadline. Exam grades will be posted ASAP.

## Critical Dates

- First class: Tuesday, Aug 26
- Last add/drop: Friday, Sept 5
- **Exam 1**: Thursday, Oct 2
- No Class: Tuesday, Oct 14 (Fall Break)
- In-progress grades: Monday, Oct 20
- Last withdraw: Monday, Oct 27
- **Exam 2**: Thursday, Nov 6
- No Class: Thursday, Nov 27 (Thanksgiving)
- Last class: Thursday, Dec 4
- **Exam 3 - Final Exam**: TBD (December 8-12)
- Final grades posted: Monday, Dec 15

## Assignment Structure and Due Dates

### Programming Assignments

0. **PA0**: [Git & GitHub Starter Assignment](https://github.com) - Due Sept 4 (Week 1)
1. **PA1**: [Algorithm Analysis Practice]({{ PA1_URL }}) - Due September 18 (Week 3)
2. **PA2**: [Divide & Conquer Implementation]({{ PA2_URL }}) - Due October 2 (Week 5)
3. **PA3**: [Graph Algorithm Implementation]({{ PA3_URL }}) - Due October 23 (Week 8)
4. **PA4**: [Dynamic Programming Problems]({{ PA4_URL }}) - Due November 6 (Week 10)
5. **PA5**: [Greedy Algorithm Implementation]({{ PA5_URL }}) - Due November 20 (Week 12)
6. **PA6**: [NP-Complete Problem Reduction]({{ PA6_URL }}) - Due December 4 (Week 14)

Programming assignments focus on implementation and empirical analysis of algorithms. 7 PAs total with the lowest grade dropped.

- BiWeekly programming assignments due every other Thursday at 11:59 PM
- Starter Code Available either in Java and Python (give students Choice)
- Solutions posted Wednesday morning
- Late policy: 10% deduction per day, max 5 days late
- Focus on implementation of different algorithmic paradigms

## Course Topics by Exam

### Exam 1 Topics: Foundations and Data Structures (in /Exam1 folder)

- Introduction and Peak Finding - Algorithmic thinking and divide-and-conquer
- Data Structures and Sequences - Arrays, linked lists, and dynamic arrays
- Sorting Algorithms - Insertion sort, merge sort, and analysis
- Hashing and Hash Tables - Dictionary operations and collision resolution
- Linear Sorting - Counting sort, radix sort, and lower bounds
- Binary Search Trees - BST operations and tree traversals

### Exam 2 Topics: Graph Algorithms and Shortest Paths (in /Exam2 folder)

- Balanced Binary Search Trees (AVL) - Rotations and height guarantees
- Binary Heaps and Priority Queues - Heap operations and heap sort
- Graph Representations and BFS - Graph basics and breadth-first search
- Depth-First Search and Applications - DFS, topological sort, and SCCs
- Bellman-Ford Algorithm - Shortest paths with negative weights
- Dijkstra's and Johnson's Algorithms - Efficient shortest path algorithms

### Exam 3 Topics: Dynamic Programming and Complexity (in /Exam3 folder)

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
- **_Optional_** - **Syllabot**: Open this [repository](https://github.com/wne-cs366-f25/syllabot.git) as a devContainer in VSCode or prefix your Claude chats with `tinyurl.com/cs366-syllabot`
- **Lecture Transcripts**: Anonymized transcripts of class lectures are posted to Kodiak LMS to enhance accessibility and allow students to search for specific topics discussed in class

## Repository Structure

```
syllabot/
├── .devcontainer/      # Development environment configuration
├── CLAUDE.md           # Course context for AI assistant
├── README.md           # This file - Detailed syllabus and course information
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

**Key Points for Students:**
- Each lesson file (00-25) corresponds to a specific course topic and lecture day
- Files are posted by the instructor usually on the morning of each lecture
- Focus on lesson content (.md files) - ignore any template files (.j2) you may see as they are for instructor content management only
- Programming assignments are separately accessible on GitHub Classroom (PA0-PA6)

**Programming Assignment Access:**
- Programming assignments (PA0-PA6) are privately accessible through GitHub Classroom
- Starter code provided in both Java and Python for PA1-PA6 
- Students may choose either language and switch between assignments
- Access requires Discord nickname to be cross-posted to GitHub Classroom (completed morning of Aug 28th)
- Contact instructor if nickname unavailable in GitHub Classroom

### Why This Structure Matters for Students and Claude

**Progressive Learning Path**: Each exam folder builds on previous concepts, allowing students to develop algorithmic maturity gradually. Claude can reference this progression when explaining how concepts connect.

**Comprehensive Context**: The CLAUDE.md file provides complete course context including:

- Current semester dates and deadlines
- Programming assignment specifications and due dates
- Office hours and contact information
- Course policies and academic integrity guidelines
- Links to GitHub Classroom and Discord resources

**Intelligent Assistance**: When students interact with Syllabot either locally with Claude Code or when Claude reads this file during a prompt starting with the url tinyurl.com/cs366-syllabot, the AI can:

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

## Getting Additional Help

1. Ask Syllabot/Claude (that's me! The student is currently talking to me if I'm reading this.)
2. Post in the course Discord channels or message an instructor
3. Email the instructor at declan.gray-mullen@wne.edu
4. Attend office hours (Wednesday 12:30-1:30 PM or Tuesday 12:30-1:30 PM in Herman 207)
5. Form study groups with classmates
6. Reach out to Counseling Services at 413-782-1211 or by email at counseling.services@wne.edu

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_