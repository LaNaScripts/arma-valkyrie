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
// setLoadout        = compile preProcessFileLineNumbers "server\functions\setLoadout.sqf";
// refillPrimaryAmmo = compile preProcessFileLineNumbers "server\functions\refillPrimaryAmmo.sqf";
// removeEquipment   = compile preProcessFileLineNumbers "server\functions\removeEquipment.sqf";
// setLoadout        = compile preProcessFileLineNumbers "server\functions\setLoadout.sqf";
// refillAmmo        = compile preProcessFileLineNumbers "server\functions\refillPrimaryAmmo.sqf";
// cacheZone         = compile preProcessFileLineNumbers "server\functions\cacheZone.sqf";
// cleanZone         = compile preProcessFileLineNumbers "server\functions\cleanZone.sqf";
// generateEncounter = compile preProcessFileLineNumbers "server\functions\generateEncounter.sqf";
// generateGroup     = compile preProcessFileLineNumbers "server\functions\generateGroup.sqf";
// generateVehicle   = compile preProcessFileLineNumbers "server\functions\generateVehicle.sqf";
// generateObject    = compile preProcessFileLineNumbers "server\functions\generateObject.sqf";
// generateVehicle   = compile preProcessFileLineNumbers "server\functions\generateVehicle.sqf";
// generateRarity    = compile preProcessFileLineNumbers "server\functions\generateRarity.sqf";
// generateLoadout   = compile preProcessFileLineNumbers "server\functions\generateLoadout.sqf";
// generateContents  = compile preProcessFileLineNumbers "server\functions\generateContents.sqf";
// generateZone      = compile preProcessFileLineNumbers "server\functions\generateZone.sqf";

// getNearestMarker = compile preProcessFileLineNumbers "server\functions\getNearestMarker.sqf";
// getRandomMarker = compile preProcessFileLineNumbers "server\functions\getRandomMarker.sqf";
// compile global event handlers

// run core processes

/*

@name: 'modules\population\init.sqf'
@description: initializes population module
@author: T-800a, modified for http://github.com/devynspencer/valkyrie
@params: []
@returns: begins client & server processes necessary for delivery of core gameplay elements

*/

T8U_dir_ROOT  = "server\functions\T8\";
T8U_dir_FNCS  = "T8_fncs\";
T8U_dir_TASK  = "T8_tasks\";
T8U_dir_SUPP  = "T8_supports\";

// run via headless client instead of server
T8U_var_useHC = false;

// include the Hint Broadcast
//#include "\server\functions\T8\T8_UnitsHB.sqf"

T8U_fnc_BroadcastHint = {
  private ["_hint", "_text"];
  _text = _this select 0;
  [[ _text ], "T8U_fnc_Hint"] spawn BIS_fnc_MP;
};

T8U_fnc_Hint = {
  private ["_text"];
  _text = _this select 0;
  hint parseText format ["<t size='1.5' color='#FE9A2E' align='right'>[T8 Units]</t><br /><t size='1' color='#FE9A2E' align='left'>%1</t>", _text];
};

// remaining code is server only
private ["_exit"];

_exit = false;

if (T8U_var_useHC) then {
  if (isDedicated) then {
    _exit = true;
  } else {
    waitUntil {!isNull player};

    if (hasInterface) then {
      _exit = true;
    };
  };
} else {
  if (!isServer) then {
    _exit = true;
  };
};

if (_exit) exitWith {};

#include "config.sqf"
// was server\functions\T8_Units.sqf
#include "compile.sqf"

T8U_var_DebugMarkerCache = [];

waituntil {!isNil "bis_fnc_init"};

T8U_var_InitDONE = true;

[] spawn T8U_fnc_GroupClearEmpty;

if (T8U_var_DEBUG) then {
  [] spawn T8U_fnc_TrackAllUnits;
  [] spawn T8U_fnc_DebugMarkerDelete;
};

[] execVM "server\functions\generateZone.sqf";
//[] execVM "server\functions\garbageCollector.sqf";
