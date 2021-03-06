private
at: key put: anObject
	<pPrimitive: #at:put: plugin: #'Collection.IdentityDictionary'>
	| bucketIndex bucket |
	linear ifTrue: [ ^ self inFirstBucketAt: key put: anObject ].
		
	bucketIndex := key identityHash \\ buckets size + 1.
	bucket := buckets at: bucketIndex.
	bucket ifNil: [
		(self newBucketAt: bucketIndex) newKey: key value: anObject.
		self checkGrow.
		^ anObject ].
	(bucket assign: key to: anObject) ifTrue: [ ^ anObject ].
	bucket isFull ifTrue: [ bucket := self growBucketAt: bucketIndex ].
	bucket newKey: key value: anObject.
	self checkGrow.
	^ anObject