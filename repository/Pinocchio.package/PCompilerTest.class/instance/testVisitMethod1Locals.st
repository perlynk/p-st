running
testVisitMethod1Locals
	| ast |
	parser := pparser method.
	ast := self ast: 'doIt' , String cr , '|a|' , String cr , ' a + 2.'.
	ast class should = PMethodClosure.
	ast := ast code.
	ast size should = (1 + 1).
	ast locals size should = 1.
	ast params size should = 0.
	self assureLastIsReturningSelf: ast