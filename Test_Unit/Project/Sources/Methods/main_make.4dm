//%attributes = {"invisible":true}

// Method Name  : main_make
// Method Owner : o.marolleau

//----------------------------------------------------------------------------------

// DECLARE VARIABLES

var $index; $indexButton; $indextheme; $maxLine : Integer
var $left; $top; $right; $bottom; $width; $heigth : Integer


var $buttonFolder : Text
var $objNameButton; $objNameTitle; $objNameLine : Text
var $objNameButtonNew; $objNameTitleNew; $objNameLineNew : Text

var $varPointer : Pointer

var $buttonImg : Picture

//----------------------------------------------------------------------------------

// define test target

$buttonFolder:=Folder:C1567(Get 4D folder:C485(Dossier base:K5:14); fk chemin plateforme:K87:2).parent.platformPath+"4D Buttons"+Séparateur dossier:K24:12

$objNameButton:="b1"
$objNameTitle:="t1"
$objNameLine:="n1"

$objNameButtonNew:="b1"
$objNameTitleNew:="t1"
$objNameLineNew:="n1"

$index:=1
$maxLine:=0

// loop on theme

ARRAY TEXT:C222($_folder; 0)
FOLDER LIST:C473($buttonFolder; $_folder)
SORT ARRAY:C229($_folder; >)
For ($indextheme; 1; Size of array:C274($_folder))
	
	//loop on button
	
	ARRAY TEXT:C222($_file; 0)
	DOCUMENT LIST:C474($buttonFolder+$_folder{$indextheme}+Séparateur dossier:K24:12; $_file; Ignorer invisibles:K24:16)
	SORT ARRAY:C229($_file; >)
	
	For ($indexButton; 1; Size of array:C274($_file))
		
		// create button
		
		$objNameButtonNew:="b"+String:C10($index)
		
		If ($indexButton=1)
			OBJECT DUPLICATE:C1111(*; $objNameButton; $objNameButtonNew; $varPointer; $objNameButton; -$maxLine; 132)
			$maxLine:=0
		Else 
			OBJECT DUPLICATE:C1111(*; $objNameButton; $objNameButtonNew; $varPointer; $objNameButton; 70; 0)
			$maxLine:=$maxLine+70
		End if 
		
		// load image init var
		
		READ PICTURE FILE:C678($buttonFolder+$_folder{$indextheme}+Séparateur dossier:K24:12+$_file{$indexButton}; $buttonImg)
		Get pointer:C304("bImg_"+String:C10($index))->:=$buttonImg
		
		// set format
		
		PICTURE PROPERTIES:C457($buttonImg; $width; $heigth)
		OBJECT SET FORMAT:C236(*; $objNameButtonNew; "1;"+Choose:C955($width*4>$heigth; "1"; "4")+";bImg_"+String:C10($index)+";176;0")
		
		// link 
		
		$objNameButton:=$objNameButtonNew
		$index:=$index+1
		
	End for 
	
	// set title
	
	$objNameTitleNew:="t"+String:C10($indextheme)
	
	OBJECT DUPLICATE:C1111(*; $objNameTitle; $objNameTitleNew; $varPointer; $objNameTitle; 0; 132)
	OBJECT SET TITLE:C194(*; $objNameTitleNew; $_folder{$indextheme})
	
	$objNameTitle:=$objNameTitleNew
	
	// set line
	
	$objNameLineNew:="n"+String:C10($indextheme)
	
	OBJECT DUPLICATE:C1111(*; $objNameLine; $objNameLineNew; $varPointer; $objNameLine; 0; 132; 1; 1)
	OBJECT GET COORDINATES:C663(*; $objNameLine; $left; $top; $right; $bottom)
	OBJECT MOVE:C664(*; $objNameLineNew; 0; 0; $maxLine-($right-$left)+70; 0)
	
	$objNameLine:=$objNameLineNew
	
End for 