special
compileSendIfElse: aSend named: threadedName
	|  block1 block2 |
	block1 := aSend at: 1.
	block2 := aSend at: 2.
	(block1 isScoped or: [ block2 isScoped])
			ifTrue: [ ^ self compileSend: aSend ].
	aSend receiver accept: self.
	self append: threadedName with: aSend.
	self compileBlock: block1.
	self code addLast: block1.
	self compileBlock: block2.
	self code addLast: block2.