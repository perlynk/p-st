visitor
visitClassReference: aPClassReference
	| oldClass |
	oldClass := currentClass.
	currentClass := aPClassReference pclass.
	self visit: aPClassReference pclass.
	currentClass := oldClass.
	self addGlobal: aPClassReference