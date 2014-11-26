/*
@name: compileModule.sqf
@description: aggregates module components into one file to be called by 'server\init.sqf'
@author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
@params: []
@returns:
*/

//createRandomSoldier = compile preProcessFileLineNumbers "functions\createRandomSoldier.sqf";
setLoadout = compile preProcessFileLineNumbers "functions\setLoadout.sqf";
refillPrimaryAmmo = compile preProcessFileLineNumbers "functions\refillPrimaryAmmo.sqf";
