if (_this isKindOf "Man") then {
  _this call v_grpAAF_basic;
  //{deleteVehicle _x} forEach (crew _this);
};

/*

TODO: check what the default spawn radius is for t8 units
TODO: see how small we can get the nearEntities radius
TODO: abstract this into a single function for initializing any civilian or military crew
TODO: add support for multiple vehicles per group; split units as evenly as possible into number of groups equal to number of vehicles




//_this setVariable ["BIS_enableRandomization", false];

_vehicle = ((position _this) nearEntities [["Car"], 60]) select 0;

if (_this isKindOf "Man") then {
//sleep 30;
_this call v_grpAAF_basic;
_this moveInAny _vehicle;
} else {
{deleteVehicle _x} forEach (crew vehicle _this);
};

*/
