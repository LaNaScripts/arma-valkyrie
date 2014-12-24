/*

  file: v_spawnSupport_uavRecon
  about: spawn an unarmed drone and either show fixed visual from drone or
    show enemy units within x radius of drone on minimap.

*/

_unit = ["B_UAV_02_F"] spawn v_spawnSupport; // returns unit?
_unit spawn v_disableUnitEngage;

_wp = group _unit addWaypoint [position player, 0];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointLoiterRadius 150; // test best radius

_uav lockCameraTo [player, [0]]; // test options with this
_uav flyInHeight 100;

// TODO: display PIP window on player GUI showing uav camera while UAV alive

// alternatively, add in item to allow access from feed (maybe just UAV terminal?)
// alternatively:

  // _unit spawn v_showNearUnit; // could enable minimap functionality or not. Visual only may be more immersive

/*

  References:
  - original from KK:

    _unit = createVehicle ["B_UAV_01_F", player modelToWorld [0,100,100], [], 0, "FLY"];
    createVehicleCrew _uav;
    _uav lockCameraTo [player, [0]]; // test options with this
    _uav flyInHeight 100;

    _wp = group _uav addWaypoint [position player, 0];
    _wp setWaypointType "LOITER";
    _wp setWaypointLoiterType "CIRCLE_L";
    _wp setWaypointLoiterRadius 150; // test best radius

*/
