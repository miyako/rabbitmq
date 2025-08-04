property persistent : Boolean
property replyTo : Text
property contentType : Text

Class extends amqp

Class constructor($controller : 4D:C1709.Class)
	
	Super:C1705("amqp-publish"; $controller)
	
Function connect($options : Object) : cs:C1710.amqp_publish
	
	$command:=This:C1470.parseOptions($options)
	
	If ($options.persistent#Null:C1517) && (Bool:C1537($options.persistent))
		$command+=" --persistent"
	End if 
	
	If ($options.replyTo#Null:C1517)
		This:C1470.replyTo:=String:C10($options.replyTo)
		$command+=" --reply-to="
		$command+=This:C1470.escape(This:C1470.replyTo)
	End if 
	
	If ($options.contentType#Null:C1517)
		This:C1470.contentType:=String:C10($options.contentType)
		$command+=" --content-type="
		$command+=This:C1470.escape(This:C1470.contentType)
	End if 
	
	If (Value type:C1509($options.message)=Is text:K8:3) || (Value type:C1509($options.message)=Is BLOB:K8:12)
		This:C1470.controller.init().execute($command)
		This:C1470.worker.postMessage($options.message)
		This:C1470.worker.closeInput()
	End if 
	
	return This:C1470
	
	