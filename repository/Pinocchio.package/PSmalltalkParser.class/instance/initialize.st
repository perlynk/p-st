initialization
initialize
	super initialize.
	stream := WriteStream on: (String new: 1024).