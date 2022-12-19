var $reply; $status : Object

If (Form:C1466.mailToReply.isDraft)
	ALERT:C41("You cannot reply to a draft")
	return 
End if 

CONFIRM:C162("Would you reply to the email:\n\n"+Form:C1466.mailToReply.subject+"\n\nFrom: "+DisplayEmailAddresses(Form:C1466.mailToReply; "from"))

If (Bool:C1537(OK))
	$reply:=New object:C1471
	$reply.comment:=String:C10(Form:C1466.replyComment)
	
	// Reply to the email selected with $reply.comment as body
	$status:=cs:C1710.NetKit.Office365.new(Form:C1466.OAuth2Provider).mail.reply($reply; Form:C1466.mailToReply.id)
	If ($status.success)
		ALERT:C41("Reply sent")
	Else 
		ALERT:C41("Error: "+$status.statusText)
	End if 
End if 