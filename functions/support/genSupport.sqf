/*

  about:

    - gather: send a civilian work team to gather resources from location
    - transport: provide a small, medium, or large ground transport to a location
    - overwatch: request overwatch from a nearby recon team
    - interdiction: deploy resources to neutralize enemy reinforcements en-route to a location
    - supplies: airlift a small, medium, or large cache of supplies to a location
    - escort: provide heavy weapons PCAS escort to a location
    - airlift: provide a small, medium, or large air transport to a location
    - recon: provide a high-level view of the area, marking all threats
    - trap: place traps and obstacles to create chokepoints at a location
    - cas: deliver close air support at the location
    - sabotage: deliver an infiltration team to disable key enemy infrastructure at a location

  params:

    class  - cfgVehicles class
    target - target area for support
    side   - side requesting support
    type   - type of support to provide

  returns:

    _unitActual - unit created

  example:

    [_target, _side, _vehicle, engageTime] spawn v_spawnCAS;
    [player, WEST, "B_Plane_CAS_01_F", 45] spawn v_spawnCAS;

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
