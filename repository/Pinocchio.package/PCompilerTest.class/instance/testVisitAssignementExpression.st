running
testVisitAssignementExpression
	| result constant |
	visitor scope declare: (ASTVariable new name: 'a').
	parser := scparser subExpression.
	result := self ast: ' a:= 13.'.
	result class should = PAssign.
	result variable class should = PVariable.
	result variable name should = #a.
	result expression class should = PConstant.
	constant := result expression constant asPObject.
	constant class should = PSmallInt.
	constant int should = 13.