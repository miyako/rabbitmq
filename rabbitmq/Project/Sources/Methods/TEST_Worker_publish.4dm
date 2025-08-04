//%attributes = {}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $rabbitmq_pub : cs:C1710.amqp_publish
	$rabbitmq_pub:=cs:C1710.amqp_publish.new(cs:C1710._rabbitmq_Controller)
	$rabbitmq_pub.connect({host: "localhost"; routing: "hello/world"; message: "Hello, RabbitMQ"})
	
End if 