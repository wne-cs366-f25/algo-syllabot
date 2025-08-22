# Syllabus - CS366: Design & Analysis of Algorithms

**Fall 2025**

## Course Information

- **Instructor**: Declan Gray-Mullen - Lecturer - declan.gray-mullen@wne.edu
- **Semester**: Fall 2025
- **Prerequisites**: CS200 & CS210
- **Sections**:
  - CS366-01: Tuesday/Thursday 9:30-10:50 AM
  - CS366-03: Tuesday/Thursday 11:00 AM-12:20 PM
- **Office Hours**:
  - Wednesday 12:30-1:30 PM (Herman 207)
  - Tuesday 12:30-1:30 PM (Herman 207)
- **GitHub**: Create a GitHub account to complete Programming Assignments - submit your username on Kodiak
- **Discord**: Join the [Course Discord Server](https://discord.gg/tzywKCNM2j) - set your nickname to something similar to your IRL name
- **_Optional_** - 💵💵 / 🏫 / 🏴‍☠️ - **Textbook**: Introduction to Algorithms (CLRS), 3rd Edition
- **_Optional_** - **Syllabot**: AI course assistant with multiple access methods:
  - 💵 / 💵💵💵 **Claude Code**: Open this [repository](https://github.com/wne-cs366-f25/algo-syllabot.git) as a devContainer in VSCode, install the 'Dev Containers' extension if needed, then run [`claude`](https://github.com/anthropics/claude-code) in terminal. Requires Claude Pro account.
  - 🆓 / 💵 **Gemini CLI**: Google's [`gemini`](https://github.com/google-gemini/gemini-cli) cli is also configured as the Syllabot in this devContainer. Works with free tier personal Google accounts.
  - 🎨 / 🔮 **CoPilot**, **Codex**, **Cursor**, **Windsurf**...: Additional _untested_ AI tooling is also supported with generated context files using [ruler](https://github.com/intellectronica/ruler)
- **Lecture Transcripts**: Anonymized transcripts of class lectures are posted to Kodiak

## Syllabot - AI Syllabus Assistant for Students

Agents (Claude, Gemini, etc....) configured to load the course context including the schedule, materials, and assignments as they are posted. Follow the instructions in Course Information and ask:

- "What's the next assignment due?"
- "Explain the Master Theorem"
- "Help me implement Dijkstra's algorithm"
- "What topics are on Exam 1?"

Programming Assignments are intended to be completed based on the provided course material and in-class lectures. Remember AI makes mistakes and can only accomplish what you can describe. Use algorithms for learning at your own risk.

### ⚠️ Proactive Automatic Deadline Alerts (Always Displayed First!)

Syllabot AUTOMATICALLY displays upcoming deadlines at the START of EVERY interaction:

**Priority Levels:**

- 🔴 **URGENT** (Within 48 hours): Immediate action required
- 🟡 **LATE PERIOD PA** (0-5 days past): Submit ASAP
- 🟢 **FUTURE** (< 7 days): Start when you can

**Information Shown:**

- Exact due dates and times with countdown
- Days/hours remaining until deadline
- Late penalty calculation (-10% per day, max 5 days)
- Grade impact for each item (% of final grade)
- Auto-reminder about lowest PA grade drop

## Critical Dates

- Tuesday, August 26: First class
- Friday, Sept 5: Last add/drop
- Thursday, Oct 2: **Exam1** - Algorithm Analysis and Foundations 📝
- Tuesday, Oct 14: No Class (Fall Break)
- Monday, Oct 20: In-progress grades
- Monday, Oct 27: Last withdraw
- Thursday, Nov 6: **Exam2** - Advanced Data Structures 📝
- Thursday, Nov 27: No Class (Thanksgiving)
- Thursday, Dec 4: Last class
- Finals Week (Dec 8-12): **Exam3/Final** - Dynamic Programming and Computational Complexity (Location TBD) 📝
- Monday, Dec 15: Final grades posted

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

**Key Notes:**

- Lesson files for each exam unit will be posted by the instructor as the course progresses
- Files are posted by the instructor usually by the morning of each lecture
- Programming assignments are separately accessible on GitHub Classroom (PA0-PA6)

## Learning Objectives

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

### Week 2: Sep 2, 4
**Topic**: Peak Finding & Data Structures

**Assignment**: PA0 due (Sep 4)

### Week 3: Sep 9, 11
**Topic**: Asymptotic Notation & Binary Search Trees

### Week 4: Sep 16, 18
**Topic**: Recurrence Relations & Sorting Algorithms

**Assignment**: PA1 due (Sep 18)

### Week 5: Sep 23, 25
**Topic**: Linear Sorting & Hash Tables

### Week 6: Sep 30, Oct 2
**Topic**: Balanced BSTs & Exam 1

**Assignment**: PA2 due (Oct 2), Exam 1 (Oct 2)

### Week 7: Oct 7, 9
**Topic**: Binary Heaps & Graph Fundamentals

### Week 8: Oct 16
**Topic**: Graph Representations & Search Algorithms

### Week 9: Oct 21, 23
**Topic**: Shortest Paths & Greedy Algorithms

**Assignment**: PA3 due (Oct 23)

### Week 10: Oct 28, 30
**Topic**: Advanced Shortest Paths

### Week 11: Nov 4, 6
**Topic**: Dynamic Programming Introduction & Exam 2

**Assignment**: PA4 due (Nov 6), Exam 2 (Nov 6)

### Week 12: Nov 11, 13
**Topic**: DP on Sequences & Advanced DP

### Week 13: Nov 18, 20
**Topic**: Knapsack Problems & Minimum Spanning Trees

**Assignment**: PA5 due (Nov 20)

### Week 14: Nov 25
**Topic**: Computational Complexity Theory

### Week 15: Dec 2, 4
**Topic**: NP-Completeness & Course Review

**Assignment**: PA6 due (Dec 4)

### Week 16: Dec 8-12
**Topic**: Final Exam Week

**Assignment**: Exam 3 (Finals Week)



## Programming Assignments

| Title | Due Date |
|-------|----------|
| GitHub & Environment Starter Assignment | Sept 4 |
| Algorithm Analysis Practice | September 18 |
| Divide & Conquer Implementation | October 2 |
| Graph Algorithm Implementation | October 23 |
| Greedy Algorithm Implementation | November 6 |
| Dynamic Programming Problems | November 20 |
| NP-Complete Problem Reduction | December 4 |


## Examinations

### Algorithm Analysis and Foundations: Thursday, Oct 2 (15%)
Algorithm analysis, peak finding, data structures, asymptotic notation, binary search trees, recurrence relations, sorting algorithms, linear sorting, hashing and hash tables

### Advanced Data Structures: Thursday, Nov 6 (15%)
AVL trees, binary heaps, graph algorithms basics, BFS, DFS, Bellman-Ford, greedy algorithms, Dijkstra's algorithm, shortest paths

### Dynamic Programming and Computational Complexity: Finals Week (Dec 8-12) (15%)
Dynamic programming introduction and sequences, advanced DP, knapsack problems, minimum spanning trees, computational complexity, NP-completeness 

## Grading

- **Programming Assignments**: 55% - 7 assignments (PA0-PA6) implementing algorithms (drop lowest)
- **Exam 1**: 15% - Sorting, divide & conquer, hash tables
- **Exam 2**: 15% - Graphs, shortest path, BST, greedy, Dijkstra
- **Final/Exam3**: 15% - Dynamic programming, MSTs, P vs NP
.

**Grading Scale**:

- A: 93-100% | A-: 90-92% | B+: 87-89% | B: 83-86% | B-: 80-82% | C+: 77-79% | C: 73-76% | C-: 70-72% | D+: 67-69% | D: 60-66% | F: Below 60%

### Grading Policies

- **Late Policy**: 10% per day, maximum 5 days late
- **Collaboration**: Discussion encouraged, code must be individual
- **Academic Integrity**: All code must be original or properly cited


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
- Use Agents for understanding concepts
- Reference the textbook and course materials

You may NOT:

- Copy code from other students
- Use Agents to write complete solutions
- Submit work from previous semesters

## Student Accessibility Services

I am committed to creating a course that is inclusive in its design. If you encounter barriers, please let me know immediately so we can determine if there is a design adjustment that can be made. I am happy to consider creative solutions as long as they do not compromise the intent of the assessment or learning activity. If you have a disability, or think you may have a disability, you may also want to meet with Student Accessibility Services. The contact information is listed below:

Student Accessibility Services
Herman Hall, SAS Suite 105
Office Phone: 413-782-1258
Email: accessibility@wne.edu

Once I have a copy of your approved accommodations from SAS we can plan a time to connect to discuss your accommodation needs. In addition, if you are approved for exam accommodations, please consult with me at least two weeks before any scheduled exam date to confirm the testing arrangements.

## Support

### 📞 Contact Guide

1. **Urgent (Same Day Response Needed)**

   - Email: declan.gray-mullen@wne.edu
   - Subject line: "URGENT: CS366 - [Your Issue]"

2. **Quick Questions**

   - Ask Syllabot (Claude) first
   - Discord channels for peer help

3. **In-Depth Help**

   - Office hours: Wednesday 12:30-1:30 PM (Herman 207), Tuesday 12:30-1:30 PM (Herman 207)
   - Schedule appointment via email

4. **Study Support**

   - Form study groups via Discord
   - Use Syllabot for reccommendations

5. **Mental Health Support**
   - Counseling Services: 413-782-1211
   - Email: counseling.services@wne.edu

Happy coding and algorithm analysis!

---

_Course content developed by Declan Gray-Mullen for WNEU with Claude_
