//%attributes = {}
#DECLARE($OAuth2Provider : cs:C1710.NetKit.OAuth2Provider; $winRef : Integer)
// Get the folder information and display it
var $folders : cs:C1710.Folders

$folders:=cs:C1710.Folders.new($OAuth2Provider)

// Download and display the folder list
$folders.createList()

// Save the OAuth2Provider with the updated token in the main process
CALL FORM:C1391($winRef; Formula:C1597(Form:C1466.OAuth2Provider:=$OAuth2Provider))
// Set the folder list in the main process
CALL FORM:C1391($winRef; Formula:C1597(Form:C1466.folders:=$folders))

// Hide the spinner
CALL FORM:C1391($winRef; Formula:C1597(OBJECT SET VISIBLE:C603(*; "Spinner1"; False:C215)))
// Enable buttons
CALL FORM:C1391($winRef; Formula:C1597(ButtonState(True:C214)))