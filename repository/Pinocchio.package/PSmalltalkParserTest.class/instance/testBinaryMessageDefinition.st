tests
testBinaryMessageDefinition
	| parser string result |
	parser := pparser binaryMessageDefinition.
	string := PEGStringScanner on: '+= a'.
	result := parser match: string.
	result class should = ASTBinaryMessageDefinition.
	result selector printString should = '+='.
	result parameter class should = ASTVariable.
	result parameter name asString should = 'a'.
	string position should = 4.
	string := PEGStringScanner on: '|= a'.
	[ parser match: string ] should signal: PEGParsingFailure.
	string := PEGStringScanner on: '-= abc d'.
	result := parser match: string.
	result class should = ASTBinaryMessageDefinition.
	result selector printString should = '-='.
	result parameter name asString should = 'abc'.
	result parameter class should = ASTVariable.
	string position should = 6