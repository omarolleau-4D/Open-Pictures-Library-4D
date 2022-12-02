
// Method Name  : include
// Method Owner : o.marolleau

//----------------------------------------------------------------------------------

// DECLARE VARIABLES

var $evs : Integer

//----------------------------------------------------------------------------------

$evs:=FORM Event:C1606.code

Case of 
	: ($evs=Sur chargement:K2:1)
		
		main_make
		
End case 