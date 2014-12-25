player addEventHandler ["Fired", {
  _null = _this spawn {

    private [
      "_type",
      "_chatter",
      "_object",
      "_position",
      "_origin",
      "_unit",
      "_unitActual",
      "_unitGroup",
      "_wp",
      "_wp1"
    ];

    _type = _this select 4;

    if (_type isEqualTo "SmokeShell") then {

      _chatter = [
        "I'll save you a seat. Out.",
        "Enjoy the view. Out.",
        "Thank you for choosing Air Altis. Out.",
        "Please keep your hands and feet inside the ride at all times. Out.",
        "Thank you for flying Air Sierra-Sierra, Delta-Delta. Out.",
        "Room with a view, en route. Out",
        "Zeus was busy, so these birds will have to do. Out.",
        "I'll add it to your tab. Out.",
        "Right away. Out.",
        "On your mark. Out.",
        "Landing this bird on your smoke. Out."
      ] call BIS_fnc_selectRandom;

      _chatterLanded = [
        "Thank you for choosing Air Altis. How copy?",
        "Please keep your hands and feet inside the ride at all times. How copy?",
        "Thank you for flying Air Sierra-Sierra, Delta-Delta. How copy?",
        "Zeus was busy, so these birds will have to do. How copy?",
        "On your mark. How copy?",
        "Landing this bird on your smoke. How copy?",
        "Your chariot awaits. How copy?"
      ] call BIS_fnc_selectRandom;

      [West, "HQ"] sideChat "Request confirmed.";
      [West, "HQ"] sideChat "Dispatching light air transport to marked position.";
      [West, "HQ"] sideChat _chatter;

      _object = _this select 6;
      sleep 3;
      _position = position _object;

      _origin = [_position, 1000, floor random 360] call BIS_fnc_relPos;
      _unit = [_origin, 180, "B_Heli_Light_01_F", side player] call BIS_fnc_spawnVehicle;

      _unitActual = _unit select 0;
      _unitGroup = _unit select 2;

      _wp = _unitGroup addWaypoint [position player, 0];
      _wp setWaypointType "MOVE";

      _unitActual move (getPos _destination);

      waitUntil {_unitActual distance _position < 5 };

      if (alive _unitActual && unitReady) then {
        sleep 2;
        _unitActual land "GET IN";

        _unitActual addEventHandler ["GetIn", {
          if (_this select 2 isEqualTo player) then {
            _wp1 = _unitGroup addWaypoint [_origin, 0];

            _wp setWaypointType "MOVE";
            _wp setWaypointSpeed "FULL";
            _wp setWaypointCombatMode "BLUE";
            //_wp setWaypointStatements ["true", [West, "HQ"] sideChat _chatterMoving];
          };
        }];
      };
    };
  };
}];
