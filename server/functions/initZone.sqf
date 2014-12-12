/*

	File:		T8_missionEXEC.sqf
	Author:		T-800a
	E-Mail:		t-800a@gmx.net
	
*/

// We dont want players here
waitUntil { !isNil "T8U_var_useHC" };
private [ "_exit" ]; _exit = false;
if ( T8U_var_useHC ) then { if ( isDedicated ) then { _exit = true; } else { waitUntil { !isNull player };	if ( hasInterface ) then { _exit = true; }; }; } else { if ( !isServer ) then { _exit = true; }; };
if ( _exit ) exitWith {};


// check if T8_Units is loaded
waitUntil { !isNil "T8U_var_InitDONE" };
sleep 5;

T8u_fnc_rmNVG_TEST =
{
	_this spawn
	{
		sleep 5;

		private ["_i"];
		_i = true;
		switch ( side _this ) do
		{
			case WEST:			{ _this unlinkItem "NVGoggles"; };
			case EAST:			{ _this unlinkItem "NVGoggles_OPFOR"; };
			case RESISTANCE:	{ _this unlinkItem "NVGoggles_INDEP";  };
			default				{ _i = false; };
		};

		if ( _i ) then
		{
			_this removePrimaryWeaponItem "acc_pointer_IR";
			_this addPrimaryWeaponItem "acc_flashlight";

			sleep 1;

			group _this enableGunLights "forceon";
		};
	};
};

// Pre-defined Arrays for Groups ( group setup )
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

_groupArrayConvoy = [
	"O_G_Offroad_01_armed_F",
	"O_Truck_02_covered_F",
	"O_Truck_02_covered_F",
	"O_G_Offroad_01_armed_F"
];

_groupArrayTechnicalPatrol = [
	"O_G_Offroad_01_armed_F",
	"O_G_Offroad_01_armed_F"
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

_randomGroup = [
	_groupArrayFireTeam,
	_groupArrayFullTeam,
	_groupArrayMiniPat,
	_groupArrayFullPat,
	_groupArrayConvoy,
	_groupArrayTechnicalPatrol,
	_groupArraySniperTeam,
	_groupArrayGurTeam,
	_groupArrayBluTeam,
	_groupArrayCIV
];

_behavior = [
	"PATROL",
	"PATROL_AROUND",
	"OVERWATCH"
];

T8U_var_SupportUnitsEAST = [_groupArrayFireTeam, _groupArrayFireTeam];
T8U_var_SupportUnitsWEST = [];
T8U_var_SupportUnitsRESISTANCE = [];

// turn these into a function
mkr_1 = [
	[[
	(_randomGroup call BIS_fnc_selectRandom), "mkr_1", "T8u_fnc_rmNVG_TEST"],
	[if ((str _behavior) == (str "OVERWATCH")) then {
		(_behavior call BIS_fnc_selectRandom), "mkr_1"
		} else {
			_behavior call BIS_fnc_selectRandom
		}
	]]
];
["mkr_1", "mkr_1", "EAST", "WEST"] spawn T8U_fnc_Zone;


mkr_2 =
[
	[[_randomGroup, "mkr_2", "T8u_fnc_rmNVG_TEST"], [_behavior]]
];
["mkr_2", "mkr_2", "EAST", "WEST"] spawn T8U_fnc_Zone;

mkr_3 = [
	[[_randomGroup, "mkr_3", "T8u_fnc_rmNVG_TEST"], [_behavior]]
];
["mkr_3", "mkr_3", "EAST", "WEST"] spawn T8U_fnc_Zone;

rural_1 = [[_groupArrayConvoy, "rural_1"], ["PATROL"]];
["rural_1", "rural_1", "EAST", "WEST"] spawn T8U_fnc_Zone;

rural_2 = [[_groupArrayConvoy, "rural_2"], ["PATROL"]];
["rural_2", "rural_2", "EAST", "WEST"] spawn T8U_fnc_Zone;
