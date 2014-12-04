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

_marker = _this select 0;
//_pos = [_markerPos, 2, 25, ( if (_type == 1) then { 2 } else { 5 } ), 0, 60 * (pi / 180), 0, [], [_markerPos]] call BIS_fnc_findSafePos;
_pos = getMarkerPos _marker;

if (count _this > 1) then {
  _vehicleType = [_this, 1, objNull, ""] call BIS_fnc_param;
} else {
  _vehicleClass = [
    pl_veh_WheeledLight_c,
    pl_veh_WheeledMedium_c,
    pl_veh_WheeledHeavy_c,
    pl_veh_WheeledLight_m,
    pl_veh_Supply_m,
    pl_veh_SupplySpecial_m
  ] call BIS_fnc_selectRandom;

  if (count _vehicleClass > 1) then {
    _vehicleType = _vehicleClass call BIS_fnc_selectRandom;
  } else {
    _vehicleType = "C_Quadbike_01_F";
    hint "Vehicle spawn error, check pools\vehicles.sqf";
    hint "Spawning a quadbike instead ...";
  };

  /*

  // eventually replace random spawns with weighted spawns
  // with a low chance to spawn heavier armor or air vehicles
  switch (true) do {
    case (_num < 15): { _vehicleType = mediumMilitaryVehicles call BIS_fnc_selectRandom; _type = 2 };
    case (_num < 50): { _vehicleType = lightMilitaryVehicles call BIS_fnc_selectRandom; _type = 1 };
    default           { _vehicleType = civilianVehicles call BIS_fnc_selectRandom; _type = 0 };
  };

  */
};

_vehicle = createVehicle [_vehicleType, _pos, [], 200, "None"];

//_vehicle setDamage (random 0.5); // setDamage must always be called before vehicleSetup

/*
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

//Set Vehicle Attributes
_vehicle setFuel (0.2 + random 0.1);

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
