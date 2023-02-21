
// Method Name  : main.bActivate
// Method Owner : o.marolleau

//----------------------------------------------------------------------------------

// DECLARE VARIABLES

//----------------------------------------------------------------------------------

If (FORM Event:C1606.code=Sur clic:K2:4)
	
	OBJECT SET ENABLED:C1123(*; "b@"; True:C214)
	
	OBJECT SET ENABLED:C1123(*; "bActivate"; True:C214)
	OBJECT SET ENABLED:C1123(*; "bInactivate"; True:C214)
	OBJECT SET ENABLED:C1123(*; "bClose"; True:C214)
	
End if 
