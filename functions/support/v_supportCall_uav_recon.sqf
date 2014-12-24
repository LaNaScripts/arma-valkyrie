/*

  file: v_spawnSupport_uavRecon
  about: spawn an unarmed drone and either show fixed visual from drone or
    show enemy units within x radius of drone on minimap.

*/

player addEventHandler ["Fired", {
  _null = _this spawn {

    _type = _this select 4;

    if (_type isEqualTo "B_IRStrobe") then {
      [West, "HQ"] sideChat "Request confirmed.";
      [West, "HQ"] sideChat "Dispatching UAV recon to marked position. Over.";

      _object = _this select 6;
      _position = position _object;

      _origin = [_position, 1000, floor random 360] call BIS_fnc_relPos;
      _unit = [_origin, 180, "B_UAV_02_F", side player] call BIS_fnc_spawnVehicle;

      uavReconActual = _unit select 0;
      _unitGroup = _unit select 2;

      _wp = _unitGroup addWaypoint [position player, 0];
      _wp setWaypointType "LOITER";
      _wp setWaypointLoiterType "CIRCLE_L";
      _wp setWaypointLoiterRadius 150;

      uavReconActual lockCameraTo [player, [0]];
      uavReconActual flyInHeight 250; // adjust based on tests
      player addAction ["UAV Console", {player action ["SwitchToUAVGunner", uavReconActual]}];
    };
  };
}];

// TODO: display PIP window on player GUI showing uav camera while UAV alive
// alternatively, add in item to allow access from feed (maybe just UAV terminal?)
// _unit spawn v_showNearUnit; // could enable minimap functionality or not. Visual only may be more immersive
