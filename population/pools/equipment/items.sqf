/*

  @name:
    - pools\equipment\items.sqf

  @author:
    - created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis

  @description:
    - collection of subpools
    - each subpool holds an array of similar items

  @params:
    - N/A

  @returns:
    - attached to a function with #include

  @examples:
    _items = pl_items call BIS_fnc_selectRandom
    _items = _items call BIS_fnc_selectRandom

*/

/*
switch _rarity do {
  case "basic": {
    _items = [
      "FirstAidKit",
      "Chemlight_green",
      "Chemlight_red",
      "Chemlight_yellow",
      "Chemlight_blue",
      "SmokeShell",
      "SmokeShellGreen"
    ];
  };

  case "common": {
    _items = [
      "ToolKit",
      "Laserbatteries",
      "B_AssaultPack_khk",
      "B_AssaultPack_mcamo",
      "B_AssaultPack_rgr",
      "B_AssaultPack_ocamo",
      "B_AssaultPack_blk",
      "acc_pointer_IR",
      "muzzle_snds_acp"
      "acc_flashlight",
      "ItemCompass",
      "ItemGPS",
      "ItemRadio",
      "ItemMap",
      "ItemWatch",
      "Binocular",
      "Laserdesignator",
      "MineDetector",
      "optic_MRD",
      "optic_Yorris"
      "optic_Aco",
      "optic_ACO_grn",
      "optic_Aco_smg",
      "optic_ACO_grn_smg",
      "optic_Holosight",
      "optic_Holosight_smg"
    ];
  };

  case "uncommon": {
    _items = [
      "Medikit",
      "B_FieldPack_oli",
      "B_FieldPack_khk",
      "B_FieldPack_khk",
      "B_FieldPack_ocamo"
      "I_UAV_01_backpack_F",    // small recon uav
      "B_UAV_01_backpack_F",    // small recon uav
      "O_UAV_01_backpack_F",    // small recon uav
      "optic_MRCO",
      "optic_Arco",
      "optic_Hamr",
      "optic_DMS"
    ];
  };

  case "rare": {
    _items = [
      "muzzle_snds_H",
      "muzzle_snds_L",
      "muzzle_snds_M",
      "muzzle_snds_B",
      "muzzle_snds_H_MG",
      "optic_NVS",
      "optic_Nightstalker",
      "optic_tws",
      "optic_tws_mg",
      "NVGoggles",
      "B_UavTerminal"
      "optic_SOS",
      "optic_LRPS"
      "B_Carryall_oli",
      "B_Carryall_mcamo",
      "B_Carryall_oli",
      "B_Carryall_ocamo",
      "I_HMG_01_weapon_F",     // static HMG
      "I_HMG_01_support_F",    // static weapon tripod
      "B_HMG_01_weapon_F",     // static HMG
      "B_HMG_01_support_F",    // static weapon tripod
      "O_HMG_01_weapon_F",     // static HMG
      "O_HMG_01_support_F",    // static weapon tripod
      "I_AT_01_weapon_F",      // static ATL
      "B_AT_01_weapon_F",      // static ATL
      "O_AT_01_weapon_F",      // static ATL
      "I_AA_01_weapon_F",      // static SAM
      "B_AA_01_weapon_F",      // static SAM
      "O_AA_01_weapon_F"       // static SAM
    ];
  };
};

/*
//_attachments_sup = [
  "muzzle_snds_H",
  "muzzle_snds_L",
  "muzzle_snds_M",
  "muzzle_snds_B",
  "muzzle_snds_H_MG"
//];

//_attachments_uncommon = [
  "acc_pointer_IR",
  "muzzle_snds_acp"
//];

//_attachments_common = [
  "acc_flashlight"
//];

//_optics_ir = [
  "optic_NVS",
  "optic_Nightstalker",
  "optic_tws",
  "optic_tws_mg"
//];

//_optics_long = [
  "optic_SOS",
  "optic_LRPS"
//];

//_optics_medium = [
  "optic_MRCO",
  "optic_Arco",
  "optic_Hamr",
  "optic_DMS"
//];

//_optics_short = [
  "optic_Aco",
  "optic_ACO_grn",
  "optic_Aco_smg",
  "optic_ACO_grn_smg",
  "optic_Holosight",
  "optic_Holosight_smg"
//];

//_items_rare = [
  "NVGoggles",
  "Medikit",
  "B_UavTerminal"
//];

//_items_uncommon = [
  "ItemCompass",
  "ItemGPS",
  "ItemRadio",
  "ItemMap",
  "ItemWatch",
  "Binocular",
  "Laserdesignator",
  "MineDetector",
  "optic_MRD",
  "optic_Yorris"
//];

//_bag_small = [
  "B_AssaultPack_khk",
  "B_AssaultPack_mcamo",
  "B_AssaultPack_rgr",
  "B_AssaultPack_ocamo",
  "B_AssaultPack_blk"
//];

//_bag_medium = [
  "B_FieldPack_oli",
  "B_FieldPack_khk",
  "B_FieldPack_khk",
  "B_FieldPack_ocamo"
//];

//_bag_large = [
  "B_Carryall_oli",
  "B_Carryall_mcamo",
  "B_Carryall_oli",
  "B_Carryall_ocamo"
//];

//_sup_uav = [
  "I_UAV_01_backpack_F",    // small recon uav
  "B_UAV_01_backpack_F",    // small recon uav
  "O_UAV_01_backpack_F"     // small recon uav
//];

//_sup_hmg_i = [
  "I_HMG_01_weapon_F",     // static HMG site - gun
  "I_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_hmg_b = [
  "B_HMG_01_weapon_F",     // static HMG site - gun
  "B_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_hmg_o = [
  "O_HMG_01_weapon_F",     // static HMG site - gun
  "O_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_atl_i = [
  "I_AT_01_weapon_F",      // static ATL site - gun
  "I_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_atl_b = [
  "B_AT_01_weapon_F",      // static ATL site - gun
  "B_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_atl_o = [
  "O_AT_01_weapon_F",      // static ATL site - gun
  "O_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_aal_i = [
  "I_AA_01_weapon_F",      // static SAM site - gun
  "I_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_aal_b = [
  "B_AA_01_weapon_F",      // static SAM site - gun
  "B_HMG_01_support_F"    // HMG/launcher tripod
//];

//_sup_aal_o = [
  "O_AA_01_weapon_F",      // static SAM site - gun
  "O_HMG_01_support_F"    // HMG/launcher tripod
//];
