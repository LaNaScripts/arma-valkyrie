/*

  name:   pools\weapons.sqf
  author: http://devynspencer.github.io
  about:  weapon list based on type

*/

v_weaponsHandgun = [
  "hgun_ACPC2_F",
  "hgun_Pistol_heavy_01_F",
  "hgun_P07_F",
  "hgun_Rook40_F"
] call BIS_fnc_selectRandom;

v_weaponsSMG = [
  "SMG_01_F",
  "SMG_02_F",
  "hgun_PDW2000_F"
] call BIS_fnc_selectRandom;

v_weaponsCarbine = [
  "arifle_SDAR_F",
  "arifle_Mk20C_F",
  "arifle_Mk20C_plain_F",
  "arifle_TRG20_F",
  "arifle_MXC_F",
  "arifle_Katiba_C_F"
] call BIS_fnc_selectRandom;

v_weaponsRifle = [
  "arifle_Mk20_F",
  "arifle_TRG21_F",
  "arifle_Katiba_F",
  "arifle_MX_pointer_F"
] call BIS_fnc_selectRandom;

v_weaponsLauncherRifle = [
  "arifle_Mk20_GL_MRCO_pointer_F",
  "arifle_TRG21_GL_F",
  "arifle_Katiba_GL_F",
  "arifle_MX_GL_F"
] call BIS_fnc_selectRandom;

v_weaponsDMR = [
  "srifle_EBR_F",
  "srifle_DMR_01_F",
  "arifle_MXM_Black_F"
] call BIS_fnc_selectRandom;

v_weaponsLMG = [
  "arifle_MX_SW_F",
  "LMG_Mk200_F",
  "LMG_Zafir_F"
] call BIS_fnc_selectRandom;

v_weaponsLauncher = [
  "launch_RPG32_F",
  "launch_NLAW_F",
  "launch_O_Titan_F",
  "launch_B_Titan_F"
] call BIS_fnc_selectRandom;

v_weaponsSniper = [
  "launch_RPG32_F",
  "launch_NLAW_F",
  "launch_O_Titan_F",
  "launch_B_Titan_F",
  "srifle_GM6_F",
  "srifle_LRR_F"
] call BIS_fnc_selectRandom;

// not sure if these can be a primary
v_weaponsExplosive = [

] call BIS_fnc_selectRandom;
