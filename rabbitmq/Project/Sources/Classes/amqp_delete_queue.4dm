property queue : Text
property ifUnused : Boolean
property ifEmpty : Boolean

Class extends amqp

Class constructor($controller : 4D:C1709.Class)
	
	Super:C1705("amqp-delete-queue"; $controller)
	
Function connect($options : Object) : cs:C1710.amqp_delete_queue
	
	$command:=This:C1470.parseOptions($options)
	
	If ($options.ifUnused#Null:C1517) && (Bool:C1537($options.ifUnused))
		$command+=" --if-unused"
	End if 
	
	If ($options.ifEmpty#Null:C1517) && (Bool:C1537($options.ifEmpty))
		$command+=" --if-empty"
	End if 
	
	If ($options.queue#Null:C1517)
		This:C1470.queue:=String:C10($options.queue)
		$command+=" --queue="
		$command+=This:C1470.escape(This:C1470.queue)
	End if 
	
	This:C1470.controller.init().execute($command)
	
	return This:C1470