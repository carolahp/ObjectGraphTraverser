Class {
	#name : #ObjectTraverserTest,
	#superclass : #TestCase,
	#category : #'ObjectGraphTraverser-Tests'
}

{ #category : #tests }
ObjectTraverserTest >> testInitialize [
	| traverser results |
	traverser := ObjectTraverser new.
	traverser root: 2 -> (3@4).
	traverser classes: {Association . Point}.
	
	results := OrderedCollection new.
	traverser block: [ :obj | results add: obj ].
	traverser do.
	
	self assert: results equals: { 2 -> (3@4) . (3@4) } asOrderedCollection 
]

{ #category : #tests }
ObjectTraverserTest >> testInitialize2 [
	| traverser results |
	traverser := ObjectTraverser new.
	traverser root: 2 -> {(3@4)}.
	traverser classes: {Association . Point}.
	
	results := OrderedCollection new.
	traverser block: [ :obj | results add: obj ].
	traverser do.
	
	self assert: results equals: { 2 -> {(3@4)} . (3@4) } asOrderedCollection 
]

{ #category : #tests }
ObjectTraverserTest >> testInitialize3 [
	| traverser results |
	traverser := ObjectTraverser new.
	traverser root: 2 -> 'a'.
	traverser classes: {Association . Point}.
	
	results := OrderedCollection new.
	traverser block: [ :obj | results add: obj ].
	traverser do.
	
	self assert: results equals: { 2 -> 'a' } asOrderedCollection 
]
