/*

  author: http://github.com/devynspencer
  about: randomly generates an encounter relevant to the environment of a zone

  parameters:

  - marker
  - zone
  - type
  - size
  - difficulty

*/

/*

private [
  "_factions",   // array of factions to generate from
  "_encounters", // array of encounters to generate from; default = all
  "_groups",     // array of groups to generate from
  "_encObj",     // encounter objective
  "_marker",     // marker to spawn near
  "_zone",       // zone type (affects which encounter pools are used)
  "_size",       // encounter size (affects number of groups)
  "_difficulty"  // encounter difficulty (affects # of enemies, enemy skill, and reward type/amount)
];

// moved to 'v_encountersAll' in \config.sqf

// moved to 'v_objectivesAll' in \config.sqf

_marker     = [_this, 0, objNull, ""] call BIS_fnc_param;
_zone       = [_this, 1, (_zones call BIS_fnc_selectRandom), ""] call BIS_fnc_param;
_encList    = [_this, 2, (v_encountersAll call BIS_fnc_selectRandom), ""] call BIS_fnc_param;
_groups     = [_this, 4, (floor random 5), 0] call BIS_fnc_param;
_difficulty = [_this, 5, (floor random 4), 0] call BIS_fnc_param;

// grab parameters from selected encounter

// generate objects for any non-empty array provided

*/
