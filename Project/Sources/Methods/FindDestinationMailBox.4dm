//%attributes = {}
#DECLARE : Object
// Determines the destination mailbox where the email must be copy / move
var $itemID; $itemPos : Integer
var $itemName : Text

// Position of the mailbox in the list box
$itemPos:=Drop position:C608

GET LIST ITEM:C378(Form:C1466.folders.listRef; $itemPos; $itemID; $itemName)

// search the box information of the destination box
return Form:C1466.folders.search($itemID)