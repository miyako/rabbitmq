property host : Text
property queue : Text
property message : Text
property stdErr : Text
property stdOut : Text

Class extends rabbitmq_Form

Class constructor
	
	Super:C1705("amqp_publish")
	
Function onLoad()
	
	Super:C1706.onLoad()
	
	Form:C1466.host:="localhost"
	Form:C1466.queue:=""
	Form:C1466.message:=""
	
Function connect()
	
	Form:C1466.stdErr:=""
	Form:C1466.stdOut:=""
	Form:C1466.amqp_publish.connect({host: Form:C1466.host; routing: Form:C1466.queue; message: Form:C1466.message})
	
Function declare()
	
	Form:C1466.stdErr:=""
	Form:C1466.stdOut:=""
	cs:C1710.amqp_declare_queue.new(cs:C1710._rabbitmqUI_Controller).connect({host: "localhost"; queue: Form:C1466.queue})
	
Function delete()
	
	Form:C1466.stdErr:=""
	Form:C1466.stdOut:=""
	cs:C1710.amqp_delete_queue.new(cs:C1710._rabbitmqUI_Controller).connect({host: "localhost"; queue: Form:C1466.queue})
	