// These are the available fortifications. Add or take as you wish.

// Action text      - The text displayed by the action.
// Classname        - The classname of the object to be placed.
// Distance         - Minimum distance of the object from the player, in metres.
// Direction        - Direction the object will be rotated initially, in degrees (minimum 0, maximum 360).
// Direction range  - The range you can turn the object, in degrees (minimum 0, maximum 360).
//                    This means that the player will be able to set the direction of the object between `direction - direction_range / 2` and `direction + direction_range / 2` degrees.
//                    For example given 180 direction and 60 direction range, player will be able turn the object between 150 and 210 degrees.
// Code             - A piece of code that will be executed when the object placement is confirmed.
//                    Set it to {}, if you don't want to use it. The unit who confirmed the placement and the object placed, are passed as arguments to the code.
//                    An example code that hints the players name could look like {hint str (_this select 0);}.

plank_deploy_fortData = [

  // Action text                      |  Classname                            |  Distance     |  Direction     |  Direction Range  |  Code
  //--------------------------------------------------------------------------------------------------------------------------------------
  //["Small bunker",                        "Land_BagBunker_Small_F",               6,              180,                360,            {}],
  //["Bunker",                              "Land_BagBunker_Large_F",               8.5,            180,                60,             {}],
  //["Wide Sandbag fence",                  "Land_BagFence_Long_F",                 4,              0,                  360,            {}],
  //["H-Barrier watch tower",               "Land_HBarrierTower_F",                 15,             0,                  360,            {}],
  //["Short Sandbag fence",                 "Land_BagFence_Short_F",                3,              0,                  360,            {}],
  //["Razor Wire",                          "Land_Razorwire_F",                     6,              0,                  360,            {}],
  //["Concrete wall long",                  "Land_CncWall4_F",                      8,              0,                  360,            {}],
  //["Bunker Tower",                        "Land_BagBunker_Tower_F",               10,             0,                  360,            {}],
  ["Small Shack 1", "Land_Slum_House01_F", 10, 0, 360, {}],
  ["Small Shack 2", "Land_Slum_House02_F", 10, 0, 360, {}],
  ["Small Shack 3", "Land_Slum_House03_F", 10, 0, 360, {}],
  ["Small Shack 4", "Land_cargo_house_slum_F", 10, 0, 360, {}],
  ["Portable Work Light (Single)", "Land_PortableLight_single_F", 3, 0, 360, {}],
  ["Portable Work Light (Double)", "Land_PortableLight_double_F", 3, 0, 360, {}],
  ["Portable Generator", "Land_Portable_generator_F", 3, 0, 360, {}],
  ["Workstand", "Land_WorkStand_F", 3, 0, 360, {}],
  ["Generator", "Land_PowerGenerator_F", 3, 0, 360, {}],
  ["Portable Generator", "Land_Portable_generator_F", 3, 0, 360, {}],
  ["Construction Barrier", "Land_CncBarrier_F", 3, 0, 360, {}],
  ["Construction Barrier (Striped)", "Land_CncBarrier_stripes_F", 3, 0, 360, {}],
  ["Construction Barrier (Medium)", "Land_CncBarrierMedium_F", 3, 0, 360, {}],
  ["Construction Barrier (Medium)", "Land_CncBarrierMedium4_F", 3, 0, 360, {}],
  ["Tall Concrete Wall", "Land_CncWall1_F", 3, 0, 360, {}],
  ["Tall Concrete Wall (Long)", "Land_CncWall4_F", 3, 0, 360, {}],
  ["Short Concrete Wall", "Land_Concrete_SmallWall_4m_F", 3, 0, 360, {}],
  ["Short Concrete Wall (Long)", "Land_Concrete_SmallWall_8m_F", 3, 0, 360, {}],
  ["Firepit", "Land_FirePlace_F", 3, 0, 360, {}],
  ["Metal Barrel", "Land_MetalBarrel_F", 3, 0, 360, {}],
  ["Sunshade", "Land_Sunshade_F", 3, 0, 360, {}],
  ["Water Tank", "Land_WaterTank_F", 3, 0, 360, {}],
  ["Plastic Chair", "Land_ChairPlastic_F", 3, 0, 360, {}],
  ["Table Desk", "Land_TableDesk_F", 3, 0, 360, {}],
  ["Laptop", "Land_Laptop_device_F", 2, 0, 360, {}]
];
