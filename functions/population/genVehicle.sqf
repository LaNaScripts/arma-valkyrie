/*
  @name: spawnVehicles.sqf
  @description: spawn vehicles randomly within a zone
  @author: Deadbeat, AgentRev, modified for http://github.com/devynspencer/valkyrie.Altis
  @params: [marker, vehicleType]
  @returns:
*/

/*

private [
  "_marker",
  "_pos",
  "_vehicles",
  "_type",
  "_vehicle"
];

_marker = [_this, 0, objNull, ""] call BIS_fnc_param;
_pos = markerPos _marker;
_vehicles = v_vehicles select 0;
_type = _vehicles call BIS_fnc_selectRandom;
_vehicle = createVehicle [_type, _pos, [], 10, "None"];
_vehicle setDamage (random 0.5);
_vehicle setFuel (0.2 + random 0.1);

{
  _hitPoint = configName _x;
  if (["Wheel", _hitPoint] call fn_findString != -1) then {
    _vehicle setHitPointDamage [_hitPoint, 0];
  };
} forEach (_vehicleType call getHitPoints);

[_vehicle] call vehicleSetup;
_vehicle setPosATL [_pos select 0, _pos select 1, 1.5];
_vehicle setVelocity [0,0,0.01];

[_vehicle, 15*60, 30*60, 45*60, 1000, 0, false, _markerPos] spawn vehicleRespawnCheck;

if (_vehicleType isKindOf "Offroad_01_armed_base_F") then {
  _vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
  _vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
  reload _vehicle;
};

if (_type > 1) then { _vehicle setVehicleAmmo (random 1.0) };
_vehicle setDir (random 360);

_object setObjectTexture [0, "#(rgb,8,8,3)color(0.804,0.788,0.647,0.6,CO)"];
_object setObjectTexture [1, "#(rgb,8,8,3)color(0.804,0.804,0.706,0.35,CO)"];
this animate ["Hide_Tent",1];
