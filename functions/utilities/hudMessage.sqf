disableSerialization;
cutRsc ["hudMessages","PLAIN"];

_amount = floor random 25;
_resource = "food";
_message = format ["+%1 %2 gathered", _amount, _resource];

waitUntil {!isNull (uiNameSpace getVariable "hudMessages")};
_display = uiNameSpace getVariable "hudMessages";
_setText = _display displayCtrl 1001;
_setText ctrlSetStructuredText (parseText _message);
