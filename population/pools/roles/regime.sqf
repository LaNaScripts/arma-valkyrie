/*

  @name: generateRole.sqf
  @description: adds random equipment to a unit based on role
  @author: Devyn Spencer
  @params:
  @examples:
  @returns:

*/

/*

private = [
  "_roles"
];

_roles = [
  "_conscripts",
  "_shocks",
  "_grunts",
  "_vassals",
  "_hunters",
  "_heavies",
  "_smokers"
];

// remove all equipment


call {

  if (_role == "conscript") exitWith {
    _roleHeadGear  = [_shemags, _balaclavas];
    _roleGoggles   = [];
    _roleUniforms  = [_uniformsCoveralls, _uniformsOpforUrban];
    _roleVests     = [];
    _roleBackpacks = [];
    _roleWeapons   = [_pistols, _smgs, _carbines];
  };

  if (_role == "shock") exitWith {
    _roleHeadGear  = [];
    _roleGoggles   = [];
    _roleUniforms  = [];
    _roleVests     = [];
    _roleBackpacks = [];
    _roleWeapons   = [];
    ];
  };

  if (_role == "grunt") exitWith {
    _roleHeadGear  = [];
    _roleGoggles   = [];
    _roleUniforms  = [];
    _roleVests     = [];
    _roleBackpacks = [];
    _roleWeapons   = [];
  };

  if (_role == "vassas") exitWith {
    _roleHeadGear  = [];
    _roleGoggles   = [];
    _roleUniforms  = [];
    _roleVests     = [];
    _roleBackpacks = [];
    _roleWeapons   = [];
  };

  if (_role == "huntes") exitWith {
    _roleHeadGear  = [];
    _roleGoggles   = [];
    _roleUniforms  = [];
    _roleVests     = [];
    _roleBackpacks = [];
    _roleWeapons   = [];
  };

  if (_role == "heavies") exitWith {
    _roleHeadGear  = [];
    _roleGoggles   = [];
    _roleUniforms  = [];
    _roleVests     = [];
    _roleBackpacks = [];
    _roleWeapons   = [];
  };

  if (_role == "smokers") exitWith {
    _roleHeadGear  = [];
    _roleGoggles   = [];
    _roleUniforms  = [];
    _roleVests     = [];
    _roleBackpacks = [];
    _roleWeapons   = [];
  };
}; // default loadout

// if array not empty, add
if (_roleHeadGear count > 0) then {
  _headGear = _roleHeadGear call BIS_fnc_selectRandom;
  _this addHeadgear _headGear;
  // hint _headGear;
};

// if array not empty, add
if (_roleGoggles count > 0) then {
  _goggles = _roleGoggles call BIS_fnc_selectRandom;
  _this addGoggles _goggles
  // hint _goggles;
};

// if array not empty, add
if (_roleUniforms count > 0) then {
  _uniform = _roleUniforms call BIS_fnc_selectRandom;
  _this addUniform _uniform;
  // hint _uniform;
};

// if array not empty, add
if (_roleVests count > 0) then {
  _vest = _roleVests call BIS_fnc_selectRandom;
  _this addVest _vest
  // hint _vest;
};

// if array not empty, add
if (_roleBackpacks count > 0) then {
  _backpack = _roleBackpacks call BIS_fnc_selectRandom;
  _this addBackpack _backpack
  // hint _backpack;
};

// if array not empty, add
if (_roleWeapons count > 0) then {
  _weapon = _roleWeapons call BIS_fnc_selectRandom;
  _this addWeapon _weapon
  // hint _weapon;

  // ensure unit has ammunition for added weapon
  _this call addPrimaryWeaponAmmo;
};

/*

_technicals = [];
_dregs = []; // (upgrades module)
_flares = []; // (upgrades module)
_controllers = []; // (drones module)
_hoarders = []; // (construction module)
_trappers = []; // (construction module)
_trackers = []; // (night operations module)
_shades = []; // (night operations module)
_screamers = []; // (health module)
_wracks = []; // (supports module)

*/
