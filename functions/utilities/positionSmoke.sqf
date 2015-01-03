/*

  file: v_targetOnFired
  about: if object fired matches _type, then run command using the position
    of where the object fired has landed
  example:

    // spawn CAS on position of thrown smoke grenade
    ["B_IR_Grenade", v_spawnCAS] spawn v_targetOnFired;

*/

player addEventHandler ["Fired", {
  _null = _this spawn {

    _type = _this select 4; // ammo type

    // check if the object is a
    if (_type isEqualTo "SmokeShell") then {
      _object = _this select 6; // projectile object
      _position = position _object; // position of object

      // call in a unit to the position of the thrown smoke
      _unit = [_position, 180,  "B_Heli_Light_01_F", side player] call BIS_fnc_spawnVehicle;
    };
  };
}];
