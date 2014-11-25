/*
  @name: set_unitGear.sqf
  @description: equips a unit with random equipment based on type and faction
  @author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
  @params: [
    _unit        - name of unit to equip (string);
    _unitFaction - arma faction (string); default = faction associated with model
    _unitRole    - role of unit (string); default = get_unitRole; valkyrie specific - see 'docs\roles'
  ]
  @examples:
  @returns:
*/

private [
  "_unit",
  "_unitRole",
  "_unitFaction"
];

_unit = _this select 0;

// unit role; defaults to value provided from get_unitRole
_unitRole = [_this, 1, (get_unitRole _unit), ""] call BIS_fnc_param
_unitFaction = [_this, 2, (faction _unit), ""] call BIS_fnc_param

// check for correct locality
if !(local _unit) exitWith {};

_unitGear = [_unitFaction, _unitRole] call get_unitLoadout;

if (debugMode) then {
  player globalchat format ["(assignGear.sqf) assigning %1 loadout to %2 unit '%3'", _unitRole, _unitFaction, _unit];

  if (_unit get_itemCount == 0) then {
    player globalchat format ["(set_unitGear.sqf): Faction or role invalid for unit '%1' - %2 / %3!", _unit, _unitFaction, _unitRole];
  };
};
