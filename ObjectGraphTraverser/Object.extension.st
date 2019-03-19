Extension { #name : #Object }

{ #category : #'*ObjectGraphTraverser' }
Object >> traverseWithClasses: aCollection doing: aBlock [
	(aCollection anySatisfy: [ :class | class == self class ]) 
		ifTrue: [ aBlock value: self ].
	
	self class allInstVarNames do: [ :ivarName |
		| ivarValue |
		ivarValue := self instVarNamed: ivarName.
		
		(aCollection anySatisfy: [ :class | class == ivarValue class ])
			ifTrue: [ 
				ivarValue traverseWithClasses: aCollection doing: aBlock ].
		
	   (Collection allSubclasses anySatisfy: [ :class | class == ivarValue class ])
			ifTrue: [ 
				
				ivarValue do: [:each | each traverseWithClasses: aCollection doing: aBlock ]].
	]
]
