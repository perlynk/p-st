as yet unclassified
benchSmallMethod
	| string |
	string := PEGStringScanner on: 'a
	^ self'.
	self repetitionCount timesRepeat: [ 
		methodParser match: string.
		string reset].