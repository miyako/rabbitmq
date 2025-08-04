property queue : Text
property exclusive : Boolean
property noAck : Boolean
property count : Integer

Class extends amqp

Class constructor($controller : 4D:C1709.Class)
	
	Super:C1705("amqp-consume"; $controller)
	
Function connect($options : Object) : cs:C1710.amqp_consume
	
	$command:=This:C1470.parseOptions($options)
	
	If ($options.queue#Null:C1517)
		This:C1470.queue:=String:C10($options.queue)
		$command+=" --queue="
		$command+=This:C1470.escape(This:C1470.queue)
	End if 
	
	If ($options.count#Null:C1517)
		This:C1470.count:=Num:C11($options.count)
		$command+=" --count="
		$command+=This:C1470.escape(String:C10(This:C1470.count))
	End if 
	
	If ($options.noAck#Null:C1517) && (Bool:C1537($options.noAck))
		$command+=" --no-ack"
	End if 
	
	If ($options.exclusive#Null:C1517) && (Bool:C1537($options.exclusive))
		$command+=" --exclusive"
	End if 
	
	Case of 
		: (Is macOS:C1572)
			$command+=" cat"
		: (Is Windows:C1573)
			$command+=" more"
	End case 
	
	This:C1470.controller.init().execute($command)
	
	return This:C1470