player addEventHandler ["Fired", {
  _null = _this spawn {

    _type = _this select 4;

    if (_type isEqualTo "SmokeShellOrange") then {

      _chatter = [
        "Save me a seat. Out.",
        "Please keep your hands and feet inside the ride at all times. Out.",
        "Thank you for flying Air Sierra-Sierra, Delta-Delta. Out.",
        "Dinner and a show. Out",
        "Burnin' for you. Out.",
        "Zeus was busy, these birds will have to do. Out.",
        "I'll add it to your tab. Out.",
        "On your mark. Out.",
        "Bad guys captured and marked for death. Out.",
        "Well call me Santa Claus. Out."
      ] call BIS_fnc_selectRandom;

      [West, "HQ"] sideChat "Request confirmed.";
      [West, "HQ"] sideChat "Dispatching. Hotel Oscar Echo inbound to marked position.";
      [West, "HQ"] sideChat _chatter;

      _object = _this select 6;
      _position = position _object;

      _unitGroup = createGroup side player;
      _origin = [_position, 500, floor random 360] call BIS_fnc_relPos;
      _size = ceil random 2;

      for "_i" from 1 to _size do {
        _originActual = [_origin, 20, floor random 360] call BIS_fnc_relPos;
        [_originActual, 180, "B_Heli_Attack_01_F", _unitGroup] call BIS_fnc_spawnVehicle;
      };

      _wp = _unitGroup addWaypoint [_position, 0];
      _wp setWaypointSpeed "FULL";
      _wp setWaypointType "MOVE";

      _wp = _unitGroup addWaypoint [_position, 500];
      _wp setWaypointCombatMode "RED";
      _wp setWaypointType "SAD";

      _wp1 = _unitGroup addWaypoint [_origin, 0];
      _wp1 setWaypointCombatMode "BLUE";
      _wp1 setWaypointType "MOVE";
    };
  };
}];
