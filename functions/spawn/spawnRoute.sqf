// Default usage:
// nul = ["MtvrSupply_DES_EP1", getMarkerPos "truckStart", 180, getMarkerPos "truckEnd"] execVM "runRoute.sqf";

// Useage with specific position instead of markers:
// nul = ["MtvrSupply_DES_EP1", [5053.31, 6821.45, 0], 270, [4680.65, 5793.69, 0]] execVM "runRoute.sqf";

// Optional usage as OPFOR truck (Default is WEST)
// nul = ["V3S_Open_TK_EP1", getMarkerPos "truckStart", 45, getMarkerPos "truckEnd", EAST] execVM "runRoute.sqf";

// Optional usage as truck driving FAST (Default is "LIMITED")
// nul = ["MtvrSupply_DES_EP1", getMarkerPos "truckStart", 90, getMarkerPos "truckEnd", WEST, "FAST"] execVM "runRoute.sqf";

//waituntil {!isnil "bis_fnc_init"}; // test if superfluous

_class    = _this select 0; // Vehicle class (string)
_origin   = _this select 1; // Spawning location (position)
_dir      = _this select 2; // Spawning azimuth (number)
_target   = _this select 3; // Destination location (position)

// refactor these to use BIS_fnc_param
_side     = if (count _this > 4) then {_this select 4} else {WEST}; // Group side (SIDE)
_speed    = if (count _this > 5) then {_this select 5} else {"LIMITED"}; // Waypoint speed (string)
_behavior = if (count _this > 6) then {_this select 6} else {"CARELESS"}; // Group behaviour (string)
_remDist  = if (count _this > 7) then {_this select 7} else {20}; // Distance from destination to delete (number)
_remWait  = if (count _this > 8) then {_this select 8} else {10}; // Delay after reaching destination to delete (number)

if (isServer) then {
  _sv = [_origin, _dir, _class, _side] call BIS_fnc_spawnVehicle;

  _svActual = _sv select 0;
  _svGroup = _sv select 2;
  _svGroup setBehaviour _behavior;

  _wp0 = _svGroup addwaypoint [_target, 0];
  _wp0 setwaypointtype "MOVE";
  _wp0 setWaypointSpeed _speed;

  waitUntil{_svActual distance _target < _remDist OR !canMove _svActual OR {alive _x} count crew _svActual == 0};
  sleep _remWait;
  {deleteVehicle _x} forEach crew _svActual; // test if superfluous
  deletevehicle _svActual; // test if superfluous
  {deleteVehicle _x} forEach units _svGroup;
  deleteGroup _svGroup; // test if superfluous
  {deleteVehicle _x} forEach crew _svActual + [_svActual]; // this may be more elegant?
};
