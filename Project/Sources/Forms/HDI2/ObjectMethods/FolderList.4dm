Case of 
	: (FORM Event:C1606.code=On Selection Change:K2:29)
		
		// init attachments list
		Form:C1466.attachments:=New object:C1471
		// disable the dropdown list 
		OBJECT SET ENABLED:C1123(*; "attachment_DropdownList"; False:C215)
		// disable the download button 
		OBJECT SET ENABLED:C1123(*; "attachment_Button"; False:C215)
		
		// Emails downloading
		StartReceiving
		
	: (FORM Event:C1606.code=On Drop:K2:12)
		If (Form:C1466.trace)
			TRACE:C157
		End if 
		If (Form:C1466.mails.length>0)
			var $destinationMailbox; $status : Object
			var $id : Text
			
			// search the box information of the destination box
			$destinationMailbox:=FindDestinationMailBox
			
			// ids of the email to copy
			$id:=Form:C1466.mail.id
			
			If ($destinationMailbox#Null:C1517)
				If (Form:C1466.copy)
					// copy emails from selected mailbox to destination mailbox
					$status:=cs:C1710.NetKit.Office365.new(Form:C1466.OAuth2Provider).mail.copy($id; $destinationMailbox.id)
				Else 
					// move emails from selected mailbox to destination mailbox
					$status:=cs:C1710.NetKit.Office365.new(Form:C1466.OAuth2Provider).mail.move($id; $destinationMailbox.id)
					
				End if 
				
				If ($status.success)
					var $listID : Integer
					ARRAY INTEGER:C220($arr; 0)
					//  update the email of the selected mailbox
					StartReceiving
					$listID:=Selected list items:C379(Form:C1466.folders.listRef; $arr; *)
					OBJECT SET VISIBLE:C603(*; "Spinner1"; True:C214)
					// Start the creation of the folder list
					CALL WORKER:C1389("myWorker"; Formula:C1597(GetFolders); Form:C1466.OAuth2Provider; Current form window:C827)
				Else 
					ALERT:C41($status.statusText)
				End if 
				
			End if 
		End if 
		
End case 