/*

  @name: removeEquipment.sqf
  @description: removes all equipment from a unit
  @author: Devyn Spencer
  @params:
  @examples:
  @returns:

*/

removeHeadgear _this:
removeGoggles _this;
removeVest _this;
removeBackpack _this;
removeUniform _this;
removeAllWeapons _this:
removeAllAssignedItems _this;
