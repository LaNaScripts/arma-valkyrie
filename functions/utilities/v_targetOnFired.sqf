/*

  file: v_targetOnFired
  about: if object fired matches _type, then run command using the position
    of where the object fired has landed
  example:

    // spawn CAS on position of thrown smoke grenade
    ["B_IR_Grenade", v_spawnCAS] spawn v_targetOnFired;

*/

// return the location of a round after it's been thrown (or fired -- 40mm smoke / flare)
_type = [_this, 0, "B_IR_Grenade"] call BIS_fnc_param;
_command = [_this, 1, v_spawnCAS] call BIS_fnc_param; // not sure about adding command via BIS_fnc_param

player addEventHandler ["Fired", {
  _null = _this spawn {
    _object = _this select 6;

    if (_object == _type) then {
      _position = position _object;
      hint _position;

      _position spawn _command;
    };
  };
}];


/*

alternatively:
  return the position of any smoke within a radius of a unit.

//init
_unit   = [_this, 0, player] call BIS_fnc_param;
_radius = [_this, 1, 500] call BIS_fnc_param;
_smokeColor  = [_this, 2, "SmokeShell"]; // change to allow colors

//loop check
while {alive _unit} do {
  _smokeArray = (position _unit) nearestObject [_smokeColor, _radius];
  _qty = count _smokeArray;

  if (_qty > 0) then {

    //Smoke has been dropped
    _smoke = _smokeArray select 0;
    _smokePos = position _smoke;

    // example output
    hint format ["%1", _smokePos];
  };
  sleep 2;
};

*/
