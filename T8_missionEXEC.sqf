
// We dont want players here
waitUntil { !isNil "T8U_var_useHC" };
private [ "_exit" ]; _exit = false;
if ( T8U_var_useHC ) then { if ( isDedicated ) then { _exit = true; } else { waitUntil { !isNull player };	if ( hasInterface ) then { _exit = true; }; }; } else { if ( !isServer ) then { _exit = true; }; };
if ( _exit ) exitWith {};


// check if T8_Units is loaded
waitUntil { !isNil "T8U_var_InitDONE" };
sleep 5;

v_grpEA_basic = {

	_this spawn {

		private [
			"_SMG",
			"_carbine",
			"_LMG",
			"_vestLight",
			"_vestMedium",
			"_vestHeavy",
			"_uniformEA_basic",
			"_uniformEA_urban",
			"_uniformEA_engineer",
			"_backpackSmall",
			"_backpackMedium",
			"_backpackLarge",
			"_backpackHuge",
			"_backpackDrone",
			"_mask",
			"_shemag",
			"_helmet",
			"_randWeapon",
			"_weapon",
			"_randHeadgear",
			"_mask",
			"_randVest",
			"_vest",
			"_randUniform",
			"_uniform",
			"_randBackpack",
			"_backpack"
		];

		removeHeadgear _this;
		removeGoggles _this;
		removeVest _this;
		removeBackpack _this;
		removeUniform _this;
		removeAllWeapons _this;
		removeAllAssignedItems _this;

		_SMG = [
			"SMG_01_F",
			"SMG_02_F",
			"hgun_PDW2000_F"
		];

		_carbine = [
			"arifle_MXC_F"
		];

		_LMG = [
			"arifle_MX_SW_F",
			"LMG_Mk200_F"
		];

		/*

		_goggles = [

		];

		*/

		_vestLight = [
			"V_HarnessO_brn",
			"V_HarnessOGL_brn",
			"V_HarnessO_gry",
			"V_HarnessOGL_gry",
			"V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry"
		];

		_vestMedium = [
			"V_TacVest_blk",
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_oli"
		];

		_vestHeavy = [
			"V_PlateCarrier1_blk",
			"V_PlateCarrier_Kerry",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierIAGL_dgtl",
			"V_I_G_resistanceLeader_F",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIA1_dgtl"
		];

		_uniformEA_basic  = [
			"U_O_CombatUniform_ocamo",
			"U_O_SpecopsUniform_ocamo"
		];

		_uniformEA_urban  = [
			"U_O_CombatUniform_oucamo"
		];

		_uniformEA_engineer  = [
			"U_B_PilotCoveralls",
			"U_I_pilotCoveralls",
			"U_O_CombatUniform_oucamo"
		];

		_backpackSmall = [
			"B_AssaultPack_Base",
			"B_AssaultPack_khk",
			"B_AssaultPack_dgtl",
			"B_AssaultPack_rgr",
			"B_AssaultPack_sgg",
			"B_AssaultPack_blk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_ocamo"
		];

		_backpackMedium = [
			"B_TacticalPack_Base",
			"B_TacticalPack_rgr",
			"B_TacticalPack_mcamo",
			"B_TacticalPack_ocamo",
			"B_TacticalPack_blk",
			"B_TacticalPack_oli"
		];

		_backpackLarge = [
			"B_FieldPack_Base",
			"B_FieldPack_khk",
			"B_FieldPack_ocamo",
			"B_FieldPack_oucamo",
			"B_FieldPack_cbr",
			"B_FieldPack_blk"
		];

		/*

		_backpackHuge = [

		];

		_backpackDrone = [

		];

		*/

		_balaclava = [
			"Kio_Balaclava_blk",
			"Kio_Balaclava_blkSkull",
			"Kio_Balaclava_grn",
			"Kio_Balaclava_des",
			"Kio_Balaclava_multicam",
			"Kio_Balaclava_hex",
			"Kio_Balaclava_wcam",
			"Kio_Balaclava_urbcam"
		];

		_shemag = [
			"H_Shemag_khk",
			"H_Shemag_tan",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_ShemagOpen_tan",
			"H_ShemagOpen_khk"
		];

		_helmet = [
			"H_HelmetO_ocamo",
			"H_HelmetLeaderO_ocamo"
		];

		// determine weapon
		_randWeapon = floor random 100;

		call {
		if (_randWeapon > 90) exitWith {_weapon = _LMG};
		if (_randWeapon > 60) exitWith {_weapon = _Carbine};
		_weapon = _SMG;
		};

		// assign weapon
		if (count _weapon > 0) then {_this addWeapon (_weapon call BIS_fnc_selectRandom);};

		// determine headgear combination
		_randHeadgear = floor random 3;

		switch (_randHeadgear) do {
			case 0: {
				if (count _shemag > 0) then {_this addHeadgear (_shemag call BIS_fnc_selectRandom);};
			};

			case 1: {
				if (count _helmet > 0) then {_this addHeadgear (_helmet call BIS_fnc_selectRandom);};
				if (count _balaclava > 0) then {

					_mask = _balaclava call BIS_fnc_selectRandom;
					_this linkItem _mask;
				};
			};

			case 2: {
				if (count _balaclava > 0) then {

					_mask = _balaclava call BIS_fnc_selectRandom;
					_this linkItem _mask;
				};
			};
		};

		//if (count _goggles > 0) then {_this addGoggles (_goggles call BIS_fnc_selectRandom);};

		// determine vest
		_randVest = floor random 100;

		call {
			if (_randVest > 90) exitWith {_vest = _vestHeavy};
			if (_randVest > 60) exitWith {_vest = _vestMedium};
			if (_randVest > 35) exitWith {_vest = _vestLight};
			_vest = [];
		};

		// assign vest
		if (count _vest > 0) then {_this addVest (_vest call BIS_fnc_selectRandom);};

		// determine uniform
		_randUniform = floor random 100;

		call {
			if (_randUniform > 0) exitWith {_uniform = _uniformEA_basic};
			//if (_randUniform > 60) exitWith {_uniform = _uniformEA_urban};
			//if (_randUniform > 35) exitWith {_uniform = _uniformEA_engineer};
			_uniform = [];
		};

		// assign uniform
		if (count _uniform > 0) then {_this addUniform (_uniform call BIS_fnc_selectRandom);};

		// determine backpack
		_randBackpack = floor random 100;

		call {
			//if (_randBackpack > 95) exitWith {_backpack = _backpackDrone};
			//if (_randBackpack > 95) exitWith {_backpack = _backpackHuge};
			if (_randBackpack > 90) exitWith {_backpack = _backpackLarge};
			if (_randBackpack > 80) exitWith {_backpack = _backpackMedium};
			if (_randBackpack > 70) exitWith {_backpack = _backpackSmall};
			_backpack = [];
		};

		// assign backpack
		if (count _backpack > 0) then {_this addBackpack (_backpack call BIS_fnc_selectRandom);};

		//_this spawn resetAmmo;

	};
};

/*

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

*/

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
	//[ [ _groupArraySniperTeam, "rural_1", "" ], [ "OVERWATCH", "rural_1" ] ],
	[ [ _groupArrayMiniPat, "rural_1", "v_grpEA_Basic" ], [ "PATROL" ] ],
	[ [ _groupArrayFireTeam, "rural_1", "v_grpEA_Basic" ], [ "PATROL" ] ],
	[ [ _groupArrayMiniPat, "rural_1", "v_grpEA_Basic" ], [ "PATROL" ] ],
	[ [ _groupArrayFireTeam, "rural_1", "v_grpEA_Basic" ], [ "PATROL" ] ],
	[ [ _groupArrayMiniPat, "rural_1", "v_grpEA_Basic" ], [ "PATROL" ] ],
	[ [ _groupArrayFireTeam, "rural_1", "v_grpEA_Basic" ], [ "PATROL" ] ]
	//[ [ _groupArrayTechnicalPat, "rural_1", false ], [ "PATROL_URBAN" ] ]
];

// [ _unitsArray, _marker, _owner, _actSide, _distance, _condition, _onAct, _onDeAct ] call T8U_fnc_Zone
[ "rural_1", "rural_1", "EAST", "WEST" ] spawn T8U_fnc_Zone;
