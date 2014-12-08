/*

  name:   functions\genContainer.sqf
  author: Deadbeat, JoSchaap, AgentRevcreated, modified for http://github.com/devynspencer/valkyrie
  about:  creates a container full of a random selection of items at a random location

*/

//if (!isServer) exitWith {};

private [
  "_objPos",
  "_objClass",
  "_obj",
  "_contents",
  "_item",
  "_itemClass",
  "_itemPool",
  //"_adjustZ",
  //"_pos"
];

_objPos = _this select 0;
_objClass = _containers call BIS_fnc_selectRandom;
_obj = createVehicle [_objClass, _objPos, [], 50, "None"];
_contents = floor random 5;

switch (true) do {
  case (_objClass isKindOf "ReammoBox_F"): {
    clearMagazineCargoGlobal _obj;
    clearWeaponCargoGlobal _obj;
    clearItemCargoGlobal _obj;

    for "_i" from 1 to _contents do {
      _item = [] call getItem;
      _itemClass = _item select 0;
      _itemPool = _item select 1;

      switch _itemPool do {
        case "ammo": {_obj addMagazineCargoGlobal _item;};
        case "weapon": {_obj addWeaponCargoGlobal _item;};
        case "item": {_obj addItemCargoGlobal _item;};
      };
    };

    _obj allowDamage false;
  };
  default {
    _obj setVariable ["allowDamage", true];
  };
};

/* possibly refactor into construction module, when started
// fix for sunken/risen objects :)
_adjustZ = switch (true) do
{
  case (_objClass == "Land_Scaffolding_F"):         { -3 };
  case (_objClass == "Land_Canal_WallSmall_10m_F"): { 3 };
  case (_objClass == "Land_Canal_Wall_Stairs_F"):   { 3 };
  default                                           { 0 };
};

_pos = getPosATL _obj;
_pos set [2, (_pos select 2) + _adjustZ];
_obj setPos _pos;
*/
