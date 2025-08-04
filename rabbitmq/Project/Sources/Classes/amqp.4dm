property host : Text
property port : Integer
property username : Text
property password : Text
property cafile : 4D:C1709.File
property cert : 4D:C1709.File
property key : 4D:C1709.File
property exchange : Text
property routing : Text
property heartbeat : Integer

Class extends _CLI

Class constructor($command : Text; $controller : 4D:C1709.Class)
	
	Super:C1705($command; $controller=Null:C1517 ? cs:C1710._rabbitmq_Controller : $controller)
	
Function terminate()
	
	This:C1470.controller.terminate()
	
Function _path($item : Object) : Text
	
	return OB Class:C1730($item).new($item.platformPath; fk platform path:K87:2).path
	
Function get controller : cs:C1710._rabbitmq_Controller
	
	return This:C1470._controller
	
Function get worker() : 4D:C1709.SystemWorker
	
	return This:C1470.controller.worker
	
Function parseOptions($options : Object)->$command : Text
	
	If ($options#Null:C1517)
		
		$command:=This:C1470.escape(This:C1470._executablePath)
		
		If ($options.host#Null:C1517)
			This:C1470.host:=String:C10($options.host)
			$command+=" --server="
			$command+=This:C1470.escape(This:C1470.host)
		Else 
			This:C1470.host:="localhost"
		End if 
		
		If ($options.username#Null:C1517)
			This:C1470.username:=String:C10($options.username)
			$command+=" --username="
			$command+=This:C1470.escape(This:C1470.username)
		End if 
		
		If ($options.password#Null:C1517)
			This:C1470.password:=String:C10($options.password)
			$command+=" --password="
			$command+=This:C1470.escape(This:C1470.password)
		End if 
		
		var $secure : Boolean
		If ($options.ssl#Null:C1517) && (Bool:C1537($options.ssl))
			$command+=" --ssl"
			$secure:=True:C214
		Else 
			$secure:=False:C215
		End if 
		
		If ($options.cafile#Null:C1517) && (OB Instance of:C1731($options.cafile; 4D:C1709.File)) && ($options.cafile.exists)
			This:C1470.cafile:=$options.cafile
			$command+=" --cacert="
			$command+=This:C1470.escape(This:C1470._path($options.cafile))
		End if 
		
		If ($options.port#Null:C1517)
			This:C1470.port:=Num:C11($options.port)
			$command+=" --port="
			$command+=This:C1470.escape(String:C10(This:C1470.port))
		Else 
			This:C1470.port:=$secure ? 5671 : 5672
		End if 
		
		If ($options.cert#Null:C1517) && (OB Instance of:C1731($options.cert; 4D:C1709.File)) && ($options.cert.exists)
			This:C1470.cert:=$options.cert
			$command+=" --cert="
			$command+=This:C1470.escape(This:C1470._path($options.cert))
		End if 
		
		If ($options.key#Null:C1517) && (OB Instance of:C1731($options.key; 4D:C1709.File)) && ($options.key.exists)
			This:C1470.key:=$options.key
			$command+=" --key="
			$command+=This:C1470.escape(This:C1470._path($options.key))
		End if 
		
	End if 
	
	If ($options.exchange#Null:C1517)
		This:C1470.exchange:=String:C10($options.exchange)
		$command+=" --exchange="
		$command+=This:C1470.escape(This:C1470.exchange)
	End if 
	
	If ($options.routing#Null:C1517)
		This:C1470.routing:=String:C10($options.routing)
		$command+=" --routing-key="
		$command+=This:C1470.escape(This:C1470.routing)
	End if 
	
	If ($options.heartbeat#Null:C1517)
		This:C1470.heartbeat:=Num:C11($options.heartbeat)
		$command+=" --heartbeat="
		$command+=This:C1470.escape(String:C10(This:C1470.heartbeat))
	End if 