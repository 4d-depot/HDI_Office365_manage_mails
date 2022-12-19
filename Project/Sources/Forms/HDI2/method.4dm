Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Init
	: (FORM Event:C1606.code=On Page Change:K2:54)
		
		Case of 
			: (FORM Get current page:C276=1)
				InitVisibleObject(False:C215)
				
			Else 
				InitVisibleObject(True:C214)
				
		End case 
		
End case 

