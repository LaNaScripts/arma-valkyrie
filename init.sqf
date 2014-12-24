/*

  name: init.sqf
  author:
  about: initializes game processes

*/

call compile preprocessFileLineNumbers "config.sqf";

v_spawnRoute        = compile preprocessFileLineNumbers "functions\spawn\v_spawnRoute.sqf";
v_spawnSupport      = compile preprocessFileLineNumbers "functions\spawn\v_spawnSupport.sqf";
v_removeGear        = compile preprocessFileLineNumbers "functions\spawn\v_removeGear.sqf";
v_grpAAF_basic      = compile preprocessFileLineNumbers "functions\spawn\v_grpAAF_basic.sqf";
v_grpAAF_technical  = compile preprocessFileLineNumbers "functions\spawn\v_grpAAF_technical.sqf";
v_setupPlayer       = compile preprocessFileLineNumbers "functions\spawn\v_setupPlayer.sqf";

enableSaving [false, false];

// T8_UnitINIT -> Load the functions
[] execVM "T8_UnitsINIT.sqf";

// missionEXEC -> Load the unit setup & more
[] execVM "T8_missionEXEC.sqf";

// set skill for editor placed units, see selected side in file
// [] execVM "skillEXEC.sqf";

// delete dead bodies, and weapon holders on the ground
[] execVM "garbageCollector.sqf";
