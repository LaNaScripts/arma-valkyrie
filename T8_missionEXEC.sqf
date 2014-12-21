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

/*

// encounters
_AAF_encountersRural = [
	"v_grpAAF_basic"
];

_AAF_encountersUrban = [
	"v_grpAAF_basic"
];

*/

_AAF_encountersVR = [
"v_grpAAF_basic"
];

// behaviors
// eventually behaviors should be attached to specific unit roles
// based on current zone i.e. technical patrols will "patrol urban"
// near cities or "patrol around" a rural area but will never "defend"

/*

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

*/

vr_1 = [
	[[v_AAF_VR_entities, "vr_1", "v_grpAAF_basic"], ["LOITER"]],
	[[v_AAF_VR_entities, "vr_1", "v_grpAAF_basic"], ["LOITER"]],
	[[v_AAF_VR_entities, "vr_1", "v_grpAAF_basic"], ["LOITER"]],
	[[v_AAF_VR_entities, "vr_1", "v_grpAAF_basic"], ["LOITER"]]
];

[ "vr_1", "vr_1", "GUER", "WEST"] spawn T8U_fnc_Zone;

vr_2 = [
	[[v_AAF_VR_soldiers, "vr_2", "v_grpAAF_basic"], ["LOITER"]],
	[[v_AAF_VR_soldiers, "vr_2", "v_grpAAF_basic"], ["LOITER"]],
	[[v_AAF_VR_soldiers, "vr_2", "v_grpAAF_basic"], ["LOITER"]],
	[[v_AAF_VR_soldiers, "vr_2", "v_grpAAF_basic"], ["LOITER"]]
];

[ "vr_2", "vr_2", "GUER", "WEST"] spawn T8U_fnc_Zone;

/*

vr_1 = [
	[[v_AAF_VR_entities, "vr_1", (_AAF_encountersVR call BIS_fnc_selectRandom)], [(_behaviorsRural call BIS_fnc_selectRandom)]],
	[[v_AAF_VR_entities, "vr_1", (_AAF_encountersVR call BIS_fnc_selectRandom)], [(_behaviorsRural call BIS_fnc_selectRandom)]],
	[[v_AAF_sm_vehicle, "vr_1", false], ["PATROL_AROUND"]]
];

[ "vr_1", "vr_1", "EAST", "WEST"] spawn T8U_fnc_Zone;

*/
