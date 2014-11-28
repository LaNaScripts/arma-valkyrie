/*
@name: pools\equipment\weapons.sqf
@description: pool of weapons to randomly select from
@author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
@params:
@returns: attached to a function with #include
*/

switch _rarity do {
  case "basic": {
    _items = [
      "hgun_ACPC2_F",
      "hgun_Pistol_heavy_01_F",
      "hgun_P07_F",
      "hgun_Rook40_F",
      "SMG_01_F",
      "SMG_02_F",
      "hgun_PDW2000_F"
    ];
  };

  case "common": {
    _items = [
      "arifle_SDAR_F",
      "arifle_Mk20C_F",
      "arifle_TRG20_F"
      "arifle_MXC_F",
      "arifle_Katiba_C_F",
      "arifle_Mk20_F",
      "arifle_TRG21_F"
      "arifle_Katiba_F",
      "arifle_MX_pointer_F",
      "arifle_Mk20_GL_MRCO_pointer_F",
      "arifle_TRG21_GL_F",
      "arifle_Katiba_GL_F",
      "arifle_MX_GL_F"
    ];
  };

  case "uncommon": {
    _items = [
      "arifle_MX_SW_F",
      "LMG_Mk200_F",
      "LMG_Zafir_F",
      "srifle_EBR_F",
      "srifle_DMR_01_F",
      "arifle_MXM_Black_F"
    ];
  };

  case "rare": {
    _items = [
      "launch_RPG32_F",
      "launch_NLAW_F",
      "launch_O_Titan_F",
      "launch_B_Titan_F",
      "srifle_GM6_F",
      "srifle_LRR_F"
    ];
  };
};

/*
// light
_pistol = ["hgun_ACPC2_F", "hgun_Pistol_heavy_01_F", "hgun_P07_F", "hgun_Rook40_F"];
_smg = ["SMG_01_F", "SMG_02_F", "hgun_PDW2000_F"];
_diverWep = ["arifle_SDAR_F"];

// automatic rifles
_carbine_m = ["arifle_Mk20C_F", "arifle_TRG20_F"];
_carbine_h = ["arifle_MXC_F", "arifle_Katiba_C_F"];
_rifle_m = ["arifle_Mk20_F", "arifle_TRG21_F"];
_rifle_h = ["arifle_Katiba_F", "arifle_MX_pointer_F"];
_glrifle_m = ["arifle_Mk20_GL_MRCO_pointer_F", "arifle_TRG21_GL_F"];
_glrifle_h = ["arifle_Katiba_GL_F", "arifle_MX_GL_F"];

// machine guns
_mg_l = ["arifle_MX_SW_F", "LMG_Mk200_F"];
_mg_m = ["LMG_Zafir_F"];

// launchers
_launcher_at = ["launch_RPG32_F", "launch_NLAW_F"];
_launcher_aa = ["launch_O_Titan_F", "launch_B_Titan_F"];

// scoped rifles
_sniper = ["srifle_GM6_F", "srifle_LRR_F"];
_dmr = ["srifle_EBR_F", "srifle_DMR_01_F", "arifle_MXM_Black_F"];
*/
