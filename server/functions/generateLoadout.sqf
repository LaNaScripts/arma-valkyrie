/*
  @name: generateLoadout.sqf
  @description: randomly generates and equips a unit with items based on unit role
  @author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
  @params: [
    chance_*  - chance to generate an item for slot *
    num_items - number of random items that will be potentially generated for the character
    head      - class name of head item to return
    face      - class name of face item to return
    uniform   - class name of uniform item to return
    vest      - class name of vest item to return
    backpack  - class name of backpack item to return
    weapon    - class name of weapon item to return
    items     - class name of items item to return
    ]
  @examples:
  @returns: [_head, _face, _uniform, _vest, _backpack, _weapon, _items]
*/
_this spawn {
  private [
    "_unit",
    "_rolesList",
    "_role",
    "_roleHeadWear",
    "_roleFaceWear",
    "_roleUniforms",
    "_roleVests",
    "_roleBackpacks",
    "_roleWeapons",
    "_headwear",
    "_facewear",
    "_uniform",
    "_vest",
    "_backpack",
    "_weapon"
  ];

  _rolesList = [
    "conscripts",
    "grunts",
    "vassals",
    "hunters",
    "heavies",
    "smokers"
  ];

  _role = [_this, 1, (_rolesList call BIS_fnc_selectRandom). ""] call BIS_fnc_param;

  call {
    if (_role == "conscripts") exitWith {
      _roleHeadWear  = [pl_uni_shemags];
      _roleFaceWear  = [];
      _roleUniforms  = [pl_uni_uniformsCoveralls];
      _roleVests     = [];
      _roleBackpacks = [];
      _roleWeapons   = [pl_weaponsHandgun, pl_weaponsSMG];
    };

    if (_role == "grunts") exitWith {
      _roleHeadWear  = [pl_uni_shemags, pl_uni_helmets_o];
      _roleFaceWear  = [];
      _roleUniforms  = [pl_uni_uniforms_o];
      _roleVests     = [pl_uni_vestsMedium];
      _roleBackpacks = [];
      _roleWeapons   = [pl_weaponsCarbine];
    };

    if (_role == "vassals") exitWith {
      _roleHeadWear  = [pl_uni_helmetsClosed, pl_uni_helmetsUrban_o];
      _roleFaceWear  = [];
      _roleUniforms  = [pl_uni_uniformsUrban_o, U_O_SpecopsUniform_ocamo];
      _roleVests     = [pl_uni_vestsHeavy];
      _roleBackpacks = [];
      _roleWeapons   = [pl_weaponsRifle, pl_weaponsLauncherRifle, pl_weaponsLMG];
    };

    if (_role == "hunters") exitWith {
      _roleHeadWear  = [];
      _roleFaceWear  = [];
      _roleUniforms  = [pl_uni_uniformsGhillie];
      _roleVests     = [pl_uni_vestsLight];
      _roleBackpacks = [];
      _roleWeapons   = [pl_weaponsDMR, pl_weaponsSniper];
    };

    if (_role == "heavies") exitWith {
      _roleHeadWear  = [pl_uni_helmetsBreather];
      _roleFaceWear  = [];
      _roleUniforms  = [pl_uni_uniformsUrban_o, pl_uni_uniforms_o];
      _roleVests     = [pl_uni_vestsRebreather];
      _roleBackpacks = [];
      _roleWeapons   = [pl_weaponsLMG];
    };

    if (_role == "smokers") exitWith {
      _roleHeadWear  = [pl_uni_helmetsBreather];
      _roleFaceWear  = [];
      _roleUniforms  = [pl_uni_uniforms_o, pl_uni_uniformsCoveralls];
      _roleVests     = [pl_uni_vestsRebreather];
      _roleBackpacks = [];
      _roleWeapons   = [pl_weaponsSMG, pl_weaponsCarbine];
    };
  };

  if (count _roleHeadWear > 0) then {
    _headWear = _roleHeadWear call BIS_fnc_selectRandom;
    _this addHeadWear _headWear;
  };

  if (count _roleFaceWear > 0) then {
    _faceWear = _roleFaceWear call BIS_fnc_selectRandom;
    _this addFaceWear _faceWear;
  };

  if (count _roleUniforms > 0) then {
    _uniform = _roleUniforms call BIS_fnc_selectRandom;
    _this addUniform _uniform;
  };

  if (count _roleVests > 0) then {
    _vest = _roleVests call BIS_fnc_selectRandom;
    _this addVest _vest;
  };

  if (count _roleBackpacks > 0) then {
    _backpack = _roleBackpacks call BIS_fnc_selectRandom;
    _this addBackpack _backpack;
  };

  if (count _roleWeapons > 0) then {
    _weapon = _roleWeapons call BIS_fnc_selectRandom;
    _this addWeapon _weapon;
  };

  _this call refillPrimaryAmmo;
};
