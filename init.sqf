//
enableSaving [ false, false ];
spawnVehicle = compile preprocessfilelinenumbers "modules\population\functions\spawnVehicle.sqf";

civilianVehicles = [
  "C_Quadbike_01_F",
  "C_Hatchback_01_F",
  "C_Hatchback_01_sport_F",
  "C_SUV_01_F",
  "C_Offroad_01_F",
  "I_G_Offroad_01_F",
  "C_Van_01_box_F",
  "C_Van_01_transport_F"
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles = [
  "B_Quadbike_01_F",
  "O_Quadbike_01_F",
  "I_Quadbike_01_F",
  "I_G_Quadbike_01_F",
  "O_Truck_02_covered_F",
  "I_Truck_02_covered_F",
  "O_Truck_02_transport_F",
  "I_Truck_02_transport_F",
  "I_G_Offroad_01_armed_F"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles = [
  "I_Truck_02_Fuel_F",
  "O_Truck_02_Fuel_F",
  "I_Truck_02_medical_F",
  "O_Truck_02_medical_F",
  "B_MRAP_01_F",
  "O_MRAP_02_F",
  "I_MRAP_03_F"
];

[] execVM "modules\population\functions\T8_UnitsINIT.sqf";
[] execVM "modules\population\functions\T8_missionEXEC.sqf";
[] execVM "modules\population\functions\garbageCollector.sqf";
