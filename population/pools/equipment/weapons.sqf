/*

  @name: pools\equipment\regime\weapons.sqf
  @description: pool of weapons to randomly select from
  @author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
  @params:
  @returns: attached to a function with #include

*/

/*
_handguns = [
  "hgun_ACPC2_F",
  "hgun_Pistol_heavy_01_F",
  "hgun_P07_F",
  "hgun_Rook40_F"
] call BIS_fnc_selectRandom;

_smgs = [
  "SMG_01_F",
  "SMG_02_F",
  "hgun_PDW2000_F"
] call BIS_fnc_selectRandom;

_carbines = [
  "arifle_SDAR_F",
  "arifle_Mk20C_F",
  "arifle_Mk20C_plain_F",
  "arifle_TRG20_F"
  "arifle_MXC_F",
  "arifle_Katiba_C_F"
] call BIS_fnc_selectRandom;

_rifles = [
  "arifle_Mk20_F",
  "arifle_TRG21_F"
  "arifle_Katiba_F",
  "arifle_MX_pointer_F"
] call BIS_fnc_selectRandom;

_launcherRifles = [
  "arifle_Mk20_GL_MRCO_pointer_F",
  "arifle_TRG21_GL_F",
  "arifle_Katiba_GL_F",
  "arifle_MX_GL_F"
] call BIS_fnc_selectRandom;

_dmrs = [
  "srifle_EBR_F",
  "srifle_DMR_01_F",
  "arifle_MXM_Black_F"
] call BIS_fnc_selectRandom;

_lmgs = [
  "arifle_MX_SW_F",
  "LMG_Mk200_F",
  "LMG_Zafir_F"
] call BIS_fnc_selectRandom;

_launchers = [
  "launch_RPG32_F",
  "launch_NLAW_F",
  "launch_O_Titan_F",
  "launch_B_Titan_F",
  "srifle_GM6_F",
  "srifle_LRR_F"
] call BIS_fnc_selectRandom;

_snipers = [
  "launch_RPG32_F",
  "launch_NLAW_F",
  "launch_O_Titan_F",
  "launch_B_Titan_F",
  "srifle_GM6_F",
  "srifle_LRR_F"
] call BIS_fnc_selectRandom;

_explosives = [

] call BIS_fnc_selectRandom;
