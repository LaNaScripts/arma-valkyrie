
// We dont want players here
waitUntil { !isNil "T8U_var_useHC" };
private [ "_exit" ]; _exit = false;
if ( T8U_var_useHC ) then { if ( isDedicated ) then { _exit = true; } else { waitUntil { !isNull player };	if ( hasInterface ) then { _exit = true; }; }; } else { if ( !isServer ) then { _exit = true; }; };
if ( _exit ) exitWith {};


// check if T8_Units is loaded
waitUntil { !isNil "T8U_var_InitDONE" };
sleep 5;

T8u_fnc_rmNVG_TEST = {
	_this spawn {
		sleep 5;

		private ["_i"];
		_i = true;

		switch ( side _this ) do {
			case WEST: { _this unlinkItem "NVGoggles"; };
			case EAST: { _this unlinkItem "NVGoggles_OPFOR"; };
			case RESISTANCE: { _this unlinkItem "NVGoggles_INDEP"; };
			default	{ _i = false; };
		};

		if ( _i ) then {
			_this removePrimaryWeaponItem "acc_pointer_IR";
			_this addPrimaryWeaponItem "acc_flashlight";

			sleep 1;

			group _this enableGunLights "forceon";
		};
	};
};

_groupArrayFireTeam = [
	"O_soldier_TL_F",
	"O_medic_F",
	"O_soldier_F",
	"O_soldier_AR_F"
];

_groupArrayFullTeam = [
	"O_soldier_TL_F",
	"O_medic_F",
	"O_soldier_F",
	"O_soldier_AR_F",
	"O_soldier_TL_F",
	"O_soldier_F",
	"O_soldier_F",
	"O_soldier_LAT_F"
];

_groupArrayMiniPat = [
	"O_soldier_TL_F",
	"O_medic_F",
	"O_soldier_F"
];

_groupArrayFullPat = [
	"O_soldier_SL_F",
	"O_medic_F",
	"O_soldier_F",
	"O_soldier_TL_F",
	"O_soldier_F",
	"O_soldier_AR_F"
];

_groupArrayIfritPat = [
	"O_MRAP_02_HMG_F",
	"O_MRAP_02_HMG_F"
];

_groupArrayTechnicalPat = [
	"O_G_Offroad_01_armed_F",
	"O_Truck_02_covered_F",
	"O_Truck_02_covered_F",
	"O_G_Offroad_01_armed_F"
];

_groupArrayW_APC = [
	"O_APC_WHEELED_02_RCWS_F"
];

_groupArrayT_APC = [
	"O_APC_Tracked_02_cannon_F"
];

_groupArraySniperTeam = [
	"O_sniper_F",
	"O_spotter_F"
];

_groupArrayGurTeam = [
	"I_soldier_TL_F",
	"I_medic_F",
	"I_soldier_F",
	"I_soldier_F",
	"I_soldier_F",
	"I_soldier_AR_F"
];

_groupArrayBluTeam = [
	"B_soldier_TL_F",
	"B_medic_F",
	"B_soldier_F",
	"B_soldier_F",
	"B_soldier_F",
	"B_soldier_AR_F"
];

_groupArrayCIV = [
	"C_man_1",
	"C_man_polo_1_F_asia",
	"C_man_1_1_F",
	"C_man_1_2_F",
	"C_man_1_3_F",
	"C_man_polo_1_F",
	"C_man_polo_2_F",
	"C_man_polo_3_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_6_F",
	"C_man_p_fugitive_F",
	"C_man_p_fugitive_F_afro",
	"C_man_p_fugitive_F_euro"
];


rural_1 = [
	[ [ _groupArraySniperTeam, "rural_1", "T8u_fnc_rmNVG_TEST" ], [ "OVERWATCH", "rural_1" ] ],
	[ [ _groupArrayFireTeam, "rural_1", "T8u_fnc_rmNVG_TEST" ], [ "PATROL_AROUND" ] ],
	[ [ _groupArrayTechnicalPat, "rural_1", false ], [ "PATROL_URBAN" ] ]
];

// [ _unitsArray, _marker, _owner, _actSide, _distance, _condition, _onAct, _onDeAct ] call T8U_fnc_Zone
[ "rural_1", "rural_1", "EAST", "WEST" ] spawn T8U_fnc_Zone;
