//%attributes = {}
Form:C1466.mail:=New object:C1471

Form:C1466.numberMails:=10

Form:C1466.spinner:=1

ARRAY TEXT:C222(Attachments; 0)

Form:C1466.mails:=New collection:C1472
Form:C1466.folders:=New object:C1471
Form:C1466.copy:=True:C214
Form:C1466.draft:=New object:C1471
Form:C1466.replyComment:="Thank you for your email!"
Form:C1466.currentFolder:=New object:C1471

OBJECT SET ENABLED:C1123(*; "attachment_DropdownList"; False:C215)
OBJECT SET ENABLED:C1123(*; "attachment_Button"; False:C215)

InitVisibleObject(False:C215)
ButtonState(False:C215)

