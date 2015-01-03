/*

  name: init.sqf
  author:
  about: initializes game processes

*/

call compile preprocessFileLineNumbers "config.sqf";

v_removeGear        = compile preprocessFileLineNumbers "functions\spawn\removeGear.sqf";
v_setupPlayer       = compile preprocessFileLineNumbers "functions\spawn\setupPlayer.sqf";

enableSaving [false, false];

// T8_UnitINIT -> Load the functions
[] execVM "T8_UnitsINIT.sqf";

// missionEXEC -> Load the unit setup & more
[] execVM "T8_missionEXEC.sqf";

// set skill for editor placed units, see selected side in file
// [] execVM "skillEXEC.sqf";

// delete dead bodies, and weapon holders on the ground
[] execVM "garbageCollector.sqf";
