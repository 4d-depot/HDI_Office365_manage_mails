
If (FORM Event:C1606.code=On Clicked:K2:4)
	// init attachments list
	Form:C1466.attachments:=New object:C1471
	// disable the dropdown list 
	OBJECT SET ENABLED:C1123(*; "attachment_DropdownList"; False:C215)
	// disable the download button 
	OBJECT SET ENABLED:C1123(*; "attachment_Button"; False:C215)
	
	
	StartReceiving
End if 