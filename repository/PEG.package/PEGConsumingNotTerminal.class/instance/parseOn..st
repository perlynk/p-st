matching
parseOn: input
	| next |
	next := input peek.
	next isNil ifTrue: [ ^ false ].
	char = next ifTrue: [ ^ false ].
	input push: char.
	input forward.
	^ true