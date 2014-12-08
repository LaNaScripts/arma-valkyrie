/*

  name: compileModule.sqf
  author: http://devynspencer.github.io
  description: aggregates module components into one file to be called by 'server\init.sqf'

*/

// compile asset pools
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\ammo.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\container.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\encounters.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\items.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\objectives.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\objects.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\roles.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\uniforms.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\vehicles.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\weapons.sqf");
[] call compile preprocessFileLineNumbers (MISSION_ROOT + "population\pools\zones.sqf");

// compile functions
getContainer     = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\getContainer.sqf");
getContents      = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\getContents.sqf");
getEncounter     = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\getEncounter.sqf");
genGroup         = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\genGroup.sqf");
genObject        = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\genObject.sqf");
genVehicle       = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\genVehicle.sqf");
genZone          = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\genZone.sqf");
getNearestMarker = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\getNearestMarker.sqf");
getRandomMarker  = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\getRandomMarker.sqf");
resetAmmo        = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\resetAmmo.sqf");
setBehavior      = compile preProcessFileLineNumbers (MISSION_ROOT + "server\functions\setBehavior.sqf");
