waitUntil {!isNil "T8U_var_useHC"};

private ["_exit"];

_exit = false;
if (T8U_var_useHC) then {
	if (isDedicated) then {
		_exit = true;
	} else {
		waitUntil {!isNull player};	if (hasInterface) then {
			_exit = true;
		};
	};
} else {
	if (!isServer) then {
		_exit = true;
	};
};

if (_exit) exitWith {};

waitUntil {!isNil "T8U_var_InitDONE"};
sleep 5;

// encounters
_encountersRural = [
	"v_grpEA_basic",
	"v_grpEA_vassals"
];

_encountersUrban = [
	"v_grpEA_basic",
	"v_grpEA_vassals"
];

// behaviors
// eventually behaviors should be attached to specific unit roles
// based on current zone i.e. technical patrols will "patrol urban"
// near cities or "patrol around" a rural area but will never "defend"

_behaviorsRural = [
	"PATROL",
	"PATROL_AROUND",
	"OVERWATCH"
];

_behaviorsUrban = [
	"PATROL",
	"PATROL_URBAN",
	"PATROL_GARRISON",
	"GARRISON",
	"LOITER",
	"PATROL_AROUND"
];

rural_1 = [
	[[v_groupFireTeam, "rural_1", (_encountersRural call BIS_fnc_selectRandom)], [(_behaviorsRural call BIS_fnc_selectRandom)]],
	[[v_groupFireTeam, "rural_1", (_encountersRural call BIS_fnc_selectRandom)], [(_behaviorsRural call BIS_fnc_selectRandom)]],
	[[v_groupTechnicalPat, "rural_1", false], ["PATROL_AROUND"]]
];

[ "rural_1", "rural_1", "EAST", "WEST"] spawn T8U_fnc_Zone;

rural_2 = [
	[[v_groupFireTeam, "rural_2", (_encountersRural call BIS_fnc_selectRandom)], [(_behaviorsRural call BIS_fnc_selectRandom)]],
	[[v_groupMarksmen, "rural_2", ""], ["OVERWATCH"]]
];

[ "rural_2", "rural_2", "EAST", "WEST"] spawn T8U_fnc_Zone;

urban_1 = [
	[[v_groupFireTeam, "urban_1", (_encountersUrban call BIS_fnc_selectRandom)], [(_behaviorsUrban call BIS_fnc_selectRandom)]],
	[[v_groupFireTeam, "urban_1", (_encountersUrban call BIS_fnc_selectRandom)], [(_behaviorsUrban call BIS_fnc_selectRandom)]],
	[[v_groupTechnicalPat, "urban_1", false ], ["PATROL_URBAN"]]
];

[ "urban_1", "urban_1", "EAST", "WEST"] spawn T8U_fnc_Zone;
