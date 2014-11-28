/*
@name: pools\equipment\uniforms.sqf
@description: pool of uniforms and clothing to randomly select from
@author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
@params:
@returns: attached to a function with #include
*/

switch _rarity do {
  case "basic": {
    _items = [
      "U_C_FishermanOveralls",
      "U_C_WorkerOveralls",
      "U_C_Poor_1",
      "U_C_Poor_2",
      "U_C_Scientist",
      "U_C_HunterBody_grn",
      "U_C_HunterBody_brn",
      "U_C_Commoner2_1",
      "U_C_Commoner2_2",
      "U_C_Commoner2_3",
      "U_C_Fisherman",
      "U_C_Scavenger_2",
      "U_C_Scavenger_1",
      "U_C_Farmer",
      "H_Shemag_khk",
      "H_Shemag_tan",
      "H_Shemag_olive",
      "H_Shemag_olive_hs",
      "H_TurbanO_blk",         // verify correct model
      "H_ShemagOpen_tan",
      "H_ShemagOpen_khk"
    ];
  };

  case "common": {
    _items = [
      "U_BG_leader",
      "U_BG_Guerilla1_1",
      "U_BG_Guerilla2_1",
      "U_BG_Guerilla2_2",
      "U_BG_Guerilla2_3",
      "U_BG_Guerilla3_1",
      "U_BG_Guerilla3_2",
      "U_BG_Guerrilla_6_1",
      "U_I_pilotCoveralls",
      "U_B_PilotCoveralls",
      "U_B_HeliPilotCoveralls",
      "U_O_PilotCoveralls",
      "U_B_HeliPilotCoveralls",
      "U_I_HeliPilotCoveralls"
    ];
  };

  case "uncommon": {
    _items = [
      "V_TacVest_blk",
      "V_TacVest_brn",
      "V_TacVest_camo",
      "V_TacVest_oli",
      "V_TacVest_blk_POLICE",
      "V_PlateCarrier1_blk"
    ];
  };

  case "rare": {
    _items = [
      "U_O_GhillieSuit",
      "U_B_GhillieSuit",
      "U_I_GhillieSuit"
    ];
  };
};

/*
_uniformGhillie = [
  "U_O_GhillieSuit",
  "U_B_GhillieSuit",
  "U_I_GhillieSuit"
]

_uniformJumpsuit = [
  "U_I_pilotCoveralls",
  "U_B_PilotCoveralls",
  "U_B_HeliPilotCoveralls",
  "U_O_PilotCoveralls",
  "U_B_HeliPilotCoveralls",
  "U_I_HeliPilotCoveralls",
  // "U_C_WorkerCoveralls"  // test appearance
]

// test appearance, ultimately will be large pool of general
// purpose civilian clothing that 'blends' together

_uniformCivilian = [
"U_C_FishermanOveralls",
"U_C_WorkerOveralls",
"U_C_Poor_1"
"U_C_Poor_2"
"U_C_Scientist"
"U_C_HunterBody_grn"
"U_C_HunterBody_brn"
"U_C_Commoner2_1"
"U_C_Commoner2_2"
"U_C_Commoner2_3"
"U_C_Fisherman"
"U_C_Scavenger_2"
"U_C_Scavenger_1"
"U_C_Farmer"
]

_uniformUrban = [

]

_uniformGuerilla = [
"U_BG_leader",
"U_BG_Guerilla1_1",
"U_BG_Guerilla2_1",
"U_BG_Guerilla2_2",
"U_BG_Guerilla2_3",
"U_BG_Guerilla3_1",
"U_BG_Guerilla3_2",
"U_BG_Guerrilla_6_1"
];

_headShemag = [
"H_Shemag_khk",
"H_Shemag_tan",
"H_Shemag_olive",
"H_Shemag_olive_hs",
"H_TurbanO_blk",     // verify correct model
"H_ShemagOpen_tan",
"H_ShemagOpen_khk"
];

_vestLight = [
"V_TacVest_blk",
"V_TacVest_brn",
"V_TacVest_camo",
"V_TacVest_oli",
"V_TacVest_blk_POLICE"
];

_vestMedium = [
"V_PlateCarrier1_blk"
];
*/
