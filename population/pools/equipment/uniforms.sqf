/*
@name: pools\equipment\uniforms.sqf
@description: pool of uniforms and clothing to randomly select from
@author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
@params:
@returns: attached to a function with #include
*/

/*
private [
  "_balaclavas",
  "_shemags",
];

_shemags = [
  "H_Shemag_khk",
  "H_Shemag_tan",
  "H_Shemag_olive",
  "H_Shemag_olive_hs",
  "H_ShemagOpen_tan",
  "H_ShemagOpen_khk"
] call BIS_fnc_selectRandom;

_balaclavas = [
  "Kio_Balaclava_blk",
  "Kio_Balaclava_blkSkull",
  "Kio_Balaclava_grn",
  "Kio_Balaclava_des",
  "Kio_Balaclava_multicam",
  "Kio_Balaclava_hex",
  "Kio_Balaclava_wcam",
  "Kio_Balaclava_urbcam"
] call BIS_fnc_selectRandom;

_uniformsGhillie = [
  "U_O_GhillieSuit",
  "U_B_GhillieSuit",
  "U_I_GhillieSuit"
] call BIS_fnc_selectRandom;

_uniformsGuerilla = [
  "U_BG_leader",
  "U_BG_Guerilla1_1",
  "U_BG_Guerilla2_1",
  "U_BG_Guerilla2_2",
  "U_BG_Guerilla2_3",
  "U_BG_Guerilla3_1",
  "U_BG_Guerilla3_2",
  "U_BG_Guerrilla_6_1"
] call BIS_fnc_selectRandom;

_uniformsCoveralls
  "U_I_pilotCoveralls",
  "U_B_PilotCoveralls",
  "U_B_HeliPilotCoveralls",
  "U_O_PilotCoveralls",
  "U_B_HeliPilotCoveralls",
  "U_I_HeliPilotCoveralls"
] call BIS_fnc_selectRandom;

_uniformsCivilian = [
  "U_C_FishermanOveralls",
  "U_C_WorkerOveralls",
  "U_C_Poor_1",
  "U_C_Poor_2",
  "U_C_Scientist",
  "U_C_HunterBody_grn", //test
  "U_C_HunterBody_brn", //test
  "U_C_Commoner2_1",
  "U_C_Commoner2_2",
  "U_C_Commoner2_3",
  "U_C_Fisherman",
  "U_C_Scavenger_2", // test
  "U_C_Scavenger_1", // test
  "U_C_Farmer"
] call BIS_fnc_selectRandom;

_uniformsOpfor = [
  "U_O_CombatUniform_ocamo",
  "U_O_SpecopsUniform_ocamo"
] call BIS_fnc_selectRandom;

_uniformsOpforUrban = [
  "U_B_PilotCoveralls",
  "U_I_pilotCoveralls",
  "U_O_CombatUniform_oucamo"
] call BIS_fnc_selectRandom;

_helmetsBreather = [
  "H_PilotHelmetFighter_B",
  "H_PilotHelmetFighter_O",
  "H_PilotHelmetFighter_I"
] call BIS_fnc_selectRandom;

_helmetsClosed = [
  "H_CrewHelmetHeli_B",
  "H_CrewHelmetHeli_O",
  "H_CrewHelmetHeli_I"
] call BIS_fnc_selectRandom;

_helmetsOpfor = [
  "H_HelmetO_ocamo",
  "H_HelmetLeaderO_ocamo",
  "H_HelmetLeaderO_oucamo",
  "H_HelmetSpecO_ocamo",
  "H_HelmetSpecO_blk"
] call BIS_fnc_selectRandom;

_vestsRebreather = [
  "V_RebreatherB",
  "V_RebreatherIR",
  "V_RebreatherIA"
] call BIS_fnc_selectRandom;

_helmetsOpforUrban = [
  "H_HelmetLeaderO_oucamo",
  "H_HelmetO_oucamo",
  "H_HelmetSpecO_blk"
] call BIS_fnc_selectRandom;

_vestsLight = [
  "V_HarnessO_brn",
  "V_HarnessOGL_brn",
  "V_HarnessO_gry",
  "V_HarnessOGL_gry",
  "V_HarnessOSpec_brn",
  "V_HarnessOSpec_gry"
] call BIS_fnc_selectRandom;

_vestsMedium = [
  "V_TacVest_blk",
  "V_TacVest_brn",
  "V_TacVest_camo",
  "V_TacVest_oli",
  "V_TacVest_blk_POLICE"
] call BIS_fnc_selectRandom;

_vestsHeavy = [
  "V_PlateCarrier1_blk",
  "V_PlateCarrier_Kerry",
  "V_PlateCarrierL_CTRG",
  "V_PlateCarrierIAGL_dgtl",
  "V_I_G_resistanceLeader_F",
  "V_PlateCarrierIA2_dgtl",
  "V_PlateCarrierIA1_dgtl"
] call BIS_fnc_selectRandom;
