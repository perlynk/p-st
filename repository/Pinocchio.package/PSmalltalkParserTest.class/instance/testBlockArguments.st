tests
testBlockArguments
	| string result var parser |
	parser := pparser blockArguments.
	string := PEGStringScanner on: ':abcd :def'.
	result := parser match: string.
	string position should = 10.
	result class should be isCollection.
	result size should = 2.
	var := result at: 1.
	var class should = ASTVariable.
	var name should = 'abcd'.
	var := result at: 2.
	var class should = ASTVariable.
	var name should = 'def'.
	string := PEGStringScanner on: ':  abcd:   def '.
	result := parser match: string.
	string position should = 15.
	result class should isCollection.
	result size should = 2.
	var := result first.
	var class should = ASTVariable.
	var name should = 'abcd'.
	var := result at: 2.
	var class should = ASTVariable.
	var name should = 'def'