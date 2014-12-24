/*
  about:
    - spawns a unit and instructs it to loiter near the player
    for a set amount of time
    - should act as a basis for other support functions
    - should return values of unit / group created so other waypoints can
      be assigned using the same variable

  params:
  - unit / vehicle type (no default)
  - target (object or marker, default = player)
  - side (default = side player)

  returns:
    _unitActual - unit created
    
  example:

    [_target, _side, _vehicle, engageTime] spawn v_spawnCAS;
    [player, WEST, "B_Plane_CAS_01_F", 45] spawn v_spawnCAS;

*/

private ["_target", "_side", "_type", "_timeout", "_unit", "_unitActual", "_unitGroup", "_origin", "_attackWP"];

_type = [_this, 0, "B_UAV_02_F"] call BIS_fnc_param; // class name of support to spawn
_targetRef = [_this, 1, player] call BIS_fnc_param; // object or marker to send the support towards
_side = [_this, 2, side player] call BIS_fnc_param; // side of spawned support
_distance = [_this, 3, 1000] call BIS_fnc_param; // distance from _targetRef to spawn support

// determine the target position + a random point of origin for the vehicle
_target = [position _targetRef, 50, 180] call BIS_fnc_relPos;
_origin = [position _targetRef, 1000, floor random 360] call BIS_fnc_relPos;

// create a new vehicle + crew
_unit = [_origin, 180, _type, _side] call BIS_fnc_spawnVehicle;

// TODO: should adjust spawn in height and test spawnVehicle versus KK's createVehicle from UAV PIP article

// get the vehicle and group returned by BIS_fnc_spawnVehicle
_unitActual = _unit select 0;
_unitGroup = _unit select 2;

// create the initial loiter waypoint near the player
// QUESTION: do I need to create a move waypoint first, then create a loiter WP?
_wp = _unitGroup addWaypoint [position player, 0]; // test this versus group _unit etc.
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointLoiterRadius 150; // test best radius

_unitActual
