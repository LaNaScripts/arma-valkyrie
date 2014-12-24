/*

  file: v_uavLoiter_pip
  about: create loitering UAV overhead, then create PIP render surface from UAV camera feed
  examples:

    // add action to object (i.e. laptop) to activate gunner control
    _someObject addAction ["USE",{player action ["SwitchToUAVGunner", uav]}];

*/

/* create render surface */
_bb = "Land_Billboard_F" createVehicle position player;
_bb setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];

/* create uav and make it fly */
uav = createVehicle ["B_UAV_01_F", _bb modelToWorld [0,100,100], [], 0, "FLY"];
createVehicleCrew uav;
uav lockCameraTo [_bb, [0]];
uav flyInHeight 100;

/* add loiter waypoint */
_wp = group uav addWaypoint [position _bb, 0];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointLoiterRadius 100;

/* create camera and stream to render surface */
cam = "camera" camCreate [0,0,0];
cam cameraEffect ["Internal", "Back", "uavrtt"];

/* attach cam to gunner cam position */
cam attachTo [uav, [0,0,0], "PiP0_pos"];

/* make it zoom in a little */
cam camSetFov 0.1;

/* switch cam to thermal */
"uavrtt" setPiPEffect [2];

/* adjust cam orientation */
addMissionEventHandler ["Draw3D", {
  _dir = (uav selectionPosition "PiP0_pos") vectorFromTo (uav selectionPosition "PiP0_dir");
  cam setVectorDirAndUp [_dir, _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]];
}];
