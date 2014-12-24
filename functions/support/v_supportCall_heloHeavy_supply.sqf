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
      _position = position _object;

      _origin = [_position, 1000, floor random 360] call BIS_fnc_relPos;
      _originActual = [_position, 5, floor random 360] call BIS_fnc_relPos;
      _originCargo = [_position, 5, floor random 360] call BIS_fnc_relPos;

      _unit = [_originActual, 180, "B_Heli_Light_01_F", side player] call BIS_fnc_spawnVehicle;
      _unitActual = _unit select 0;
      _unitGroup = _unit select 2;

      _unitActual flyInHeight 60;
      _cargo = "B_MRAP_01_hmg_F" createVehicle _originCargo;

      _unitActual setSlingLoad _cargo;

      _wp = _unitGroup addWaypoint [_position, 0];
      _wp setWaypointType "MOVE";

      _unitActual move (getPos _destination);

      waitUntil {_unitActual distance _position < 5 };

      if (alive _unitActual && unitReady) then {
        sleep 2;
        
        {
          _unitActual ropeDetach _x;
        } forEach ropes _unitActual;
        
        sleep 2;
      };
      
      _wp = _unitGroup addWaypoint [_origin, 0];
      _wp setWaypointType "MOVE";
    };
  };
}];
