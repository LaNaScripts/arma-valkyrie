// issues: CAS engaging inconsistently
// or not at all

player addEventHandler ["Fired", {
  _null = _this spawn {

    _type = _this select 4;

    "Save me a seat. Out.",
    "Please keep your hands and feet inside the ride at all times. Out.",
    "Thank you for flying Air Sierra-Sierra, Delta-Delta. Out.",
    "Dinner and a show. Out",
    "Burnin' for you. Out.",
    "Zeus was busy, so these birds will have to do. Out.",
    "I'll add it to your tab. Out.",
    "Bad guys captured and marked for death. Out.",
    "Well call me Santa Claus. Out."

    if (_type isEqualTo "SmokeShellRed") then {
      [West, "HQ"] sideChat "Request confirmed.";
      [West, "HQ"] sideChat "Dispatching friendly fast movers to marked position.";
      [West, "HQ"] sideChat "Vallhalla awaits. Over.";

      _object = _this select 6;
      _position = position _object;

      _unitGroup = createGroup side player;
      _origin = [_position, 2000, floor random 360] call BIS_fnc_relPos;
      _size = ceil random 2;

      for "_i" from 1 to _size do {
        _originActual = [_origin, 20, floor random 360] call BIS_fnc_relPos;
        [_originActual, 180, "B_Plane_CAS_01_F", _unitGroup] call BIS_fnc_spawnVehicle;
        sleep 2;
      };

      _wp1 = _unitGroup addWaypoint [_position, 300];
      _wp1 setWaypointCombatMode "RED";
      _wp1 setWaypointType "SAD";

      _wp2 = _unitGroup addWaypoint [_origin, 0];
      _wp2 setWaypointCombatMode "BLUE";
      _wp2 setWaypointType "MOVE";
    };
  };
}];
