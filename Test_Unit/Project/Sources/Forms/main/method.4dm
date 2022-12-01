
// Method Name  : main
// Method Owner : o.marolleau

//----------------------------------------------------------------------------------

// DECLARE VARIABLES

var $evs : Integer

//----------------------------------------------------------------------------------

$evs:=FORM Event:C1606.code

// events

Case of 
	: ($evs=Sur libération:K2:2)
		
		// kill worker
		
		KILL WORKER:C1390(Current process:C322)
		
End case 
