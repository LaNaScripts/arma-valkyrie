/*

  @file:
    - pools\equipment\weapons.sqf

  @author:
  - created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis

  @description:
    - pool of vehicles to randomly select from

  @params:
    - N/A

  @returns:
    - returns a list of subpools
    - subpools can be joined into an array to randomly select from

  @examples:

    pl_vehicles = compile preprocessfilelinenumbers "modules\population\pools\vehicles.sqf";

    _rand       = floor random 3;

    _subpools = for _i from 1 to _rand {
      _sub = pl_vehicles call BIS_fnc_selectRandom;
      _vehicles pushBack _sub;
    }

    _randomVehicle = _vehicles call BIS_fnc_selectRandom

*/

/*
// light ATVs, motorcycles, & bicycles
_wheeledLight_c = [
  "C_Quadbike_01_F"
];

// cars, SUVs & offroad trucks
_wheeledMedium_c = [
  "C_Hatchback_01_F",
  "C_Hatchback_01_sport_F", // reskin this, ugh
  "C_SUV_01_F",
  "C_Offroad_01_F",
  "I_G_Offroad_01_F",
  "C_Van_01_box_F",
  "C_Van_01_transport_F"
];

// construction vehicles, buses, & large trucks
_wheeledHeavy_c = [

];

// military scout vehicles
_wheeledLight_m = [
  "B_Quadbike_01_F",
  "O_Quadbike_01_F",
  "I_Quadbike_01_F",
  "I_G_Quadbike_01_F"
];

// military cars & troop transports without armor
_wheeledMedium_m = [
  "I_G_Offroad_01_armed_F"
];

// regular supply trucks
_supply_m = [
  "O_Truck_02_covered_F",
  "I_Truck_02_covered_F",
  "O_Truck_02_transport_F",
  "I_Truck_02_transport_F"
];

// supply trucks with specific cargo (medical, fuel, ammo)
_supplySpecial_m = [
  "I_Truck_02_Fuel_F",
  "O_Truck_02_Fuel_F",
  "I_Truck_02_medical_F",
  "O_Truck_02_medical_F",
  "B_MRAP_01_F",
  "O_MRAP_02_F",
  "I_MRAP_03_F"
];

// heavier MRAPs & unarmed or disarmed APCs
_armorLight_m = [

];

// anti-air + armed APCs
_armorMedium_m = [

];

// tanks
_armorHeavy_m = [

];

// civilian boats
_boats_c = [
  "C_Rubberboat",
  "C_Boat_Civil_01_F",
  "C_Boat_Civil_01_police_F",
  "C_Boat_Civil_01_rescue_F"
];

// military boats
_boats_m = [
  "B_Lifeboat",
  "O_Lifeboat",
  "B_SDV_01_F",
  "O_SDV_01_F",
  "I_SDV_01_F",
  "B_Boat_Transport_01_F",
  "O_Boat_Transport_01_F",
  "I_Boat_Transport_01_F",
  "I_G_Boat_Transport_01_F",
  "B_Boat_Armed_01_minigun_F",
  "O_Boat_Armed_01_hmg_F",
  "I_Boat_Armed_01_minigun_F"
];

// static weapon emplacements
_static_m = [
  "B_Mortar_01_F",
  "O_Mortar_01_F",
  "I_Mortar_01_F",
  "I_G_Mortar_01_F"
];

// civilian helicopters
_helicopters_c = [
  "C_Heli_Light_01_civil_F" // make "locked" skins available
];

// military helicopters
_helicopters_m = [
  "B_Heli_Light_01_F",
  "O_Heli_Light_02_unarmed_F",
  "I_Heli_light_03_unarmed_F"
];

// civilian planes
// - find reskin of military plane or standalone
_planes_c = [

];

// military planes
_planes_m = [
  "B_Plane_CAS_01_F",
  "O_Plane_CAS_02_F",
  "I_Plane_Fighter_03_CAS_F"
];
