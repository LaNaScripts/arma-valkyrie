// generate random locations near the player
_objCount = 3;

for "_i" from 0 to _objCount do {
  _dist = floor random 500;
  _pos = [player, _dist, floor random 360] call BIS_fnc_relPos;
  _name = format ["obj_%1_%2", profileName, _i];

  _mkr = createMarker [_name, _pos];
  _mkr setMarkerType "hd_unknown";
  _mkr setMarkerAlpha 1;
  _mkr setMarkerColor "ColorOrange";

  // create a new task
  _taskName = format ["task_%1_%2", profileName, _i];
  _taskDesc = ["Something unusual is going on at a nearby location", "Investigate", _mkr];
  [player, _taskName, _taskDesc, _mkr, "Created", 0] call BIS_fnc_taskCreate;
];

  // set the task status
  // set the task location
  // set the task description
  
  // set a random task as active?
  // wait until the tasks status changes?
};
