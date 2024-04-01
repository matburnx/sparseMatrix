"
Represents a sparse matrix or its compact version.

"
Class {
	#name : #SparseMatrix,
	#superclass : #Object,
	#category : #SparseMatrix
}

{ #category : #'accessing - array' }
SparseMatrix >> createMatrixWithRow: row andColumn: column [
	"Create an empty matrix with r rows and c columns"
	|matrix|
	matrix := Array new: row.
	1 to: row do: [:i |
		matrix at: i put: (Array new: column withAll: 0)].
	^ matrix
	
]

{ #category : #'accessing - array' }
SparseMatrix >> sparseMatrix: matrix [
	"Takes a 'compact' matrix and return it as a sparse matrix with each value different from 0 at its position and filled with zeros."
	|mSparse row column value|
	matrix ifNil: [^nil].
	row := 0.
	column := 0.
	1 to: (matrix at: 1) size do: [:i |
		row := row max: ((matrix at: 1) at: i)].

	1 to: (matrix at: 2) size do: [:j |
		column := column max: ((matrix at: 2) at: j)].
	
	row:=row+1.
	column:=column+1.
	
	mSparse := self class new.
	mSparse := mSparse createMatrixWithRow: row andColumn: column.
	
	1 to: (matrix at: 1) size do: [:i |
		row := ((matrix at: 1) at: i) + 1.
		column := ((matrix at: 2) at: i) + 1.
		value := (matrix at: 3) at: i.
		(mSparse at: row) at: column put: value].
		
	^ mSparse
	
]

{ #category : #'accessing - array' }
SparseMatrix >> unsparseMatrix: matrix [
	"Takes a sparse matrix and return it as a 2D array with each value different from 0 and its row and column."
	|mCompact mSize count value|
	matrix ifNil: [^nil].
	mSize := 0.

	1 to: matrix size do: [:k |
		1 to: (matrix at: k) size do: [:l |
			value := (matrix at: k) at: l.
			value == 0 ifFalse: [mSize:=mSize+1]]].

	mCompact := self class new.
	mCompact := mCompact createMatrixWithRow: 3 andColumn: mSize.
	count := 1.
	1 to: matrix size do: [:i |
		1 to: (matrix at: i) size do: [:j |
			value := (matrix at: i) at: j.
			(value == 0) ifFalse:
				[(mCompact at: 1) at: count put: i-1.
				(mCompact at: 2) at: count put: j-1.
				(mCompact at: 3) at: count put: value.
				count:=count +1]]].
	^ mCompact
	
]
