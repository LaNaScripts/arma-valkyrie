/*
@name: compileModule.sqf
@description: aggregates module components into one file to be called by 'server\init.sqf'
@author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
@params: []
@returns:
*/

setLoadout = compile preProcessFileLineNumbers "functions\setLoadout.sqf";
refillPrimaryAmmo = compile preProcessFileLineNumbers "functions\refillPrimaryAmmo.sqf";
cacheZone = compile preProcessFileLineNumbers "functions\cacheZone.sqf";
cleanZone = compile preProcessFileLineNumbers "functions\cleanZone.sqf";

generateEncounter = compile preProcessFileLineNumbers "functions\generateEncounter.sqf";
generateGroup = compile preProcessFileLineNumbers "functions\generateGroup.sqf";
generateVehicle = compile preProcessFileLineNumbers "functions\generateVehicle.sqf";
generateObject = compile preProcessFileLineNumbers "functions\generateObject.sqf";
generateVehicle = compile preProcessFileLineNumbers "functions\generateVehicle.sqf";
generateRarity = compile preProcessFileLineNumbers "functions\generateRarity.sqf";
generateLoadout = compile preProcessFileLineNumbers "functions\generateLoadout.sqf";
generateContents = compile preProcessFileLineNumbers "functions\generateContents.sqf";
generateZone = compile preProcessFileLineNumbers "functions\generateZone.sqf";
