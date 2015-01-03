/*

  name:   functions\genContainer.sqf
  author: Deadbeat, JoSchaap, AgentRevcreated, modified for http://github.com/devynspencer/valkyrie
  about:  generate a container and cargo at a location

*/

private [
  "_objPos",
  "_objClass",
  "_obj",
  "_contents",
  "_itemClass"
];

_objPos = _this select 0;
_objClass = v_containers call BIS_fnc_selectRandom;
_obj = createVehicle [_objClass, _objPos, [], 50, "None"];
_contents = floor random 5;

call {
  if (_objClass isKindOf "ReammoBox_F") exitWith {
    clearMagazineCargoGlobal _obj;
    clearWeaponCargoGlobal _obj;
    clearItemCargoGlobal _obj;

    for "_i" from 1 to _contents do {
      _itemClass = ["ammo", "weapon", "item"] call BIS_fnc_selectRandom;

      call {
        if (_itemClass == "ammo") exitWith {
          if (count v_loot_ammo > 0) then {_obj addMagazineCargoGlobal (v_loot_ammo call BIS_fnc_selectRandom);};
        };

        if (_itemClass == "weapon") exitWith {
          if (count v_loot_weapons > 0) then {_obj addWeaponCargoGlobal (v_loot_weapons call BIS_fnc_selectRandom);};
        };

        if (_itemClass == "item") exitWith {
          if (count v_loot_items > 0) then {_obj addItemCargoGlobal (v_loot_items call BIS_fnc_selectRandom);};
        };
      };
    };

  _obj allowDamage false;
  };

  // otherwise, default to =>
_obj setVariable ["allowDamage", true];
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

/*

file:        set_contents.sqf
author:      devyn spencer (http://github.com/devynspencer)
description: populates contents of a crate/backpack/vehicle/ with random items
parameters:
- container // loot amounts should fit within the limitations of different containers
- rarity    // maximum rarity of item pools to generate from; default = 1 (common)

1. randomly select a container type

2. determine size of loot pool

3. determine number of items to generate

4. load all loot pools

- items
- gear
- vests
- uniforms
- weapons
- ammo
- resources*
- structures*

5. combine all pool arrays into one pool to generate from // pushBack

6. select a random item from the aggregate pool from 1 to _num

- determine what the item is
- add the item to the container user the appropriate function

*/

/*

private [

];

// randomly select a container type, unless specified
_lootContainer = [_this, 0, (pl_containers call BIS_fnc_selectRandom), ""] call BIS_fnc_param;

// determine size of loot pool
call {
if (_container == "") exitWith {};
if () exitWith {};
};

// determine number of items to generate

// load all loot pools

_ = // items
_ = // gear
_ = // vests
_ = // uniforms
_ = // weapons
_ = // ammo
_ = // resources*
_ = // structures*

// combine all pool arrays into one pool to generate from // pushBack

// select a random item from the aggregate pool from 1 to _num

- determine what the item is
- add the item to the container user the appropriate function



call BIS_fnc_selectRandom for _i in _num

*/
