"
This class contains tests for the class SparseMatrix.
"
Class {
	#name : #SparseMatrixTest,
	#superclass : #TestCase,
	#category : #'SparseMatrix-Tests'
}

{ #category : #'basic tests' }
SparseMatrixTest >> testCreateMatrixWithRowAndColumn [
	"Test a method that creates a matrix given the number of rows and columns."
	| m |
	m := SparseMatrix new.
	m := m createMatrixWithRow: 3 andColumn: 4.
	self assert: m equals: #((0 0 0 0) (0 0 0 0) (0 0 0 0))
]

{ #category : #'basic tests' }
SparseMatrixTest >> testSparseMatrix [
	"Tests the method that sparses a matrix."
	|aMatrix compactMatrix|
	compactMatrix := SparseMatrix new.
	compactMatrix := #(#(0 0 1 1 3 3) #(2 4 2 3 1 2) #(3 4 5 7 2 6)).
	aMatrix := SparseMatrix new.
	self assert: (aMatrix sparseMatrix: compactMatrix) equals: #((0 0 3 0 4) (0 0 5 7 0) (0 0 0 0 0) (0 2 6 0 0)).
	self assert: (aMatrix sparseMatrix: nil) equals: nil
]

{ #category : #'basic tests' }
SparseMatrixTest >> testUnsparseMatrix [
	"Tests the method that unsparses a matrix."
	|aMatrix compactMatrix|
	aMatrix := SparseMatrix new.
	aMatrix := #((0 0 3 0 4) (0 0 5 7 0) (0 0 0 0 0) (0 2 6 0 0)).
	compactMatrix := SparseMatrix new.
	self assert: (compactMatrix unsparseMatrix: aMatrix) equals: #(#(0 0 1 1 3 3) #(2 4 2 3 1 2) #(3 4 5 7 2 6)).
	self assert: (compactMatrix unsparseMatrix: nil) equals: nil
]
