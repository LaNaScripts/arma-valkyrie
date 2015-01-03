/*

  name:   pools\vehicles.sqf
  author: http://devynspencer.github.io
  about:  vehicle list based on type

*/

v_vehicles = [
  [
    [ // tier 1 (common)
      "C_Quadbike_01_F",
      "C_Hatchback_01_F",
      "C_Hatchback_01_sport_F", // reskin this, ugh
      "C_Van_01_box_F",
      "C_Van_01_transport_F"
    ], // tier 1 (common)

    [  // tier 2 (uncommon)
      "C_Offroad_01_F",
      "C_SUV_01_F"
    ], // tier 2 (uncommon)

    [  // tier 3 (rare)
      "I_G_Offroad_01_F",
      "C_Heli_Light_01_civil_F"
    ]  // tier 3 (rare)
  ] // CIVILIAN - index 0
  //[], // EAST - index 1
  //[], // GUER - index 2
];

/*

v_veh_WheeledLight_m = [
  "B_Quadbike_01_F",
  "O_Quadbike_01_F",
  "I_Quadbike_01_F",
  "I_G_Quadbike_01_F",
  "I_G_Offroad_01_armed_F"
];

v_veh_Supply_m = [
  "O_Truck_02_covered_F",
  "I_Truck_02_covered_F",
  "O_Truck_02_transport_F",
  "I_Truck_02_transport_F"
];

v_veh_SupplySpecial_m = [
  "I_Truck_02_Fuel_F",
  "O_Truck_02_Fuel_F",
  "I_Truck_02_medical_F",
  "O_Truck_02_medical_F",
  "B_MRAP_01_F",
  "O_MRAP_02_F",
  "I_MRAP_03_F"
];

boats_c = [
  "C_Rubberboat",
  "C_Boat_Civil_01_F",
  "C_Boat_Civil_01_police_F",
  "C_Boat_Civil_01_rescue_F"
];

// military boats
boats_m = [
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
static_m = [
  "B_Mortar_01_F",
  "O_Mortar_01_F",
  "I_Mortar_01_F",
  "I_G_Mortar_01_F"
];

// civilian helicopters
helicopters_c = [
  "C_Heli_Light_01_civil_F" // make "locked" skins available
];

// military helicopters
helicopters_m = [
  "B_Heli_Light_01_F",
  "O_Heli_Light_02_unarmed_F",
  "I_Heli_light_03_unarmed_F"
];

// civilian planes
// - find reskin of military plane or standalone
planes_c = [

];

// military planes
planes_m = [
  "B_Plane_CAS_01_F",
  "O_Plane_CAS_02_F",
  "I_Plane_Fighter_03_CAS_F"
];

*/
