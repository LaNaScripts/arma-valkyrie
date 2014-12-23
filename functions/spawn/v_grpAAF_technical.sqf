/*

  file: v_grp_AAF_technical
  author: http://github.com/devynspencer
  about: creates a technical patrol

*/

{
  _x setVariable ["BIS_enableRandomization", false];
  _x spawn v_grpAAF_basic;
} forEach (crew vehicle _this);

/*
private [
"_vehicle",
"_missingCargo",
"_cargoCount",
"_driverCount",
"_gunnerCount",
"_commanderCount",
"_capacity",
"_unit"
];

//_vehicle = createVehicle ["O_G_Offroad_01_F", (position _this), [], 0, "NONE"];
//_this assignAsCargo vehicle _this;
//_this moveInAny _vehicle;

/*

_missingCargo = floor random 4;
_cargoCount = vehicle _this emptyPositions "cargo";
_driverCount = vehicle _this emptyPositions "driver";
_gunnerCount = vehicle _this emptyPositions "gunner";
_commanderCount = vehicle _this emptyPositions "commander";
_capacity = (_cargoCount - _missingCargo) + _driverCount + _gunnerCount + _commanderCount;

sleep 1;

for "_i" from 1 to _capacity do {
  _unit = (group _this) createUnit ["O_G_Soldier_F", (position _this), [], 0, "NONE"];
  _unit assignAsCargo _this;
  _unit moveInAny _this;
};

{
  _x setVariable ["BIS_enableRandomization", false];
  _x spawn v_grpAAF_basic;
} forEach (crew vehicle _this);
