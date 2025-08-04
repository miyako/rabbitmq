property host : Text
property queue : Text
property messages : Object
property stdErr : Text
property stdOut : Text

Class extends rabbitmq_Form

Class constructor
	
	Super:C1705("amqp_consume")
	
Function onLoad()
	
	Super:C1706.onLoad()
	
	Form:C1466.host:="localhost"
	Form:C1466.messages:={col: []; sel: Null:C1517; pos: Null:C1517; item: Null:C1517}
	
Function connect()
	
	Form:C1466.stdErr:=""
	Form:C1466.stdOut:=""
	Form:C1466.amqp_consume.connect({host: Form:C1466.host; queue: Form:C1466.queue})