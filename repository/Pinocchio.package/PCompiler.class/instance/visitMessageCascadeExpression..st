visitor
visitMessageCascadeExpression: anASTMessageCascadeExpression
	"TODO: Maybe optimize by adding a tmp to the current block"

	| receiver block send |
	receiver := ASTVariable new name: #'_receiver_'.
	anASTMessageCascadeExpression cascades do: [ :message | message receiver: receiver ].
	block := ASTBlock new
		parameters: (Array with: receiver);
		statements: anASTMessageCascadeExpression cascades.
	send := ASTMessageExpression new
		receiver: block;
		arguments: (Array with: anASTMessageCascadeExpression receiver);
		selector: #value:.
	^ self visit: send