_this spawn {

  private [
    "_rifle",
    "_LMG",
    "_DMR",
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

  _rifle = [
    "arifle_Katiba_F",
    "arifle_MX_pointer_F"
  ];

  _LMG = [
    "arifle_MX_SW_F",
    "LMG_Mk200_F"
  ];

  _DMR = [
  "arifle_MXM_Black_F"
  ];

  /*

  _goggles = [

  ];

  */

  _vestLight = [
    "V_HarnessOSpec_gry"
  ];

  _vestMedium = [
    "V_TacVest_blk"
  ];

  _vestHeavy = [
    "V_PlateCarrier1_blk",
    "V_I_G_resistanceLeader_F",
    "V_PlateCarrierIA2_dgtl",
    "V_PlateCarrierIA1_dgtl"
  ];

  _uniformEA_urban  = [
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
    if (_randWeapon > 90) exitWith {_weapon = _DMR};
    if (_randWeapon > 60) exitWith {_weapon = _LMG};
    _weapon = _rifle;
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
    //if (_randUniform > 0) exitWith {_uniform = _uniformEA_basic};
    if (_randUniform > 0) exitWith {_uniform = _uniformEA_urban};
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

  _this spawn v_refillPrimaryAmmo;
};
