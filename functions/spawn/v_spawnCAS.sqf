/*

  params:
  - target
  - side
  - vehicle
  - engageTime
  example:

    [_target, _side, _vehicle, engageTime] spawn v_spawnCAS;
    [player, WEST, "B_Plane_CAS_01_F", 45] spawn v_spawnCAS;

*/

private [
  "_target",
  "_side",
  "_vehicle",
  "_engageTime",
  "_origin",
  "_unit",
  "_attackWP",
  "_leaveWP"
];

// "B_Heli_Attack_01_F"
// "B_Plane_CAS_01_F"

private ["_target", "_side", "_type", "_timeout", "_unitGroup","_unitOrigin","_unit","_attackWP"];

_target  = [position player, 50, 180] call BIS_fnc_relPos;
_side    = WEST;
_type    = "B_Heli_Attack_01_F";
_timeout = 10;

_unitGroup  = createGroup _side;
_unitOrigin = [_target, 1000, floor random 360] call BIS_fnc_relPos;
_unit       = [_unitOrigin, 180, _type, _unitGroup] call bis_fnc_spawnvehicle;

_attackWP = _unitGroup addWaypoint [_target, 0];
_attackWP setWaypointType "SAD";
_attackWP setWaypointCombatMode "RED";

//_leaveWP = _unitGroup addWaypoint [_unitOrigin, 0];
//_leaveWP setWaypointType "MOVE";
//_leaveWP setWaypointCombatMode "BLUE";
