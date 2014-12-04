/*

  author:       ])rStrangelove, modified for http://github.com/devynspencer/valkyrie
  filename:     get_nearestMarker.sqf
  description:  returns the nearest marker to the specified point

*/

private [
  "_marker"
];

_marker = [_this, 0, zonesCity, ""] call BIS_fnc_param;

return _marker call BIS_fnc_selectRandom;
