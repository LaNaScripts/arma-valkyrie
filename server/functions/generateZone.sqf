/*

	author:		   T-800a
	file:		     T8_missionEXEC.sqf
	description: This file creates the Units, kind of
	license:     Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

*/

waitUntil {!isNil "T8U_var_useHC"};
private [
	"_exit",
	"_encounter",
	"_markerList",
	"_rolesList",
	"_behavior",
	"_nearestMarker",
	"_randomMarker"
];

_exit = false;
if (T8U_var_useHC) then {
	if (isDedicated) then {
		_exit = true;
	} else {
		waitUntil {!isNull player};

		if (hasInterface) then {
			_exit = true;
		};
	};
} else {
	if (!isServer) then {
		_exit = true;
	};
};

if (_exit) exitWith {};

// check if T8_Units is loaded
waitUntil {!isNil "T8U_var_InitDONE"};
sleep 5;

_encounter = [
	[
		"O_Soldier_AT_F",
		"O_engineer_F",
		"O_medic_F",
		"O_Soldier_AR_F",
		"O_Soldier_lite_F"
	]
];

// randomly set behavior of ai on spawn
//_nearestMarker = [_marker, _markerList] call getNearestMarker;
//_randomMarker = [_marker, _markerList] call getRandomMarker;

// temporary
_markerList = [
	"mkr_1",
	"mkr_2",
	"mkr_3",
	"mkr_4",
	"mkr_5"
];

// also temporary
_nearestMarker = _markerList call BIS_fnc_selectRandom;
_randomMarker  = _markerList call BIS_fnc_selectRandom;

_behavior = [
	["PATROL"],
	["PATROL_URBAN"],
	["PATROL_AROUND"],
	["PATROL_GARRISON"],
	//["GARRISON"],
	//["DEFEND"], // possibly causing problems
	//["LOITER"],
	["OVERWATCH", (_nearestMarker)], // overwatch nearest marker to unit
	["ATTACK", (_randomMarker)]      // could be _randomMarker or _nextNearestMarker
];

SpawnZone1 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_1", false, EAST, "generateLoadout"], (_behavior call BIS_fnc_selectRandom)]
];

["SpawnZone1", "mkr_1", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 2;
for "_i" from 0 to _rand do {
	["mkr_1"] call generateVehicle;
};

SpawnZone2 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_2", false, EAST, "generateLoadout"], (_behavior call BIS_fnc_selectRandom)]
];

["SpawnZone2", "mkr_2", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 2;
for "_i" from 0 to _rand do {
	["mkr_2"] call generateVehicle;
};

SpawnZone3 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_3", false, EAST, "generateLoadout"], (_behavior call BIS_fnc_selectRandom)]
];

["SpawnZone3", "mkr_3", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 2;
for "_i" from 0 to _rand do {
	["mkr_3"] call generateVehicle;
};

SpawnZone4 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_4", false, EAST, "generateLoadout"], (_behavior call BIS_fnc_selectRandom)]
];

["SpawnZone4", "mkr_4", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 2;
for "_i" from 0 to _rand do {
	["mkr_4"] call generateVehicle;
};

SpawnZone5 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_5", false, EAST, "generateLoadout"], (_behavior call BIS_fnc_selectRandom)]
];

["SpawnZone5", "mkr_5", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 2;
for "_i" from 0 to _rand do {
	["mkr_5"] call generateVehicle;
};
