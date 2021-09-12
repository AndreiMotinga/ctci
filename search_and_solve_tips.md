Search & solving

- linkedin
- angellist
- glassdoor
- hackernews
- hired

Solving

1. Understand problem
  1. Can I restate the problem in my own words
  2. What are the imputes (positive, negative, casing, bounds, types, precision, completeness)
  3. What is the output
2. Explore examples  - simple, complex, empty
3. Break it down
4. Solve/simplify
5. Refactor/optimize
6. Ask how else could I solve it


Problem solving patterns

1. Frequency counters - use objects
2. Multiple Pointers - used to save space. have 2 or many pointers (opposite ends or same end) and move them
3. Sliding window - get subset of items, and move it one by one

Recursive function
- base case (when recursion ends)
- main body of function

	pifalls
    - no base case
    - no return

Sorting Algorithms
- Bubble sort - each item being moved to the end, i.e bubbles up. O(N^2)
- Selection sort  - select minimum, and swap it with first unsorted O(n^2)
- Insertion sort  - keep left portion of array sorted. insert into it one by one.  O(n^2)
- Merge sort - break into arrays of 1, merge them. use recursion to sort each result  O(n log n)
- Quck sort - use pivot to break into smaller chunks. works with indexes, rather than arrays
