tests
testCharacterConstant
	| parser string result |
	parser := pparser characterConstant.
	string := PEGStringScanner on: 'a'.
	[ parser match: string ] should signal: PEGParsingFailure.
	string position should = 0.
	string := PEGStringScanner on: '$_'.
	result := parser match: string.
	result class should = ASTCharacter.
	result char should = $_.
	string position should = 2