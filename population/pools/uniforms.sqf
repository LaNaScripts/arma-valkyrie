/*

  name:   pools\uniforms.sqf
  author: http://devynspencer.github.io
  about:  uniform list based on type

*/

/*

[ // pools array index [0]
  [ // uniforms array index [0] - HEADGEAR
    [ // headgear array index [0] - balaclavas
      "Kio_Balaclava_blk",
      "Kio_Balaclava_blkSkull",
      "Kio_Balaclava_grn",
      "Kio_Balaclava_des",
      "Kio_Balaclava_multicam",
      "Kio_Balaclava_hex",
      "Kio_Balaclava_wcam",
      "Kio_Balaclava_urbcam"
    ], // headgear array index [0] - balaclavas
    [ // headgear array index [1] - shemags
      "H_Shemag_khk",
      "H_Shemag_tan",
      "H_Shemag_olive",
      "H_Shemag_olive_hs",
      "H_ShemagOpen_tan",
      "H_ShemagOpen_khk"
    ] // headgear array index [1] - shemags
  ], // uniforms array index [0] - HEADGEAR
  [ // uniforms array index [1] - GOGGLES
    [ // headgear array index [0] - glasses
      "..."
    ],
    [
      "..."
    ] // headgear array index [0] - glasses
  ], // uniforms array index [1] - GOGGLES
]

*/

// uniforms (civilian)
v_uniforms_c = [
  "U_C_FishermanOveralls",
  "U_C_WorkerOveralls",
  "U_C_Poor_1",
  "U_C_Poor_2",
  "U_C_Scientist",
  //"U_C_HunterBody_grn", //test
  //"U_C_HunterBody_brn", //test
  "U_C_Commoner2_1",
  "U_C_Commoner2_2",
  "U_C_Commoner2_3",
  "U_C_Fisherman",
  "U_C_Scavenger_2", // test
  "U_C_Scavenger_1", // test
  "U_C_Farmer"
];

// uniforms (military)
v_uniformsCoveralls = [
  "U_I_pilotCoveralls",
  "U_B_PilotCoveralls",
  "U_B_HeliPilotCoveralls",
  "U_O_PilotCoveralls",
  "U_B_HeliPilotCoveralls",
  "U_I_HeliPilotCoveralls"
];

v_uniformsGhillie = [
  "U_O_GhillieSuit",
  "U_B_GhillieSuit",
  "U_I_GhillieSuit"
];

v_uniformsGuerilla = [
  "U_BG_leader",
  "U_BG_Guerilla1_1",
  "U_BG_Guerilla2_1",
  "U_BG_Guerilla2_2",
  "U_BG_Guerilla2_3",
  "U_BG_Guerilla3_1",
  "U_BG_Guerilla3_2",
  "U_BG_Guerrilla_6_1"
];

v_uniforms_o = [
  "U_O_CombatUniform_ocamo",
  "U_O_SpecopsUniform_ocamo"
];

v_uniformsUrban_o = [
  "U_B_PilotCoveralls",
  "U_I_pilotCoveralls",
  "U_O_CombatUniform_oucamo"
];

// helmets
v_shemags = [
  "H_Shemag_khk",
  "H_Shemag_tan",
  "H_Shemag_olive",
  "H_Shemag_olive_hs",
  "H_ShemagOpen_tan",
  "H_ShemagOpen_khk"
];

v_balaclavas = [
  "Kio_Balaclava_blk",
  "Kio_Balaclava_blkSkull",
  "Kio_Balaclava_grn",
  "Kio_Balaclava_des",
  "Kio_Balaclava_multicam",
  "Kio_Balaclava_hex",
  "Kio_Balaclava_wcam",
  "Kio_Balaclava_urbcam"
];

// check diver team gear for masks
v_helmetsBreather = [
  "H_PilotHelmetFighter_B",
  "H_PilotHelmetFighter_O",
  "H_PilotHelmetFighter_I"
];

v_helmetsClosed = [
  "H_CrewHelmetHeli_B",
  "H_CrewHelmetHeli_O",
  "H_CrewHelmetHeli_I"
];

v_helmets_o = [
  "H_HelmetO_ocamo",
  "H_HelmetLeaderO_ocamo",
  "H_HelmetLeaderO_oucamo",
  "H_HelmetSpecO_ocamo",
  "H_HelmetSpecO_blk"
];

v_helmetsUrban_o = [
  "H_HelmetLeaderO_oucamo",
  "H_HelmetO_oucamo",
  "H_HelmetSpecO_blk"
];

// vests
v_vestsRebreather = [
  "V_RebreatherB",
  "V_RebreatherIR",
  "V_RebreatherIA"
];

v_vests_l = [
  "V_HarnessO_brn",
  "V_HarnessOGL_brn",
  "V_HarnessO_gry",
  "V_HarnessOGL_gry",
  "V_HarnessOSpec_brn",
  "V_HarnessOSpec_gry"
];

v_vests_m = [
  "V_TacVest_blk",
  "V_TacVest_brn",
  "V_TacVest_camo",
  "V_TacVest_oli",
  "V_TacVest_blk_POLICE"
];

v_vests_h = [
  "V_PlateCarrier1_blk",
  "V_PlateCarrier_Kerry",
  "V_PlateCarrierL_CTRG",
  "V_PlateCarrierIAGL_dgtl",
  "V_I_G_resistanceLeader_F",
  "V_PlateCarrierIA2_dgtl",
  "V_PlateCarrierIA1_dgtl"
];
