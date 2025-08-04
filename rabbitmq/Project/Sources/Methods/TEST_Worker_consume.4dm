//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $rabbitmq_sub : cs:C1710.amqp_consume
	$rabbitmq_sub:=cs:C1710.amqp_consume.new(cs:C1710._rabbitmq_Controller)
	$rabbitmq_sub.connect({host: "localhost"; routing: "hello/world"})
	
End if 