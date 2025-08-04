//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $rabbitmq_pub : cs:C1710.amqp_declare_queue
	$rabbitmq_pub:=cs:C1710.amqp_declare_queue.new(cs:C1710._rabbitmq_Controller)
	$rabbitmq_pub.connect({host: "localhost"; queue: "hello/world"})
	
End if 