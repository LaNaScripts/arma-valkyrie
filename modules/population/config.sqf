/*

  @file: "modules\population\config.sqf"
  @author: T-800a
  @description: configures the population module

*/

// encounters to include when generating populations
encountersList = [
  #include "encounters\civilian\city.sqf"
  #include "encounters\regime.sqf"
  #include "encounters\guerilla.sqf"
  #include "encounters\supplyDrop.sqf"
];

// debug settings
T8U_var_DEBUG               = true; // general Debug
T8U_var_DEBUG_hints	        = true; // show Debug Hints
T8U_var_DEBUG_marker        = true; // create Debug Markers
T8U_var_DEBUG_useCon        = true; // send Debug MSGs to kzk debug console

// addons settings
T8U_var_AllowCBM            = true;
T8U_var_AllowZEUS           = true; // register with zeus, may slow spawning
T8U_var_ZeusModules         = [ server ]; // name of the Zeusmodule to sync all units to
T8U_var_AllowDAC		        = false; // Allow DAC
T8U_var_DACtimeout	        = 180; // Timeout after calling DAC to help group

// enemy settings
T8U_var_EnemySide           = EAST;
T8U_var_GuerDiplo           = 1; // 0=neutral, 1=friend(BLUE), 2=friend(RED), 3=hostile(BOTH)
T8U_var_TaskReturnTime      = 30; // if SAD WP is finished group starts on origin task after x seconds
T8U_var_CacheTime           = 90; // seconds before caching zone after player leaves
T8U_var_DirectCallRange     = 1200; // group leader searches for help within radius
T8U_var_RevealRange         = 300; // group shares info on encountered enemies to others within radius
T8U_var_PatAroundRange	    = 50; // additional distance units will patrol outside of zone marker
T8U_var_KilledLeaderTimeout = 20; // check for new leader after x seconds of no communication
T8U_var_FiredEventTimeout   = 10; // if firednear event triggered, pause for x sec (reduce ai spam)
T8U_var_CallForHelpTimeout  = 60; // a group can only call one other group each x sec for help
T8U_var_SupportTimeout      = 180; // every X sec an officer can call a support (e.g. paradrop)
T8U_var_OvSuperiority       = 333; // overwhelming superiority for ai (won't call for support)
T8U_var_Presets = [ // [0] = T8U_var_SkillSets, [1] = T8U_var_BehaviorSets
  [ 2, 1 ],		// 0 for WEST
  [ 1, 0 ],		// 1 for EAST
  [ 1, 2 ]		// 2 for RESISTANCE
];
T8U_var_SkillSets = [
  [ // 0 - militia
    [ "aimingAccuracy", 0.20 ],
    [ "aimingShake",    0.15 ],
    [ "aimingSpeed",    0.20 ],
    [ "spotDistance",   0.75 ],
    [ "spotTime",       0.70 ],
    [ "courage",        0.30 ],
    [ "reloadSpeed",    0.20 ],
    [ "commanding",     0.50 ],
    [ "general",        0.50 ]
  ],
  [ // 1 - regular
    [ "aimingAccuracy", 0.30 ],
    [ "aimingShake",    0.25 ],
    [ "aimingSpeed",    0.30 ],
    [ "spotDistance",   0.85 ],
    [ "spotTime",       0.75 ],
    [ "courage",        0.50 ],
    [ "reloadSpeed",    0.40 ],
    [ "commanding",     0.70 ],
    [ "general",        0.70 ]
  ],
  [ // 2 - special forces
    [ "aimingAccuracy", 0.45 ],
    [ "aimingShake",    0.40 ],
    [ "aimingSpeed",    0.50 ],
    [ "spotDistance",   0.95 ],
    [ "spotTime",       0.90 ],
    [ "courage",        0.70 ],
    [ "reloadSpeed",    0.60 ],
    [ "commanding",     0.90 ],
    [ "general",        0.90 ]
  ]
];
T8U_var_BehaviorSets =
[
  [ // 0 - aggressive
    "YELLOW", // spawn Combat-Mode
    "RED",    // max. Combat-Mode when unit behavior changes to COMBAT
    "WHITE",  // Combat-Mode after some time in max. Combat-Mode
    180       // time the group stays in max. Combat-Mode
  ],
  [ // 1 - defensive
    "GREEN",  // spawn Combat-Mode
    "YELLOW", // max. Combat-Mode when unit behavior changes to COMBAT
    "GREEN",  // Combat-Mode after some time in max. Combat-Mode
    90        // time the group stays in max. Combat-Mode
  ],
  [ // 2 - reluctant
    "GREEN", // spawn Combat-Mode
    "RED",   // max. Combat-Mode when unit behavior changes to COMBAT
    "GREEN", // Combat-Mode after some time in max. Combat-Mode
    120      // time the group stays in max. Combat-Mode
  ]
];
T8U_var_ReinforceVehicle = [ // vehicles groups will use to respond to distress calls
  "APC_Tracked_01_base_F",
  "APC_Tracked_02_base_F",
  "Wheeled_APC_F",
  "Truck_01_base_F",
  "Truck_02_base_F",
  "MRAP_01_base_F",
  "MRAP_02_base_F",
  "MRAP_03_base_F",
  "C_Offroad_01_F",
  "I_G_Offroad_01_F"
];
T8U_var_SuppressingUnits = [ // units to issue supressing fire instead of engaging directly
  "B_soldier_AR_F",
  "B_G_soldier_AR_F",
  "O_soldier_AR_F",
  "O_soldierU_AR_F",
  "O_G_soldier_AR_F",
  "I_soldier_AR_F",
  "I_G_soldier_AR_F"
];
T8U_var_CommanderEnable = false; // not implemented
