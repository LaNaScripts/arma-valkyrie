/*

  file: v_grp_AAF_technical
  author: http://github.com/devynspencer
  about: creates a technical patrol

*/

/*

{
  _x setVariable ["BIS_enableRandomization", false];
  _x spawn v_grpAAF_basic;
} forEach (crew vehicle _this);

private [
"_vehicle",
"_missingCargo",
"_cargoCount",
"_driverCount",
"_gunnerCount",
"_commanderCount",
"_capacity",
"_unit"
];

//_vehicle = createVehicle ["O_G_Offroad_01_F", (position _this), [], 0, "NONE"];
//_this assignAsCargo vehicle _this;
//_this moveInAny _vehicle;

_missingCargo = floor random 4;
_cargoCount = vehicle _this emptyPositions "cargo";
_driverCount = vehicle _this emptyPositions "driver";
_gunnerCount = vehicle _this emptyPositions "gunner";
_commanderCount = vehicle _this emptyPositions "commander";
_capacity = (_cargoCount - _missingCargo) + _driverCount + _gunnerCount + _commanderCount;

sleep 1;

for "_i" from 1 to _capacity do {
_unit = (group _this) createUnit ["O_G_Soldier_F", (position _this), [], 0, "NONE"];
_unit assignAsCargo _this;
_unit moveInAny _this;
};

{
_x setVariable ["BIS_enableRandomization", false];
_x spawn v_grpAAF_basic;
} forEach (crew vehicle _this);


private [
"_SMG",
"_LMG",
"_vest",
"_uniform",
"_balaclava",
"_shemag",
"_helmet",
"_backpack",
"_skin",
"_voice",
"_weapon",
"_magazine",
"_randVest",
"_randWeapon",
"_weaponArray",
"_randHeadgear",
"_mask",
"_randBackpack"
];

_this call v_removeGear;

_SMG = [
["RH_PDW", "RH_30Rnd_6x35_mag_Tracer"]
];

_LMG = [
["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"]
];

_vest = [
"V_TacVest_khk",
"V_TacVest_camo",
"V_BandollierB_khk",
"V_BandollierB_blk",
"V_TacVestIR_blk",
"V_I_G_resistanceLeader_F",
"V_Rangemaster_belt",
"V_PlateCarrierIAGL_dgtl",
"V_PlateCarrierIA1_dgtl"
];

_uniform = [
"U_I_CombatUniform",
"U_I_OfficerUniform",
"U_I_CombatUniform_shortsleeve",
"U_BG_Guerrilla_6_1",
"U_BG_Guerilla1_1",
"U_BG_leader"
];

_balaclava = [
"G_Balaclava_oli",
"G_Balaclava_blk",
"G_Balaclava_lowprofile",
"G_Balaclava_combat"
];

_helmet = [
"H_HelmetCrew_I",
"H_HelmetIA"
];

_hat = [
"H_MilCap_dgtl"
];

_goggles = [
"G_Lowprofile",
"G_Sport_Blackred",
"G_Combat",
"G_Aviator"
];

_backpack = [
];

//_skin = "GreekHead_A3_08";
_voice = "Male01GREVR";

//_this setFace _skin;
_this setSpeaker _voice;

// uniform
if (count _uniform > 0) then {
  _this forceAddUniform (_uniform call BIS_fnc_selectRandom);
};

// vest
call {
_randVest = floor random 100;

if (_randVest > 30) exitWith {
if (count _vest > 0) then {_this addVest (_vest call BIS_fnc_selectRandom)};
};
};

// weapon
call {
_randWeapon = floor random 100;

if (_randWeapon > 80) then {
_weaponArray = _LMG call BIS_fnc_selectRandom;
} else {
_weaponArray = _SMG call BIS_fnc_selectRandom;
};
};

if (count _weaponArray > 0) then {
_weapon   = _weaponArray select 0;
_magazine = _weaponArray select 1;

_this addWeapon _weapon;
for "_i" from 1 to 5 do {_this addItem _magazine};
};

// headgear
_randHeadgear = floor random 3;

switch (_randHeadgear) do {
// helmet & balaclava
case 0: {
if (count _helmet > 0) then {_this addHeadgear (_helmet call BIS_fnc_selectRandom);};
if (count _balaclava > 0) then {_this linkItem (_balaclava call BIS_fnc_selectRandom);};
};

// balaclava only
case 1: {
if (count _balaclava > 0) then {_this linkItem (_balaclava call BIS_fnc_selectRandom);};
};

// helmet only
case 2: {
if (count _helmet > 0) then {_this addHeadgear (_helmet call BIS_fnc_selectRandom);};
};

// goggles only
case 3: {
if (count _goggles > 0) then {_this linkItem (_goggles call BIS_fnc_selectRandom);};
};

// hat and goggles
case 4: {
if (count _hat > 0) then {_this addHeadgear (_hat call BIS_fnc_selectRandom);};
if (count _goggles > 0) then {_this linkItem (_goggles call BIS_fnc_selectRandom);};
};
};

/*

// backpack
_randBackpack = floor random 100;

call {
if (_randBackpack > 80) exitWith {
if (count _backpack > 0) then {

_this addBackpack _backpack;
};
};
};

*/
