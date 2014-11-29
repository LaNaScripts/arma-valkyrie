/*
 =======================================================================================================================

	___ T8 Units _______________________________________________________________________________________________________

	File:		T8_missionEXEC.sqf
	Author:		T-800a
	E-Mail:		t-800a@gmx.net

	This file creates the Units, kind of


	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to
	Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

 =======================================================================================================================
*/

// We dont want players here
waitUntil { !isNil "T8U_var_useHC" };
private [
	"_exit",
	"_markersList",
	"_encounter",
	"_behavior",
	"_fireTeam",
	"_sentryPatrol",
	"_fullPatrol",
	"_sniperTeam",
	"_technicalPatrol"
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

_fireTeam = [
	"O_soldier_TL_F",
	"O_medic_F",
	"O_soldier_F",
	"O_soldier_AR_F"
];

_sentryPatrol = [
	"O_soldier_TL_F",
	"O_medic_F",
	"O_soldier_F"
];

_fullPatrol = [
	"O_soldier_SL_F",
	"O_medic_F",
	"O_soldier_F",
	"O_soldier_TL_F",
	"O_soldier_F",
	"O_soldier_AR_F"
];

_sniperTeam = [
	"O_sniper_F",
	"O_spotter_F"
];

_technicalPatrol = [
	"O_G_Offroad_01_armed_F",
	"O_G_Offroad_01_F"
];

/*
_markers = [
	"mkr_1",
];
*/

_encounter = [
	_fireTeam,
	_sentryPatrol,
	_fullPatrol,
	_sniperTeam,
	_technicalPatrol
];

_behavior = [
	["PATROL"],
	["PATROL_URBAN"],
	["PATROL_AROUND"],
	["PATROL_GARRISON"]
	//["GARRISON"],
	//["DEFEND"],
	//["LOITER"]
	//["OVERWATCH", _closestMkr ],
	//["ATTACK", _nextClosestMkr]
];

// testing this to implement a smart overwatch behavior
// _closestMkr = [_markers, _this] call BIS_fnc_nearestPosition;
// _nextClosestMkr = [_markers, _this] call BIS_fnc_nearestPosition;

SpawnZone1 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_1", false], (_behavior call BIS_fnc_selectRandom)]
];
["SpawnZone1", "mkr_1", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 3;
for "_i" from 0 to _rand do {
	["mkr_1"] call spawnVehicle;
};

SpawnZone2 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_2", false], (_behavior call BIS_fnc_selectRandom)]
];
["SpawnZone2", "mkr_2", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 3;
for "_i" from 0 to _rand do {
	["mkr_2"] call spawnVehicle;
};

SpawnZone3 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_3", false], (_behavior call BIS_fnc_selectRandom)]
];
["SpawnZone3", "mkr_3", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 3;
for "_i" from 0 to _rand do {
	["mkr_3"] call spawnVehicle;
};

SpawnZone4 = [
	[[(_encounter call BIS_fnc_selectRandom), "mkr_4", false], (_behavior call BIS_fnc_selectRandom)]
];
["SpawnZone4", "mkr_4", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 3;
for "_i" from 0 to _rand do {
	["mkr_4"] call spawnVehicle;
};

SpawnZone5 = [
	[ [ (_encounter call BIS_fnc_selectRandom), "mkr_5", false ], (_behavior call BIS_fnc_selectRandom)]
];
["SpawnZone5", "mkr_5", "EAST", "ANY", 700] spawn T8U_fnc_Zone;

_rand = floor random 3;
for "_i" from 0 to _rand do {
	["mkr_5"] call spawnVehicle;
};
