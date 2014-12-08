/*
  @name: spawnVehicles.sqf
  @description: spawn vehicles randomly within a zone
  @author: Deadbeat, AgentRev, modified for http://github.com/devynspencer/valkyrie.Altis
  @params: [marker, vehicleType]
  @returns:
*/

if (!isServer) exitWith {};

private [
  "_marker",
  "_pos",
  "_vehicleClass",
  "_vehicleType",
  "_vehicle",
  "_hitPoint"
];

_marker = [_this, 0, objNull, ""] call BIS_fnc_param; // REQUIRED

// temporary, replace with randomized safe position
// note: createVehicle allows for a random marker name to be used -- vehicles could be spawned globally, but spawning as a reaction to a player entering the zone is probably the better option

_pos = markerPos _marker;

// temporary, replace with random faction
_vehicles = v_vehicles select 0;
_type = _vehicles call BIS_fnc_selectRandom;

// create vehicle
_vehicle = createVehicle [_type, _pos, [], 10, "None"];

/*

//_vehicle setDamage (random 0.5); // setDamage must always be called before vehicleSetup

//Set Vehicle Attributes
_vehicle setFuel (0.2 + random 0.1);

// Reset wheel damage
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

// remove ammo from armored

// Reset armed Offroad to 1 mag
if (_vehicleType isKindOf "Offroad_01_armed_base_F") then {
  _vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
  _vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
  reload _vehicle;
};

if (_type > 1) then { _vehicle setVehicleAmmo (random 1.0) };
*/

_vehicle setDir (random 360);
//[_vehicle] call randomWeapons;

*/
