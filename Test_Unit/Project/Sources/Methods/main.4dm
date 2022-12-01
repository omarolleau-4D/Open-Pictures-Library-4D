//%attributes = {}

// METHOD PATH  : main

// METHOD CREATED BY : o.marolleau at 25/11/22, 08:22:41
// METHOD UPDATED BY : o.marolleau at 25/11/22, 08:22:41

//----------------------------------------------------------------------------------

// DECLARE PARAMETERS

#DECLARE($option)

// DECLARE VARIABLES

var $prc; $win : Integer
var $left; $top; $right; $bottom : Integer

//----------------------------------------------------------------------------------

$prc:=Process number:C372("main")

Case of 
	: ($prc=0)
		
		CALL WORKER:C1389("main"; "main"; New object:C1471("act"; "create"))
		
	: (Count parameters:C259=0)
		
		BRING TO FRONT:C326($prc)
		
	: ($option.act="create")
		
		$left:=(Screen width:C187-1280)/2
		$top:=(Screen height:C188-1024)/2
		$right:=$left+1280
		$bottom:=$top+1024
		
		$win:=Open window:C153($left; $top; $right; $bottom; Fenêtre standard:K34:13; "main")
		DIALOG:C40("main"; *)
		
	: ($option.act="kill")
		
		KILL WORKER:C1390($prc)
		
End case 
