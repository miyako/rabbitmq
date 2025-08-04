property name : Text

Class extends _Form

Class constructor($name : Text)
	
	Super:C1705()
	
	This:C1470.name:=$name
	This:C1470.pages:={values: ["rabbitmq"; "debug"]}
	
	$window:=Open form window:C675(String:C10(This:C1470.name))
	DIALOG:C40(This:C1470.name; This:C1470; *)
	
Function onLoad()
	
	Form:C1466[This:C1470.name]:=cs:C1710[This:C1470.name].new(cs:C1710._rabbitmqUI_Controller)
	
Function onUnload()
	
	Form:C1466[This:C1470.name].terminate()