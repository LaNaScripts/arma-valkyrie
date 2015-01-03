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

    if (_type isEqualTo "SmokeShellGreen") then {

      _chatter = [
      "I'll save you a seat. Out.",
      "Enjoy the view. Out.",
      "Altis postal en route. Out.",
      "Package delivery. Out.",
      "Party favors inbound. Out",
      "Zeus was busy, so this hook will have to do. Out.",
      "I'll add it to your tab. Out.",
      "Right away. Out.",
      "On your mark. Out.",
      "Landing this hook on your smoke. Out."
      ] call BIS_fnc_selectRandom;

      _chatterLanded = [
      "I'm gonna need you to sign for this. How copy?",
      "On your mark. How copy?",
      "Landing this bird on your smoke. How copy?"
      ] call BIS_fnc_selectRandom;

      [West, "HQ"] sideChat "Request confirmed.";
      [West, "HQ"] sideChat "Dispatching heavy airborne resupply to marked position.";
      [West, "HQ"] sideChat _chatter;

      _object = _this select 6;

      sleep 3;
      _position = position _object;

      _lz = "Land_HelipadEmpty_F" createVehicle _position;

      _origin = [_position, 1000, floor random 360] call BIS_fnc_relPos;
      _originActual = [_origin, 5, floor random 360] call BIS_fnc_relPos;
      _originCargo = [_origin, 5, floor random 360] call BIS_fnc_relPos;

      _unit = [_originActual, 180, "B_Heli_Transport_01_F", side player] call BIS_fnc_spawnVehicle;
      _unitActual = _unit select 0;
      _unitGroup = _unit select 2;
      _unitActual sideChat "Transport is feet dry. Out.";

      _unitActual flyInHeight 100;
      _cargo = "B_CargoNet_01_ammo_F" createVehicle _originCargo;
      _unitActual sideChat "Cargo is feet dry. Out.";

      _unitActual setSlingLoad _cargo;
      _unitActual sideChat "Cargo is attached. Out.";

      _wp = _unitGroup addWaypoint [_position, 0];
      _wp setWaypointType "MOVE";
      _wp setWaypointCombatMode "BLUE";

      waitUntil {_unitActual distance _position < 200};
      _unitActual flyInHeight 50;
      _unitActual move _position;
      sleep 8;

      _unitActual land "GET IN";
      waitUntil {_unitActual distance _position < 25};

      {
        ropeUnwind [_x, 5, 45, true];
      } forEach ropes _unitActual;

      sleep 3;
      _unitActual land "NONE";

      {
        _cargo ropeDetach _x;
        ropeDestroy _x;
      } forEach ropes _unitActual;
      _unitActual sideChat "Package dropped at location. Out.";

      _wp1 = _unitGroup addWaypoint [_origin, 0];
      _wp1 setWaypointType "MOVE";
      _wp1 setWaypointCombatMode "BLUE";
      _unitActual flyInHeight 100;
      _unitActual sideChat "In position for delivery. Out.";
    };
  };
}];
