/*

  @name: removeEquipment.sqf
  @description: removes all equipment from a unit
  @author: Devyn Spencer
  @params:
  @examples:
  @returns:

*/
private [
  "_unit"
];

_unit = [_this, 0, _this, ""] call BIS_fnc_param;

removeHeadgear _unit:
removeGoggles _unit;
removeVest _unit;
removeBackpack _unit;
removeUniform _unit;
removeAllWeapons _unit:
removeAllAssignedItems _unit;
