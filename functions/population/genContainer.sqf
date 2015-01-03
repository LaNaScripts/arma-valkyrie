/*

  name:   functions\genContainer.sqf
  author: Deadbeat, JoSchaap, AgentRevcreated, modified for http://github.com/devynspencer/valkyrie
  about:  creates a container full of a random selection of items at a random location

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
