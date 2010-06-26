parsing
fullmatch: aString
	| input |
	input := PEGStringScanner on: aString separator: self separator.
	(self method match: input to: stack) ifFalse: [ self parsingFailed ].
	input should be atEnd.
	stack position should = 1.
	^ stack pop