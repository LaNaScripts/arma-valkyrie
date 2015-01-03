/*

  about: creates a random resource object at the location


*/

/*

_object = [_this, 0, objNull] call BIS_fnc_param;

#include "objectResources";

// determine resource type based on the object class
call {
// find object in array of objects that contain that resource
if _object in "" exitWith {_resource = "metal"}; // tools, weapons, & subcomponents
if _object in "" exitWith {_resource = "materials"}; // buildings
if _object in "" exitWith {_resource = "chemicals"}; // explosives, medkits, poisons
if _object in "" exitWith {_resource = "cloth"}; // clothing + subcomponents
if _object in "" exitWith {_resource = "food"}; // basic
if _object in "" exitWith {_resource = "water"}; // basic
if _object in "" exitWith {_resource = "intel"}; // research
if _object in "" exitWith {_resource = "mechanisms"}; // guns, traps
if _object in "" exitWith {_resource = "parts"}; // subcomponents
};

_actionTitle = format ["%1 %2", _action, _resource];
_command = format ["gather_%1", _resource];

// add harvest action to object
_this addAction [str _actionTitle, _command];

// add glow affect to item to mark it as interactive
// need to use addObjectMaterial
//emmisive[] = {33500, 390, 38, 1};
