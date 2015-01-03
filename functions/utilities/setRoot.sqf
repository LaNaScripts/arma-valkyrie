/*

file:    functions\setRoot.sqf
author:  http://devynspencer.github.io
about:   Specifies the root of the mission directory

*/

MISSION_ROOT = call {
  private "_arr";
  _arr = toArray str missionConfigFile;
  _arr resize (count _arr - 15);
  toString _arr;
};
