/*
@name: 'encounters\enemy.sqf'
@description: pool of potential 'enemy' encounters
@author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
@params: []
@examples:
@returns: called as an #include within getEncounter
*/

_fireTeam = [
  "O_soldier_TL_F",
  "O_medic_F",
  "O_soldier_F",
  "O_soldier_AR_F"
];

_sentryPatrol = [
  "O_soldier_TL_F",
  "O_medic_F",
  "O_soldier_F"
];

_fullPatrol = [
  "O_soldier_SL_F",
  "O_medic_F",
  "O_soldier_F",
  "O_soldier_TL_F",
  "O_soldier_F",
  "O_soldier_AR_F"
];

_sniperTeam = [
  "O_sniper_F",
  "O_spotter_F"
];

_technicalPatrol = [
  "O_G_Offroad_01_armed_F",
  "O_G_Offroad_01_F"
];

// patrol
// overwatch
// garrison
// infighting
// ambush
// officer & retinue
// communications array
// weapons cache
// armory
// slave camp
// training camp
// rebel assassination attempt
// munitions depot
// supply cache
// supply distribution center
// motor pool
