Class {
	#name : #ObjectTraverser,
	#superclass : #Object,
	#instVars : [
		'root',
		'classes',
		'block'
	],
	#category : #ObjectGraphTraverser
}

{ #category : #accessing }
ObjectTraverser >> block: aBlockClosure [ 
	block := aBlockClosure
]

{ #category : #accessing }
ObjectTraverser >> classes: aCollection [ 
	classes := aCollection
]

{ #category : #executing }
ObjectTraverser >> do [
	
	root traverseWithClasses: classes doing: block
]

{ #category : #accessing }
ObjectTraverser >> root: anObject [ 
	root := anObject
]
