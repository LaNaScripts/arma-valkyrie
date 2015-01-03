/*

  @name:   functions\generateGroup.sqf
  @author: http://devynspencer.github.io
  @about:  Generates a group of units with random equipment and behaviors.
  @params:
  @examples:
  @returns:

*/

private [
  "_marker",
  "_faction",
  "_roles",
  "_size",
  "_radius",
  "_units",
  "_role",
  "_gPos",
  "_unitTypes",
  "_group",
  "_uPos",
  "_unit",
  "_rWeapons",
  "_rHeadgear",
  "_rGoggles",
  "_rVests",
  "_rUniforms",
  "_rBackpacks"
];

_marker  = [_this, 0, objNull, ""] call BIS_fnc_param; // REQUIRED

_faction = [_this, 1, (floor random 2), ""] call BIS_fnc_param; // 0=CIVILIAN, 1=EAST, 2=GUER
_roles   = [_this, 2, (v_roles select _faction), []] call BIS_fnc_param;
_size    = [_this, 3, (floor random 3), 0] call BIS_fnc_param; // only groups > _specReq have special
_radius  = [_this, 4, 10, [0]] call BIS_fnc_param; // random spawn radius around initial position

_units   = (_size * (1 + (floor random 2))) + 1; // min=1 unit / max=10 units
_role    = _roles call BIS_fnc_selectRandom;
_gPos    = markerPos(_marker); // initial spawn location of the group
//_specReq = 9; // min. units in group before generating a special unit

// specify base unit appearance -- move this to a role-specific value (civilians spawn as civilians etc)
_unitTypes = [
  "C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
  "C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
  "C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
  "C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
  "C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
  "C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

// determine side based on _faction
// this could be included in each role, but this might create unnecessary overhead
// also, separating roles from faction allows for roles to be independent of faction eventually
call {
  if (_faction == 0) exitWith {_group = createGroup CIVILIAN;};
  if (_faction == 1) exitWith {_group = createGroup EAST;};
  if (_faction == 2) exitWith {_group = createGroup GUER;};
};

// spawn group units
for "_i" from 0 to _units {
  _uPos = _gPos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
  _unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
  _unit setPosATL _uPos;

  removeAllWeapons _unit;
  removeAllAssignedItems _unit;
  removeUniform _unit;
  removeVest _unit;
  removeBackpack _unit;
  removeHeadgear _unit;
  removeGoggles _unit;

  // obtain random items from role sub arrays
  _rWeapons   = _role select 0; // weapons
  _rHeadgear  = _role select 1; // headgear
  _rGoggles   = _role select 2; // goggles
  _rVests     = _role select 3; // uniforms
  _rUniforms  = _role select 4; // vests
  _rBackpacks = _role select 5; // backpacks
  //_rSupplies    = _role select 6; // supplies
  //_rSkills      = _role select 7; // skills
  // _rBehaviors  = _role select 8; // behaviors
  // _rMorale     = _role select 9; // morale
  // _rTactics    = _role select 10; // tactics
  // _rHvyWeapons = _role select 11; // special units
  // _rSpecials   = _role select 12; // specialUnits

  // add selected items to unit
  if (count _rWeapons > 0) then {_unit addWeapon (_rWeapons call BIS_fnc_selectRandom);};
  if (count _rHeadgear > 0) then {_unit addHeadgear (_rHeadgear call BIS_fnc_selectRandom);};
  if (count _rGoggles > 0) then {_unit addGoggles (_rGoggles call BIS_fnc_selectRandom);};
  if (count _rVests > 0) then {_unit addVest (_rVests call BIS_fnc_selectRandom);};
  if (count _rUniforms > 0) then {_unit addUniform (_rUniforms call BIS_fnc_selectRandom);};
  if (count _rBackpacks > 0) then {_unit addBackpack (_rBackpacks call BIS_fnc_selectRandom);};

  _unit spawn resetAmmo;
  //_unit spawn setBehavior;
  //_unit spawn setTactics;
};
