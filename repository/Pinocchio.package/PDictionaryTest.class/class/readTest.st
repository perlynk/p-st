as yet unclassified
readTest
	| pdict sdict dict |
	MessageTally spyOn: [
		pdict := self readTestFor: PDictionary.
	].
	MessageTally spyOn: [
		dict := self readTestFor: Dictionary.
	].
	(CodeHolder new contents: ( 'PDict: ', pdict asString, String cr,
							    'Dict:  ', dict asString))
		openLabel: 'Read Test Results' wrap: false.
	