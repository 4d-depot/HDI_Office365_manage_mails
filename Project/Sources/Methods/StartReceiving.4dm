//%attributes = {}
// Start receiving of the mail list according to the number of mail defined by Form.numberMails
var $listID : Integer
var $param : Object

ARRAY LONGINT:C221($arr; 0)

If (Is a list:C621(Form:C1466.folders.listRef))
	$listID:=Selected list items:C379(Form:C1466.folders.listRef; $arr; *)
	
	// Search the folder information of the selected folder
	Form:C1466.currentFolder:=Form:C1466.folders.search($listID)
	
	If (Form:C1466.currentFolder#Null:C1517)
		// Reset the mail list
		Form:C1466.mails:=New collection:C1472
		
		WA SET PAGE CONTENT:C1037(*; "web area"; "<html></html>"; "file:///")
		
		OBJECT SET VISIBLE:C603(*; "Spinner"; True:C214)
		
		// getMails paramters
		$param:=New object:C1471()
		// folder containing the emails
		$param.folderId:=Form:C1466.currentFolder.id
		// Number emails returned by the server
		$param.top:=Form:C1466.numberMails
		// Attributs of the emails returned by the server
		$param.select:="subject,from,isDraft,receivedDateTime"
		
		// Start the downoad of the emails
		CALL WORKER:C1389("myMailWorker"; Formula:C1597(GetMails); Form:C1466.OAuth2Provider; $param; Current form window:C827)
	End if 
End if 