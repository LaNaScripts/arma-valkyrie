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

    TODO: should adjust spawn in height and test spawnVehicle versus KK's createVehicle from UAV PIP article
    QUESTION: do I need to create a move waypoint first, then create a loiter WP?
*/

private ["_target", "_side", "_type", "_timeout", "_unit", "_unitActual", "_unitGroup", "_origin", "_attackWP"];

_type = [_this, 0, "B_UAV_02_F", ""] call BIS_fnc_param;
_targetRef = [_this, 1, player, objNull] call BIS_fnc_param;
_side = side player;
_distance = [_this, 3, 1000, 0] call BIS_fnc_param;

_target = [_targetRef, 50, 180] call BIS_fnc_relPos;
_origin = [_targetRef, 1000, (floor random 360)] call BIS_fnc_relPos;

_unit = [_origin, 180, _type, _side] call BIS_fnc_spawnVehicle;

_unitActual = _unit select 0;
_unitGroup = _unit select 2;

_wp = _unitGroup addWaypoint [position player, 0];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointLoiterRadius 100;

_unitActual
