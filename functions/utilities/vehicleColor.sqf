/*

about: changes a vehicle's texture to an RGB color value

"B_G_Offroad_01_F"
- "HidePolice"  // police lights on roof and grill
- "HideServices" // yellow roof lights and bullbar and rear rollcage, tools and bits in rear
- "HideBackpacks" // backpacks hanging on side of vehicle
- "HideBumper1" // flat iron bar style bumper
- "HideBumper2" // round bullbar bumper with winch
- "HideConstruction" // rollcage in rear
- "HideDoor1" // drivers door
- "HideDoor2" // passenger door (also needs the door glass hidden - HideGlass2")
- "HideDoor3" // rear flap
- "HideGlass2" // passenger door glass

// CIVILIAN

"B_G_Offroad_01_F"
"B_G_Offroad_01_repair_F"
"B_G_Offroad_01_armed_F"

"B_Quadbike_01_F"

C_Hatchback_01_F

C_SUV_01_F

"C_Van_01_box_F"
"B_G_Van_01_transport_F"
"B_G_Van_01_fuel_F"

"B_Truck_01_transport_F"
"B_Truck_01_covered_F"
"B_Truck_01_box_F"
"B_Truck_01_ammo_F"
"B_Truck_01_fuel_F"
"B_Truck_01_medical_F"

"B_UGV_01_F"

"B_Boat_Transport_01_F"
"C_Rubberboat"
"B_Lifeboat"
"B_SDV_01_F"
"C_Boat_Civil_01_F"
"C_Boat_Civil_01_police_F"
"C_Boat_Civil_01_rescue_F"

"C_Heli_Light_01_civil_F"

// EAST

"O_Heli_Light_02_unarmed_F"

"O_Truck_02_covered_F"
"O_Truck_02_transport_F"
"O_Truck_02_box_F"




// unable to change textures
"O_Truck_03_transport_F"
"O_Truck_03_covered_F"
"O_Truck_03_repair_F"
"O_Truck_03_device_F"
"O_Truck_03_ammo_F"
"O_Truck_03_fuel_F"
"O_Truck_03_medical_F"

*/

/*

TODO: Add params

_class = [_this, 0, "B_G_Offroad_01_F"] call BIS_fnc_param;
_index = [_this, 1, 0, [0, 1, 2, 3, 4]] call BIS_fnc_param;
_color = [_this, 2, []] call BIS_fnc_param;
_option = [_this, 3, ""] call BIS_fnc_param;

*/

// STEEL
_class = "O_Truck_02_covered_F";
_object = _class createVehicle position player;
_object setVariable ["BIS_enableRandomization", false];
_object setObjectTexture [0, "#(rgb,8,8,3)color(1,1,1,0.1)"];

// O_Truck_02_covered_F => SAND
_class = "O_Truck_02_covered_F";
_object = _class createVehicle position player;
_object setVariable ["BIS_enableRandomization", false];
_object setObjectTexture [0, "#(rgb,8,8,3)color(0.804,0.745,0.439,0.38,CO)"];
_object setObjectTexture [0, "#(rgb,8,8,3)color(0.804,0.745,0.439,0.38,CO)"];

// O_Truck_02_transport_F => LIGHT SAND
_class = "O_Truck_02_transport_F";
_object = _class createVehicle position player;
_object setVariable ["BIS_enableRandomization", false];
_object setObjectTexture [0, "#(rgb,8,8,3)color(0.804,0.745,0.439,0.38)"];

// O_Truck_02_transport_F => DARK SAND
_class = "O_Truck_02_transport_F";
_object = _class createVehicle position player;
_object setVariable ["BIS_enableRandomization", false];
_object setObjectTexture [0, "#(rgb,8,8,3)color(0.804,0.745,0.439,0.28)"];


/*

PROCEDURAL TEXTURES

// no spaces inside parentheses: they cause the texture to load incorrectly
_object setObjectTexture [_index, "#(rgb,_height,_width,_mipmaps)color(_red,_green,_blue,_alpha)"];

i.e.

_object setObjectTexture [0, "#(rgb,8,8,3)color(0.804,0.745,0.439,0.38)"];

VEHICLE ANIMATE STATES

_object animate [_option, 0];

i.e.

_vehicle = "B_G_Offroad_01_F";
_vehicle animate ["HidePolice", 0];

*/

/*

_colors = [
["light slate gray", ],
["slate gray", ],
["dark steel blue", ],
["light sky blue", ],
["olive", ],
["dark olive", ],
["gray yellow light", ],
["gray yellow", ],
["gray yellow dark", ],
["khaki", 0.804, 0.745, 0.439],
["khaki dark", 0.545, 0.506, 0.298]
];

_object = [_this, 0, objNull] call BIS_fnc_param;
_color = [_this, 1, ""] call BIS_fnc_param;
//_overlay = [_this, 2, ""] call BIS_fnc_param; // semi-transparent overlay a la rvmaps

_colorName = _color select 0;
_red = _color select 1;
_green = _color select 2;
_blue = _color select 3;
_alpha = 1;

// translate from color name to rgb values

showAllObjectTextures = {

_class = [_this, 0, "B_MRAP_01_hmg_F"] call BIS_fnc_param;
_object = _class createVehicle position player;
_object setVariable ["BIS_enableRandomization", false];
_textures = getObjectTextures _object // command not yet usable

{
_color = random 1;
_object setObjectTexture [_x, "#(rgb,8,8,3)color(_color, _color, _color, 1)"];

} forEach _textures;

hint str [format "This object has %1 texture(s)", (count _textures)];
};
