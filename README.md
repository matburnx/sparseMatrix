# sparseMatrix
[Pharo exercise](https://www.geeksforgeeks.org/sparse-matrix-representation/) that manipulates sparse matrices.
A sparse matrix is a matrix with most of its elements equal to 0.
For example, this is a sparse matrix :
```
0 0 3 0 4
0 0 5 7 0
0 0 0 0 0
0 2 6 0 0
```
The goal of this exercise is to change it to a "compact" matrix and vice versa :
```
Row :    0 0 1 1 3 3
Column : 2 4 2 3 1 2
Value :  3 4 5 7 2 6
```
It contains 3 methods : `createMatrixWithRow: andColumn:`, `sparseMatrix` and `unsparseMatrix`

## createMatrixWithRow: andColumn:
Creates a matrix with given rows and columns, or just an empty array if given 0.
This matrix will be by default filled with zeros.

## sparseMatrix
Takes a "compact" matrix and return it as a sparse matrix with each value different from 0 at its position and the rest filled with zeros.

## unsparseMatrix
Takes a sparse matrix and return it as a 2D array with each value different from 0 and its row and column.
