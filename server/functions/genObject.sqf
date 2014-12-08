/*
  @name: spawnObjects.sqf
  @description: spawn vehicles randomly within a zone
  @author: Deadbeat, JoSchaap, AgentRev, modified for http://github.com/devynspencer/valkyrie.Altis
  @params: [objPos, objClass, obj, adjustZ, pos]
  @returns:
*/

if (!isServer) exitWith {};

private [
  "_objPos",
  "_objClass",
  "_obj",
  "_adjustZ",
  "_pos"
];

_objPos   = [_this, 0, objNull, ""] call BIS_fnc_param; // REQUIRED
_objClass = v_containers call BIS_fnc_selectRandom;
_obj      = createVehicle [_objClass, _objPos, [], 50, "None"];

switch (true) do {
  case (_objClass == "Land_BarrelWater_F"): {
    //_obj setVariable ["water", 50, true];
    _obj allowDamage false;
  };

  case (_objClass == "Land_Sacks_goods_F"): {
    //_obj setVariable ["food", 40, true];
    _obj allowDamage false;
  };

  case (_objClass isKindOf "ReammoBox_F"): {
    clearMagazineCargoGlobal _obj;
    clearWeaponCargoGlobal _obj;
    clearItemCargoGlobal _obj;

    // should be randomized
    _obj addMagazineCargoGlobal ["9Rnd_45ACP_Mag", 10];
    _obj addMagazineCargoGlobal ["Laserbatteries", 1];
    _obj addWeaponCargoGlobal ["Laserdesignator", 1];
    _obj addWeaponCargoGlobal ["Binocular", 5];
    _obj addItemCargoGlobal ["FirstAidKit", 10];
    _obj addItemCargoGlobal ["ItemGPS", 5];
    _obj addItemCargoGlobal ["Medikit", 4];
    _obj addItemCargoGlobal ["ToolKit", 2];

    _obj allowDamage false;
  };

  default {
    _obj setVariable ["allowDamage", true];
  };
};

/*

// fix for sunken/rissen objects :)
_adjustZ = switch (true) do {
  case (_objClass == "Land_Scaffolding_F"):         { -3 };
  case (_objClass == "Land_Canal_WallSmall_10m_F"): { 3 };
  case (_objClass == "Land_Canal_Wall_Stairs_F"):   { 3 };
  default                                           { 0 };
};

_pos = getPosATL _obj;
_pos set [2, (_pos select 2) + _adjustZ];
_obj setPos _pos;

*/
