visiting
accept: visitor on: receiver class: class message: message boundBy: closure
	^ visitor invokeNativeMethod: closure on: receiver class: class message: message