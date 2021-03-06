running
runCase: aTestCase
	| testCasePassed |
	testCasePassed := true.
	[[aTestCase runCase] on: self class failure do: [:signal | 
		failures add: aTestCase.
		testCasePassed := false.
		signal return: false]] on: Object do: [:signal |
			errors add: aTestCase.
			testCasePassed := false.
			signal return: false].
	testCasePassed ifTrue: [passed add: aTestCase]