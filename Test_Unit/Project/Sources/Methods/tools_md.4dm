//%attributes = {}

// Method Name  : tools_md
// Method Owner : o.marolleau

//----------------------------------------------------------------------------------

// DECLARE VARIABLES

var $themesPath; $a; $b; $c; $result : Text

var $i : Integer

var $theme; $file : Object

//----------------------------------------------------------------------------------

// select target

$themesPath:=Select folder:C670("Select folder themes"; 99; Utiliser fenêtre feuille:K24:11)
If (ok=1)
	
	$theme:=Folder:C1567($themesPath; fk chemin plateforme:K87:2)
	
	// init html
	
	$a:="\t<img src=\"/4D%20Buttons/"
	$b:="\" alt=\""
	$c:="\" width=\"64\">"
	
	// loop on button
	
	ARRAY TEXT:C222($_buttons; 0)
	DOCUMENT LIST:C474($themesPath; $_buttons; Ignorer invisibles:K24:16)
	
	For ($i; 1; Size of array:C274($_buttons))
		
		$file:=File:C1566($themesPath+$_buttons{$i}; fk chemin plateforme:K87:2)
		
		$result:=$result+$a+Replace string:C233($theme.fullName; " "; "%20")+"/"+Replace string:C233($_buttons{$i}; " "; "%20")+$b+$file.name+$c+"\n"
		
	End for 
	
	SET TEXT TO PASTEBOARD:C523("<p float=\"left\">\n"+$result+"</p>")
	
	ALERT:C41("the end !")
	
End if 
