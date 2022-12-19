var $office365 : cs:C1710.NetKit.Office365
var $status : Object
var $mail : Object
var $listID : Integer

ARRAY LONGINT:C221($arr; 0)

If (Form:C1466.trace)
	TRACE:C157
End if 

$listID:=Selected list items:C379(Form:C1466.folders.listRef; $arr; *)

// Search the folder information of the selected folder
Form:C1466.currentFolder:=Form:C1466.folders.search($listID)

// Creates a provider to send an email in Microsoft format
$office365:=cs:C1710.NetKit.Office365.new(Form:C1466.OAuth2Provider)

// Create draft email
$message:=New object:C1471
$message.subject:=String:C10(Form:C1466.draft.subject)

$message.body:=New object:C1471
$message.body.content:=String:C10(Form:C1466.draft.htmlBody)
$message.body.contentType:="html"

// Send the email
$status:=$office365.mail.append($message; Form:C1466.currentFolder#Null:C1517 ? String:C10(Form:C1466.currentFolder.id) : "drafts")

If ($status.success)
	ALERT:C41("Draft sent")
Else 
	ALERT:C41("Error: "+$status.statusText)
End if 