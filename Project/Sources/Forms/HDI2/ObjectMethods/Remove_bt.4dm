If (Form:C1466.mails.length>0)
	var $status : Object
	var $id : Text
	
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// id of the email selected in the listbox
	$id:=Form:C1466.mail.id
	
	// delete the email
	$status:=cs:C1710.NetKit.Office365.new(Form:C1466.OAuth2Provider).mail.delete($id)
	
	If ($status.success)
		// update the email list
		StartReceiving
		ALERT:C41("Email deleted")
	Else 
		ALERT:C41($status.statusText)
	End if 
	
End if 