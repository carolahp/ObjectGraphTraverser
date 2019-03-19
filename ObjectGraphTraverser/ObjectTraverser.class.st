"
Notes:

no reflective API:
        for getting all values of all ivars

Views: Look at OrderedCollection, should it iterate over the low level data structure
or just the elements?
                => first solution: add custom implementation for all these cases to do what you would think.

-> we need to control how far to travel.
        -> when to stop?
                        -> what is a leaf?
        -> which ivars to follow.                
        
        Number
            deep: #(subclasses superclass)   
            collect: #name.
                        
        to speficfy which vars to follow
        
-> ideas: restrict to a class hierarchy. 

        e.g. traverse this AST node, left order, but execute the block only on subclasses of RBProgramNode
        
        
        (OrderedCollection>>#add ast deepForClassHierarchy: RBProgramNode do: [:node | node doSomething ]

Other idea:
===========

send a message in the HOM style (not really related but a fun idea)


What is a usecase?
-------------------

Low things: iterating a boostrapped image.

        => Low level view. You want to see everything.
        

        
        
        
GenericVisitors.
        => can traverse over everything without neede a public API or a visitor class.
        
        
        (OrderedCollection>>#add ast vistitWith: [:each | self visitNode: each] restrictedTo: RBProgramNode
        
        
        
        
        but problem: where to stop?
        and: visit too much uneeded object.
        
        
        -> we specify which class hierarchy. And we visit standard collections.
        
                -> if you put Object, it visits everything as far as it wants.
                
                -> one could add a max depth to not run into problems.
"
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
