/*

  file: 'init.sqf'
  author: devyn spencer (http://github.com/devynspencer)
  description:
    - initializes core processes and functions
    - initializes modules included in 'server\config.sqf'

*/

// define global variables
enableSaving [false, false];

// compile global functions
setLoadout = compile preProcessFileLineNumbers "functions\setLoadout.sqf";
refillPrimaryAmmo = compile preProcessFileLineNumbers "functions\refillPrimaryAmmo.sqf";

// compile global event handlers

// run core processes
[] execVM "modules\population\functions\T8_UnitsINIT.sqf";
[] execVM "modules\population\functions\T8_missionEXEC.sqf";
[] execVM "modules\population\functions\garbageCollector.sqf";
