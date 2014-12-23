//////////////////////////////////////////////////////////////////
// Function file for ArmA 2: Operation Arrowhead
// Created by: kylania
//////////////////////////////////////////////////////////////////

// Default usage:
// nul = ["MtvrSupply_DES_EP1", getMarkerPos "truckStart", 180, getMarkerPos "truckEnd"] execVM "runRoute.sqf";

// Useage with specific position instead of markers:
// nul = ["MtvrSupply_DES_EP1", [5053.31, 6821.45, 0], 270, [4680.65, 5793.69, 0]] execVM "runRoute.sqf";

// Optional usage as OPFOR truck (Default is WEST)
// nul = ["V3S_Open_TK_EP1", getMarkerPos "truckStart", 45, getMarkerPos "truckEnd", EAST] execVM "runRoute.sqf";

// Optional usage as truck driving FAST (Default is "LIMITED")
// nul = ["MtvrSupply_DES_EP1", getMarkerPos "truckStart", 90, getMarkerPos "truckEnd", WEST, "FAST"] execVM "runRoute.sqf";

// Optional usage as truck driving FAST and DANGER (Default is "CARELESS")
// nul = ["MtvrSupply_DES_EP1", getMarkerPos "truckStart", 60, getMarkerPos "truckEnd", WEST, "FAST", "DANGER"] execVM "runRoute.sqf";

// Optional usage as helicopter flying FAST and DANGER deleted 300 meters from it's waypoint. (Default is 20)
// nul = ["Mi17_UN_CDF_EP1", [getMarkerPos "hStart" select 0, getMarkerPos "hStart" select 1, 100], 330, getMarkerPos "hEnd", WEST, "FAST", "DANGER", 300] execVM "runRoute.sqf";

// Optional usage as helicopter flying FAST and DANGER deleted 300 meters from it's waypoint after 60 seconds. (Default is 10)
// nul = ["Mi17_UN_CDF_EP1", [getMarkerPos "hStart" select 0, getMarkerPos "hStart" select 1, 100], 330, getMarkerPos "hEnd", WEST, "FAST", "DANGER", 300, 60] execVM "runRoute.sqf";

// start: [5053.31,6821.45,0.00158691] - 234.173
// end: [4680.65,5793.69,0.00169373] - 76.2395

// Wait till the Functions module is ready.
waituntil {!isnil "bis_fnc_init"};

_vehClass = _this select 0; // Vehicle class (string)
_spawnPos = _this select 1; // Spawning location (position)
_spawnDir = _this select 2; // Spawning azimuth (number)
_destPos = _this select 3; // Destination location (position)
_vehSide = if (count _this > 4) then {_this select 4} else {WEST}; // Group side (SIDE)
_driveSpeed = if (count _this > 5) then {_this select 5} else {"LIMITED"}; // Waypoint speed (string)
_driveBehaviour = if (count _this > 6) then {_this select 6} else {"CARELESS"}; // Group behaviour (string)
_destructionDistance = if (count _this > 7) then {_this select 7} else {20}; // Distance from destination to delete (number)
_destructionDelay = if (count _this > 8) then {_this select 8} else {10}; // Delay in seconds after reaching destination to delete (number)

if (isServer) then {
  // Spawn the vehicle.  Make sure the Functions Module is on map.
  _sv = [_spawnPos, _spawnDir, _vehClass, _vehSide] call BIS_fnc_spawnVehicle;

  // Name the vehicle and group and set them to careless.
  _svActual = _sv select 0; // vehicle spawned.
  _svGroup = _sv select 2; // group of vehicle so waypoints work.
  _svGroup setBehaviour _driveBehaviour; // Make sure they don't get distracted.

  // Give the vehicle a waypoint to where the player is and make drive there.
  _wp0 = _svGroup addwaypoint [_destPos, 0];
  _wp0 setwaypointtype "MOVE";
  _wp0 setWaypointSpeed _driveSpeed;

  // Once you're within set distance of the waypoint (or destroyed/damaged), delete the vehicle and group members if still there.
  waitUntil{_svActual distance _destPos < _destructionDistance OR !canMove _svActual OR {alive _x} count crew _svActual == 0};
  sleep _destructionDelay;
  {deleteVehicle _x} forEach crew _svActual;
  deletevehicle _svActual;
  {deleteVehicle _x} forEach units _svGroup;  // If anyone got out of the vehicle, delete them too.
  deleteGroup _svGroup;  // Free up the group slot.
};
