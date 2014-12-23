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
_AAF_encountersVR = [
	"v_grpAAF_basic"
];

_AAF_encountersRural = [
	"v_grpAAF_basic"
];

_AAF_encountersUrban = [
	"v_grpAAF_basic"
];

// behaviors
// eventually behaviors should be attached to specific unit roles
// based on current zone i.e. technical patrols will "patrol urban"
// near cities or "patrol around" a rural area but will never "defend"

_behaviorsAll = [
	"PATROL",
	"PATROL_AROUND",
	"PATROL_URBAN",
	"PATROL_GARRISON",
	"GARRISON",
	"LOITER",
	"OVERWATCH",
	"DEFEND",
	"ATTACK"
];

_behaviorsRural = [
	"PATROL",
	"PATROL_AROUND",
	"OVERWATCH"
];

_behaviorsUrban = [
	"PATROL",
	"PATROL_AROUND",
	"PATROL_URBAN",
	"PATROL_GARRISON",
	"GARRISON",
	"LOITER"
];

// technical patrol test

RURAL_1 = [
	[[v_AAF_VR_technical, "RURAL_1", false, "GUER", "v_grpAAF_technical"], ["PATROL_AROUND"]]
];
["RURAL_1", "RURAL_1", "GUER", "WEST"] spawn T8U_fnc_Zone;

RURAL_2 = [
	[[v_AAF_VR_technical, "RURAL_2", false, "GUER", "v_grpAAF_technical"], ["PATROL_AROUND"]]
];
["RURAL_2", "RURAL_2", "GUER", "WEST"] spawn T8U_fnc_Zone;

VR_1 = [
	[[v_AAF_VR_entities, "vr_1", (_AAF_encountersVR call BIS_fnc_selectRandom)], [(_behaviorsRural call BIS_fnc_selectRandom)]]
];
[ "vr_1", "vr_1", "GUER", "WEST"] spawn T8U_fnc_Zone;
