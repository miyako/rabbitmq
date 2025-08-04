Class extends _rabbitmq_Controller

Class constructor($CLI : cs:C1710._CLI)
	
	Super:C1705($CLI)
	
Function onDataError($worker : 4D:C1709.SystemWorker; $params : Object)
	
	Super:C1706.onDataError($worker; $params)
	
	If (Form:C1466#Null:C1517)
		Form:C1466.stdErr:=This:C1470._stdErr
	End if 
	
Function onData($worker : 4D:C1709.SystemWorker; $params : Object)
	
	Super:C1706.onData($worker; $params)
	
	If (Form:C1466#Null:C1517)
		Case of 
			: (Form:C1466.name="amqp_publish")
				
			: (Form:C1466.name="amqp_consume")
				For each ($message; Split string:C1554($params.data; This:C1470.instance.EOL; sk ignore empty strings:K86:1 | sk trim spaces:K86:2))
					Form:C1466.messages.col.unshift({message: $message})
				End for each 
		End case 
	End if 
	
Function onResponse($worker : 4D:C1709.SystemWorker; $params : Object)
	
	Super:C1706.onResponse($worker; $params)
	
	If (Form:C1466#Null:C1517)
		Form:C1466.stdOut:=This:C1470._stdOut
		Case of 
			: (Form:C1466.name="amqp_publish")
				Form:C1466.message:=""  //sent
			: (Form:C1466.name="amqp_consume")
				
		End case 
	End if 
	
Function onTerminate($worker : 4D:C1709.SystemWorker; $params : Object)
	
	Super:C1706.onTerminate($worker; $params)