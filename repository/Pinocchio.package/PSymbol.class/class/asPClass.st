pharo-exporting
asPClass
	<preventExport>
	self = PSymbol
		ifFalse: [ ^ super asPClass ].
	^ (PInternalClass newWith: self)
			customLayout: true