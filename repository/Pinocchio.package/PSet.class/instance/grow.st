private
grow
	| oldBuckets oldSize |
	oldBuckets := buckets.
	buckets := Array new: (oldBuckets size << 1 max: 32).
	oldBuckets withIndexDo: [ :bucket :index | self reAddBucket: bucket at: index].