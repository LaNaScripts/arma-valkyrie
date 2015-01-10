/*

  about: randomly populates the world with

  - enemies (random equipment, weapons, & behaviors)
  - civilians (rescuable, random clothing)
  - containers
  - camp (valuable equipment guarded by loitering enemies)
  - locations (building / cover / debris objects)
  - vehicles (valuable vehicles guarded by enemies)
  - resource objects
  - objectives (objects, enemies, tasks, & logic)

*/

genEnemies = {
  // generate a random anchor pos and marker, away from the player
  _dist = 1000;
  _anchor = [player, floor random _dist, floor random 360] call BIS_fnc_relPos;

  // create "?" marker to give player a general idea of enc location
  _encType = "ENM";
  _mkrName = format ["%1_%2_%3", _encType, str _anchor, floor random 1000];

  _mkr = createMarker [_mkrName, _anchor];
  _mkr setMarkerType "hd_unknown";
  _mkr setMarkerAlpha 1;
  _mkr setMarkerColor "ColorOrange";

  // TODO: create a generic task to investigate the location

  // find a suitable location near the anchor pos
  _pos = [_anchor, 50] call SHK_pos;
  if !(count _pos > 0) then {
    _pos = _anchor;
  };

  // determine the number of enemies to spawn
  _count = ceil random 5;

  // create group
  _group = createGroup EAST;

  // create enemies
  _gearHead = [
    "H_Cap_red",
    "H_Cap_blu",
    "H_Cap_oli",
    "H_Cap_headphones",
    "H_Cap_tan",
    "H_Cap_blk",
    "H_Cap_blk_CMMG",
    "H_Cap_brn_SPECOPS",
    "H_Cap_tan_specops_US",
    "H_Cap_khaki_specops_UK",
    "H_Cap_grn",
    "H_Cap_grn_BI",
    "H_Cap_blk_Raven",
    "H_Cap_blk_ION",
    "H_Cap_oli_hs",
    "H_Cap_press",
    "H_MilCap_ocamo",
    "H_MilCap_mcamo",
    "H_MilCap_oucamo",
    "H_MilCap_rucamo",
    "H_MilCap_gry",
    "H_MilCap_dgtl",
    "H_MilCap_blue",
    "H_Bandanna_surfer",
    "H_Bandanna_khk",
    "H_Bandanna_khk_hs",
    "H_Bandanna_cbr",
    "H_Bandanna_sgg",
    "H_Bandanna_gry",
    "H_Bandanna_camo",
    "H_Bandanna_mcamo",
    "H_Shemag_khk",
    "H_Shemag_tan",
    "H_Shemag_olive",
    "H_Shemag_olive_hs",
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Beret_blk",
    "H_Beret_blk_POLICE",
    "H_Beret_red",
    "H_Beret_grn",
    "H_Beret_grn_SF",
    "H_Beret_brn_SF",
    "H_Beret_ocamo",
    "H_Beret_02",
    "H_Beret_Colonel",
    "H_Watchcap_blk",
    "H_Watchcap_khk",
    "H_Watchcap_camo",
    "H_Watchcap_sgg",
    "H_StrawHat",
    "H_StrawHat_dark",
    "H_Hat_blue",
    "H_Hat_brown",
    "H_Hat_camo",
    "H_Hat_grey",
    "H_Hat_checker",
    "H_Hat_tan",
    "H_BandMask_blk",
    "H_BandMask_khk",
    "H_BandMask_reaper",
    "H_BandMask_demon",
    "H_RacingHelmet_1_F",
    "H_RacingHelmet_2_F",
    "H_RacingHelmet_3_F",
    "H_RacingHelmet_4_F",
    "H_RacingHelmet_1_black_F",
    "H_RacingHelmet_1_blue_F",
    "H_RacingHelmet_1_green_F",
    "H_RacingHelmet_1_red_F",
    "H_RacingHelmet_1_white_F",
    "H_RacingHelmet_1_yellow_F",
    "H_RacingHelmet_1_orange_F",
    "H_Cap_marshal"
  ];

  _gearBody = [
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_Guerilla3_2",
    "U_IG_leader",
    "U_IG_Menelaos",
    "U_Marshal",
    "U_NikosAgedBody",
    "U_Rangemaster",
    "U_NikosBody",
    "U_OrestesBody",
    "U_Competitor",
    "U_OI_Scientist",
    "U_C_Poloshirt_b",
    "U_C_Poloshirt_b",
    "U_C_Poloshirt_s",
    "U_C_Poloshirt_t",
    "U_C_Poloshirt_s",
    "U_C_Poloshirt_r",
    "U_C_Commoner1_1",
    "U_C_Commoner1_2",
    "U_C_Commoner1_3",
    "U_C_Novak",
    "U_C_Poor_1",
    "U_C_Poor_2",
    "U_C_Scavenger_1",
    "U_C_Scavenger_2",
    "U_C_Farmer",
    "U_C_Fisherman",
    "U_C_WorkerOveralls",
    "U_C_FishermanOveralls",
    "U_C_WorkerCoveralls",
    "U_C_HunterBody_g",
    "U_C_HunterBody_b",
    "U_C_Commoner2_1",
    "U_C_Commoner2_2",
    "U_C_Commoner2_3",
    "U_C_PriestBody",
    "U_C_Poor_shorts_1",
    "U_C_Poor_shorts_2",
    "U_C_Commoner_s",
    "U_C_ShirtSurfer_s",
    "U_C_TeeSurfer_shorts_1",
    "U_C_TeeSurfer_shorts_2",
    "U_C_Journalist",
    "U_C_Scientist",
    "U_C_Driver_1",
    "U_C_Driver_2",
    "U_C_Driver_3",
    "U_C_Driver_4",
    "U_C_Driver_1_b",
    "U_C_Driver_1_b",
    "U_C_Driver_1_g",
    "U_C_Driver_1_r",
    "U_C_Driver_1_w",
    "U_C_Driver_1_y",
    "U_C_Driver_1_o"
  ];

  _gearChest = [
    "V_Press_F",
    "V_TacVest_khk",
    "V_TacVest_brn",
    "V_TacVest_oli",
    "V_TacVest_blk",
    "V_TacVest_camo",
    "V_TacVest_blk_POLICE",
    "V_TacVestIR_blk",
    "V_TacVestCamo_khk",
    "V_I_G_resistanceLeader_F",
    "V_Rangemaster_belt",
    "V_BandollierB_khk",
    "V_BandollierB_cbr",
    "V_BandollierB_rgr",
    "V_BandollierB_blk",
    "V_BandollierB_oli"
  ];

  _gearBack = [
    "B_HuntingBackpack"
  ];

  _gearFace = [
    "G_Balaclava_blk",
    "G_Balaclava_lowprofile",
    "G_Balaclava_combat",
    "G_Balaclava_oli",
    "G_Bandanna_aviator",
    "G_Bandanna_beast",
    "G_Bandanna_tan",
    "G_Bandanna_sport",
    "G_Bandanna_blk",
    "G_Bandanna_oli",
    "G_Bandanna_shades",
    "G_Diving",
    "G_Diving",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Sport_Blackred",
    "G_Tactical_Clear",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Combat",
    "G_Lowprofile",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Squares",
    "G_Squares_Tinted",
    "G_Sport_BlackWhite",
    "G_Sport_Blackyellow",
    "G_Sport_Greenblack",
    "G_Sport_Checkered",
    "G_Sport_Red",
    "G_Tactical_Black"
  ];

  _gearWeapons = [
    ["hgun_P07_F", "16Rnd_9x21_Mag"],
    ["hgun_Rook40_F", "16Rnd_9x21_Mag"],
    ["hgun_ACPC2_F", "9Rnd_45ACP_Mag"],
    ["hgun_Pistol_heavy_01_F", "11Rnd_45ACP_Mag"],
    ["hgun_Pistol_heavy_02_F", "6Rnd_45ACP_Cylinder"],
    ["hgun_PDW2000_F", "16Rnd_9x21_Mag"],
    ["SMG_01_F", "30Rnd_45ACP_Mag_SMG_01_tracer_green"],
    ["SMG_02_F", "30Rnd_9x21_Mag"]
  ];

  for "_i" from 0 to _count do {
    // TODO: determine enemy skill

    // randomly spread out the enemies
    _spread = ceil random 10;
    _posActual = [_pos, _spread, floor random 360] call BIS_fnc_relPos;

    _enemyClass = "O_Soldier_F";
    _unit = _enemyClass createUnit [_posActual, _group];

    // remove all default enemy gear
    removeAllItems _unit;
    removeAllWeapons _unit;
    removeMagazines _unit;
    removeUniform _unit;
    Removevest _unit;
    removeHeadgear _unit;
    removeGoggles _unit;
    removeBackpack _unit;

    // randomly determine if enemy will have head/chest/back/face items
    _headChance = floor random 100;
    _chestChance = floor random 100;
    _backChance = floor random 100;
    _faceChance = floor random 100;

    // add random gear
    if _headChance > 60 then {
      if (count _gearHead > 0) then {
        _head = _gearHead call BIS_fnc_selectRandom;
        _unit addHeadgear _head;
      };
    };

    if (count _gearBody > 0) then {
      _body = _gearBody call BIS_fnc_selectRandom;
      _unit forceAddUniform _body;
    };

    if _chestChance > 50 then {
      if (count _gearChest > 0) then {
        _chest = _gearChest call BIS_fnc_selectRandom;
        _unit addVest _chest;
      };
    };

    if _backChance > 90 then {
      if (count _gearBack > 0) then {
        _back = _gearBack call BIS_fnc_selectRandom;
        _unit addBackpack _back;
      };
    };

    if _faceChance > 20 then {
      if (count _gearFace > 0) then {
        _face = _gearFace call BIS_fnc_selectRandom;
        _unit addGoggles _face;
      };
    };

    if (count _gearWeapons > 0) then {
      // obtain weapon array containing weapon & magazine class names
      _weaponArray = _gearWeapons call BIS_fnc_selectRandom;
      _weapon = _weaponArray select 0;
      _magazine = _weaponArray select 1;
      _unit addWeapon _weapon;

      _mags = ceil random 4;
      for "_i" from 0 to _mags do {
        _unit addMagazine _magazine;
      };
    };
  };

  // TODO: determine group behavior
  _patrolDist = 1000;
  [_group, _pos, _patrolDist] call bis_fnc_taskPatrol;
};

genCamp = {

  // spawn a bonfire with large smoke plume
    // create a large bonfire object in the middle of the camp - placeholder for now? Or create it with a particle affect ...
    // [_bonfire, "mixed", "large"] call createSmokeColumn;

  // spawn camp objects around bonfire
  // determine the type of camp enemies to spawn
  // set enemies to loiter near camp
  // determine the number of enemies to spawn
  // create group
  // create enemies
};

genCivilians = {

  // create rescue task
  // create rescue logic

  // generate a random anchor pos and marker, away from the player
  _dist = 1000;
  _anchor = [player, floor random _dist, floor random 360] call BIS_fnc_relPos;

  // create "?" marker to give player a general idea of enc location
  _encType = "CIV";
  _mkrName = format ["%1_%2_%3", _encType, str _anchor, floor random 1000];

  _mkr = createMarker [_mkrName, _anchor];
  _mkr setMarkerType "hd_unknown";
  _mkr setMarkerAlpha 1;
  _mkr setMarkerColor "ColorOrange";

  // TODO: create a generic task to investigate the location

  // attempt find a suitable location near the anchor pos
  _pos = [_anchor, 50] call SHK_pos;
  if !(count _pos > 0) then {
    _pos = _anchor;
  };

  // determine the number of enemies to spawn
  _count = ceil random 5;

  // create group
  _group = createGroup CIVILIAN;

  // create enemies
  _gearHead = [
    "H_Cap_red",
    "H_Cap_blu",
    "H_Cap_oli",
    "H_Cap_headphones",
    "H_Cap_tan",
    "H_Cap_blk",
    "H_Cap_blk_CMMG",
    "H_Cap_brn_SPECOPS",
    "H_Cap_tan_specops_US",
    "H_Cap_khaki_specops_UK",
    "H_Cap_grn",
    "H_Cap_grn_BI",
    "H_Cap_blk_Raven",
    "H_Cap_blk_ION",
    "H_Cap_oli_hs",
    "H_Cap_press",
    "H_Watchcap_blk",
    "H_Watchcap_khk",
    "H_Watchcap_camo",
    "H_Watchcap_sgg",
    "H_StrawHat",
    "H_StrawHat_dark",
    "H_Hat_blue",
    "H_Hat_brown",
    "H_Hat_camo",
    "H_Hat_grey",
    "H_Hat_checker",
    "H_Hat_tan",
    "H_Cap_marshal"
  ];

  _gearBody = [
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_Guerilla3_2",
    "U_IG_leader",
    "U_IG_Menelaos",
    "U_Marshal",
    "U_NikosAgedBody",
    "U_Rangemaster",
    "U_NikosBody",
    "U_OrestesBody",
    "U_Competitor",
    "U_OI_Scientist",
    "U_C_Poloshirt_b",
    "U_C_Poloshirt_b",
    "U_C_Poloshirt_s",
    "U_C_Poloshirt_t",
    "U_C_Poloshirt_s",
    "U_C_Poloshirt_r",
    "U_C_Commoner1_1",
    "U_C_Commoner1_2",
    "U_C_Commoner1_3",
    "U_C_Novak",
    "U_C_Poor_1",
    "U_C_Poor_2",
    "U_C_Scavenger_1",
    "U_C_Scavenger_2",
    "U_C_Farmer",
    "U_C_Fisherman",
    "U_C_WorkerOveralls",
    "U_C_FishermanOveralls",
    "U_C_WorkerCoveralls",
    "U_C_HunterBody_g",
    "U_C_HunterBody_b",
    "U_C_Commoner2_1",
    "U_C_Commoner2_2",
    "U_C_Commoner2_3",
    "U_C_PriestBody",
    "U_C_Poor_shorts_1",
    "U_C_Poor_shorts_2",
    "U_C_Commoner_s",
    "U_C_ShirtSurfer_s",
    "U_C_TeeSurfer_shorts_1",
    "U_C_TeeSurfer_shorts_2",
    "U_C_Journalist",
    "U_C_Scientist",
    "U_C_Driver_1",
    "U_C_Driver_2",
    "U_C_Driver_3",
    "U_C_Driver_4",
    "U_C_Driver_1_b",
    "U_C_Driver_1_b",
    "U_C_Driver_1_g",
    "U_C_Driver_1_r",
    "U_C_Driver_1_w",
    "U_C_Driver_1_y",
    "U_C_Driver_1_o"
  ];

  _gearChest = [
    "V_Press_F",
    "V_TacVest_khk",
    "V_TacVest_brn",
    "V_TacVest_oli",
    "V_TacVest_blk",
    "V_TacVest_camo",
    "V_TacVest_blk_POLICE",
    "V_TacVestIR_blk",
    "V_TacVestCamo_khk",
    "V_I_G_resistanceLeader_F",
    "V_Rangemaster_belt"
  ];

  _gearBack = [
    "B_HuntingBackpack"
  ];

  _gearFace = [
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Sport_Blackred",
    "G_Tactical_Clear",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Combat",
    "G_Lowprofile",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Squares",
    "G_Squares_Tinted",
    "G_Sport_BlackWhite",
    "G_Sport_Blackyellow",
    "G_Sport_Greenblack",
    "G_Sport_Checkered",
    "G_Sport_Red",
    "G_Tactical_Black"
  ];

  for "_i" from 0 to _count do {
    // TODO: determine enemy skill

    // randomly spread out the civilians
    _spread = ceil random 3;
    _posActual = [_pos, _spread, floor random 360] call BIS_fnc_relPos;

    _civClass = "C_man_1";
    _unit = _civClass createUnit [_posActual, _group];

    // remove all default civilians gear
    removeAllItems _unit;
    removeAllWeapons _unit;
    removeMagazines _unit;
    removeUniform _unit;
    Removevest _unit;
    removeHeadgear _unit;
    removeGoggles _unit;
    removeBackpack _unit;

    // randomly determine if enemy will have head/chest/back/face items
    _headChance = floor random 100;
    _chestChance = floor random 100;
    _backChance = floor random 100;
    _faceChance = floor random 100;

    // add random gear
    if _headChance > 60 then {
      if (count _gearHead > 0) then {
        _head = _gearHead call BIS_fnc_selectRandom;
        _unit addHeadgear _head;
      };
    };

    if (count _gearBody > 0) then {
      _body = _gearBody call BIS_fnc_selectRandom;
      _unit forceAddUniform _body;
    };

    if _chestChance > 50 then {
      if (count _gearChest > 0) then {
        _chest = _gearChest call BIS_fnc_selectRandom;
        _unit addVest _chest;
      };
    };

    if _backChance > 90 then {
      if (count _gearBack > 0) then {
        _back = _gearBack call BIS_fnc_selectRandom;
        _unit addBackpack _back;
      };
    };

    if _faceChance > 20 then {
      if (count _gearFace > 0) then {
        _face = _gearFace call BIS_fnc_selectRandom;
        _unit addGoggles _face;
      };
    };
  };

  // instruct civilians to loiter around the spawn area
  _wp = _group addWaypoint [_pos, 1];
  _wp setWPPos _pos;
  _wp setWaypointType "LOITER";
  _wp setWaypointLoiterType "CIRCLE";

  // generate random debris near civilians (CAMP or STRANDED)
  _strandedObj = [
    "Land_Wreck_Car_F",
    "Land_Wreck_Car2_F",
    "Land_Wreck_Car3_F",
    "Land_Wreck_CarDismantled_F",
    "Land_Wreck_Offroad_F",
    "Land_Wreck_Offroad2_F",
    "Land_Wreck_Plane_Transport_01_F",
    "Land_Wreck_Truck_dropside_F",
    "Land_Wreck_Truck_F",
    "Land_Wreck_UAZ_F",
    "Land_Wreck_Ural_F",
    "Land_Wreck_Van_F"
  ];

  _strandedDebris = [
    "Land_WoodenBox_F",
    "Land_LuggageHeap_01_F",
    "Land_LuggageHeap_02_F",
    "Land_LuggageHeap_03_F",
    "Land_LuggageHeap_04_F",
    "Land_LuggageHeap_05_F",
    "Land_Pallet_MilBoxes_F",
    "Land_Pallets_F",
    "Land_Pallets_stack_F",
    "Land_PaperBox_closed_F",
    "Land_PaperBox_open_empty_F",
    "Land_PaperBox_open_full_F",
    "Land_ExtensionCord_F",
    "Land_FMradio_F",
    "Land_Portable_generator_F",
    "Land_PortableLongRangeRadio_F",
    "Land_CratesWooden_F",
    "Land_BarrelEmpty_F",
    "Land_BarrelSand_F",
    "Land_BarrelTrash_F",
    "Land_BarrelWater_F",
    "Land_BarrelEmpty_grey_F",
    "Land_BarrelSand_grey_F",
    "Land_BarrelTrash_grey_F",
    "Land_BarrelWater_grey_F",
    "Land_CanisterFuel_F",
    "Land_CanisterOil_F",
    "Land_CanisterPlastic_F",
    "Land_MetalBarrel_empty_F",
    "Land_MetalBarrel_F",
    "Land_WaterBarrel_F",
    "Land_WaterTank_F",
    "Land_Suitcase_F",
    "Land_PensAndPencils_F",
    "Land_Axe_F",
    "Land_Axe_fire_F",
    "Land_DrillAku_F",
    "Land_DustMask_F",
    "Land_File_F",
    "Land_Gloves_F",
    "Land_Grinder_F",
    "Land_Hammer_F",
    "Land_Meter3m_F",
    "Land_MultiMeter_F",
    "Land_Pliers_F",
    "Land_Saw_F",
    "Land_Screwdriver_V1_F",
    "Land_Screwdriver_V2_F",
    "Land_Wrench_F",
    "Land_Bucket_F",
    "Land_Bucket_clean_F",
    "Land_Bucket_painted_F",
    "Land_Sunshade_01_F",
    "Land_Sunshade_02_F",
    "Land_Sunshade_03_F",
    "Land_Sunshade_04_F",
    "Land_Basket_F",
    "Land_Cages_F",
    "Land_ToiletBox_F",
    "Land_Sunshade_F",
    "MetalBarrel_burning_F",
    "Land_CratesPlastic_F",
    "Land_CratesShabby_F",
    "Land_ChairPlastic_F",
    "Land_TablePlastic_01_F",
    "Land_GarbageBarrel_01_F",
    "Land_GarbageBin_01_F",
    "Land_Sun_chair_F",
    "Land_Sun_chair_green_F"
  ];

  _campObj = [
    "Land_TentA_F",
    "Land_TentDome_F",
    "Land_FirePlace_F",
    "FirePlace_burning_F",
    "Land_Campfire_F",
    "Campfire_burning_F"
  ];

  _campDebris = [
    "Land_WoodenLog_F",
    "Land_Sink_F",
    "Land_Ground_sheet_F",
    "Land_Ground_sheet_OPFOR_F",
    "Land_Ground_sheet_blue_F",
    "Land_Ground_sheet_khaki_F",
    "Land_Ground_sheet_yellow_F",
    "Land_Ground_sheet_folded_F",
    "Land_Ground_sheet_folded_OPFOR_F",
    "Land_Ground_sheet_folded_blue_F",
    "Land_Ground_sheet_folded_khaki_F",
    "Land_Ground_sheet_folded_yellow_F",
    "Land_Pillow_F",
    "Land_Pillow_camouflage_F",
    "Land_Pillow_grey_F",
    "Land_Pillow_old_F",
    "Land_Sleeping_bag_F",
    "Land_Sleeping_bag_blue_F",
    "Land_Sleeping_bag_brown_F",
    "Land_Sleeping_bag_folded_F",
    "Land_Sleeping_bag_blue_folded_F",
    "Land_Sleeping_bag_brown_folded_F",
    "Land_Camping_Light_off_F",
    "Land_CampingChair_V1_F",
    "Land_CampingChair_V1_folded_F",
    "Land_CampingChair_V2_F",
    "Land_CampingTable_F",
    "Land_CampingTable_small_F"
  ];

  _objectSets = [
    [_strandedObj, _strandedDebris],
    [_campObj, _campDebris]
  ];

  _objectSet = _objectSets call BIS_fnc_selectRandom;
  _setObj = _objectSet select 0;
  _setDebris = _objectSet select 1;

  _objCount = floor random 2;

  for "_i" from 0 to _objCount do {
    _objPos = [_pos, 5, floor random 360] call BIS_fnc_relPos;
    _objClass = _setObj call BIS_fnc_selectRandom;
    _obj = _objClass createVehicle _objPos;

    _debrisCount = floor random 4;
    for "_i" from 0 to _debrisCount do {
      _debrisClass = _setDebris call BIS_fnc_selectRandom;
      _debris = _debrisClass createVehicle _debrisPos;
    };
  };
};

genContainer = {

  _dist = 1000;
  _anchor = [player, floor random _dist, floor random 360] call BIS_fnc_relPos;

  // create "?" marker to give player a general idea of enc location
  _encType = "CON";
  _mkrName = format ["%1_%2_%3", _encType, str _anchor, floor random 1000];

  _mkr = createMarker [_mkrName, _anchor];
  _mkr setMarkerType "hd_unknown";
  _mkr setMarkerAlpha 1;
  _mkr setMarkerColor "ColorOrange";

  // TODO: create a generic task to investigate the location

  // find a suitable location near the anchor pos
  _pos = [_anchor, 50] call SHK_pos;
  if !(count _pos > 0) then {
    _pos = _anchor;
  };

  // determine the number of containers to spawn
  _containersCount = ceil random 5;

  // spawn rates of container contents
  _weaponRate = 95;
  _backpackRate = 90;
  _magazineRate = 80;
  _equipmentRate = 70;
  _clothingRate = 60;
  _consumableRate = 50;
  _resourceRate = 20;
  _itemRate = 10;

  // TODO: create classes based on an ammobox for civilian containers
  _containerObjs = [
    "Box_NATO_Ammo_F"
    // "Val_Con_Land_WoodenBox_F",
    // "Val_Con_LuggageHeap_01_F",
    // "Val_Con_LuggageHeap_02_F",
    // "Val_Con_LuggageHeap_03_F",
    // "Val_Con_LuggageHeap_04_F",
    // "Val_Con_LuggageHeap_05_F",
    // "Val_Con_Pallet_MilBoxes_F",
    // "Val_Con_PaperBox_closed_F",
    // "Val_Con_PaperBox_open_empty_F",
    // "Val_Con_PaperBox_open_full_F",
    // "Val_Con_CratesWooden_F",
    // "Val_Con_Suitcase_F",
    // "Val_Con_GarbageBin_01_F",
    // "Val_Con_GarbageBarrel_01_F"
  ];

  _contentsWeapon = [
    "hgun_P07_F",
    "hgun_Rook40_F",
    "hgun_ACPC2_F",
    "hgun_Pistol_heavy_01_F",
    "hgun_Pistol_heavy_02_F",
    "hgun_PDW2000_F",
    "SMG_01_F",
    "SMG_02_F"
  ];

  _contentsBackpack = [
    "B_HuntingBackpack",
    "B_AssaultPack_blk",
    "B_Kitbag_cbr",
    "B_TacticalPack_blk",
    "B_FieldPack_blk",
    "B_Carryall_oucamo",
    "B_Carryall_khk",
    "B_Bergen_blk",
    "B_BergenC_red",
    "B_BergenC_blu",
    "B_BergenC_grn",
    "B_BergenG",
    "B_OutdoorPack_blu",
    "B_OutdoorPack_blk",
    "B_OutdoorPack_tan",
    "B_FieldPack_ocamo_Medic",
    "B_FieldPack_cbr_LAT",
    "B_FieldPack_cbr_repair",
    "B_FieldPack_blk_DiverExp"
  ];

  _contentsMagazine = [
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "9Rnd_45ACP_Mag",
    "11Rnd_45ACP_Mag",
    "6Rnd_45ACP_Cylinder",
    "16Rnd_9x21_Mag",
    "30Rnd_45ACP_Mag_SMG_01_tracer_green",
    "30Rnd_9x21_Mag"
  ];

  _contentsEquipment = [
    "NVGoggles",
    "Rangefinder",
    "ToolKit",
    "MediKit",
    "V_Press_F",
    "V_TacVest_khk",
    "V_TacVest_brn",
    "V_TacVest_oli",
    "V_TacVest_blk",
    "V_TacVest_camo",
    "V_TacVest_blk_POLICE",
    "V_TacVestIR_blk",
    "V_TacVestCamo_khk",
    "V_I_G_resistanceLeader_F",
    "V_Rangemaster_belt"
  ];

  _contentsClothing = [
    "H_Cap_red",
    "H_Cap_blu",
    "H_Cap_oli",
    "H_Cap_headphones",
    "H_Cap_tan",
    "H_Cap_blk",
    "H_Cap_blk_CMMG",
    "H_Cap_brn_SPECOPS",
    "H_Cap_tan_specops_US",
    "H_Cap_khaki_specops_UK",
    "H_Cap_grn",
    "H_Cap_grn_BI",
    "H_Cap_blk_Raven",
    "H_Cap_blk_ION",
    "H_Cap_oli_hs",
    "H_Cap_press",
    "H_Watchcap_blk",
    "H_Watchcap_khk",
    "H_Watchcap_camo",
    "H_Watchcap_sgg",
    "H_StrawHat",
    "H_StrawHat_dark",
    "H_Hat_blue",
    "H_Hat_brown",
    "H_Hat_camo",
    "H_Hat_grey",
    "H_Hat_checker",
    "H_Hat_tan",
    "H_Cap_marshal"
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_Guerilla3_2",
    "U_IG_leader",
    "U_IG_Menelaos",
    "U_Marshal",
    "U_NikosAgedBody",
    "U_Rangemaster",
    "U_NikosBody",
    "U_OrestesBody",
    "U_Competitor",
    "U_OI_Scientist",
    "U_C_Poloshirt_b",
    "U_C_Poloshirt_b",
    "U_C_Poloshirt_s",
    "U_C_Poloshirt_t",
    "U_C_Poloshirt_s",
    "U_C_Poloshirt_r",
    "U_C_Commoner1_1",
    "U_C_Commoner1_2",
    "U_C_Commoner1_3",
    "U_C_Novak",
    "U_C_Poor_1",
    "U_C_Poor_2",
    "U_C_Scavenger_1",
    "U_C_Scavenger_2",
    "U_C_Farmer",
    "U_C_Fisherman",
    "U_C_WorkerOveralls",
    "U_C_FishermanOveralls",
    "U_C_WorkerCoveralls",
    "U_C_HunterBody_g",
    "U_C_HunterBody_b",
    "U_C_Commoner2_1",
    "U_C_Commoner2_2",
    "U_C_Commoner2_3",
    "U_C_PriestBody",
    "U_C_Poor_shorts_1",
    "U_C_Poor_shorts_2",
    "U_C_Commoner_s",
    "U_C_ShirtSurfer_s",
    "U_C_TeeSurfer_shorts_1",
    "U_C_TeeSurfer_shorts_2",
    "U_C_Journalist",
    "U_C_Scientist",
    "U_C_Driver_1",
    "U_C_Driver_2",
    "U_C_Driver_3",
    "U_C_Driver_4",
    "U_C_Driver_1_b",
    "U_C_Driver_1_b",
    "U_C_Driver_1_g",
    "U_C_Driver_1_r",
    "U_C_Driver_1_w",
    "U_C_Driver_1_y",
    "U_C_Driver_1_o"
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Sport_Blackred",
    "G_Tactical_Clear",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Combat",
    "G_Lowprofile",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Squares",
    "G_Squares_Tinted",
    "G_Sport_BlackWhite",
    "G_Sport_Blackyellow",
    "G_Sport_Greenblack",
    "G_Sport_Checkered",
    "G_Sport_Red",
    "G_Tactical_Black"
  ];

  _contentsConsumable = [
    "FirstAidKit",
    "B_IR_Grenade",
    "SmokeShell",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellYellow",
    "SmokeShellBlue",
    "SmokeShellOrange",
    "SmokeShellPurple",
    "Chemlight_green",
    "Chemlight_red",
    "Chemlight_yellow",
    "Chemlight_blue",
  ];

  _contentsResource = [

  ];

  _contentsItem = [
    "ItemWatch",
    "ItemCompass",
    "ItemGPS",
    "Binocular",
    "itemMap",
    "itemRadio"
  ];

  // create containers
  for "_i" from 0 to _containersCount do {
    _containerObj = _containerObjs call BIS_fnc_selectRandom;
    _container = _containerObj createVehicle _posActual;
    _container allowDamage false;
    clearMagazineCargo _container;
    clearItemCargo _container;
    clearWeaponCargo _container;

    // determine the number of contents to spawn
    _contentsCount = ceil random 10;

    for "_i" from 0 to _contentsCount do {
      _roll = floor random 100;

      if (_roll > _weaponRate) exitWith {
        if (count _contentsWeapon > 0) then {
          _contents = _contentsWeapon call BIS_fnc_selectRandom;
          _weapon = _container addWeapon [_contents, 1];
        };
      };

      if (_roll > _backpackRate) exitWith {
        if (count _contentsBackpack > 0) then {
          _contents = _contentsBackpack call BIS_fnc_selectRandom;
          _backpack = _container addBackpack [_contents, 1];
          clearMagazineCargo _backpack;
          clearItemCargo _backpack;
          clearWeaponCargo _backpack;
        };
      };

      if (_roll > _magazineRate) exitWith {
        if (count _contentsMagazine > 0) then {
          _contents = _contentsMagazine call BIS_fnc_selectRandom;

          _magazineCount = ceil random 4;
          _container addMagazineCargo [_contents, _magazineCount];
        };
      };

      if (_roll > _equipmentRate) exitWith {
        if (count _contentsEquipment > 0) then {
          _contents = _contentsEquipment call BIS_fnc_selectRandom;
          _equipment = _container addItemCargo [_contents, 1];
        };
      };

      if (_roll > _clothingRate) exitWith {
        if (count _contentsClothing > 0) then {
          _contents = _contentsClothing call BIS_fnc_selectRandom;
          _clothing = _container addItemCargo [_contents, 1];
        };
      };

      if (_roll > _consumableRate) exitWith {
        if (count _contentsConsumable > 0) then {
          _contents = _contentsConsumable call BIS_fnc_selectRandom;

          _consumableCount = ceil random 4;
          _container addItemCargo [_contents, _consumableCount];
        };
      };

      if (_roll > _resourceRate) exitWith {
        if (count _contentsResource > 0) then {
          _contents = _contentsResource call BIS_fnc_selectRandom;

          _resourceCount = ceil random 5;
          _container addItemCargo [_contents, _resourceCount];
        };
      };

      if (_roll > _itemRate) exitWith {
        if (count _contentsItem > 0) then {
          _contents = _contentsItem call BIS_fnc_selectRandom;
          _item = _container addItemCargo [_contents, 1];
        };
      };
    };
  };
};

genCrashSite = {
  // TODO: use setTexture on special containers to give procedural textures

  _dist = 1000;
  _anchor = [player, floor random _dist, floor random 360] call BIS_fnc_relPos;

  // create "?" marker to give player a general idea of enc location
  _encType = "CRASH";
  _mkrName = format ["%1_%2_%3", _encType, str _anchor, floor random 1000];

  _mkr = createMarker [_mkrName, _anchor];
  _mkr setMarkerType "hd_unknown";
  _mkr setMarkerAlpha 1;
  _mkr setMarkerColor "ColorOrange";

  // TODO: create a generic task to investigate the location

  // find a suitable location near the anchor pos
  _pos = [_anchor, 50] call SHK_pos;
  if !(count _pos > 0) then {
    _pos = _anchor;
  };

  // create crash site wreck object
  _crashObjs_plane = [
    "Land_Wreck_Plane_Transport_01_F"
  ];

  _crashObjs_helo = [
    "Land_Wreck_Heli_Attack_01_F",
    "Land_Wreck_Heli_Attack_02_F"
  ];

  _crashObjs_convoy = [
    "Land_Wreck_Ural_F",
    "Land_Wreck_HMMWV_F",
    "Land_Wreck_Hunter_F"
  ];

  _crashObjs_civ = [
    "Land_Wreck_Offroad_F",
    "Land_Wreck_Offroad2_F",
    "Land_Wreck_Van_F",
    "Land_Wreck_Truck_F",
    "Land_Wreck_UAZ_F",
    "Land_Wreck_Truck_dropside_F"
  ];

  _planeRate = 80;
  _heloRate = 60;
  _convoyRate = 40;

  _crashSiteRoll = floor random 100;

  _contents = [];

  call {
    if (_crashSiteRoll > _planeRate) exitWith {
      if (count _crashObjs_plane > 0) then {
        _crashObj = _crashObjs_plane call BIS_fnc_selectRandom;
        _wreck = _crashObj createVehicle _pos;
      };
    };

    if (_crashSiteRoll > _heloRate) exitWith {
      if (count _crashObjs_helo > 0) then {
        _crashObj = _crashObjs_helo call BIS_fnc_selectRandom;
        _wreck = _crashObj createVehicle _pos;
      };
    };

    if (_crashSiteRoll > _convoyRate) exitWith {
      if (count _crashObjs_convoy > 0) then {
        _crashObj = _crashObjs_convoy call BIS_fnc_selectRandom;
        _wreck = _crashObj createVehicle _pos;
      };
    };

    if (count _crashObjs_civ > 0) then {
      _crashObj = _crashObjs_civ call BIS_fnc_selectRandom
      _wreck = _crashObj createVehicle _pos;
    };
  };

  // create crash site debris
  _crashObjs_debris = [
    "Land_PaperBox_closed_F",
    "Land_PaperBox_open_empty_F",
    "Land_PaperBox_open_full_F",
    "Land_WoodenBox_F",
    "Land_Pallet_MilBoxes_F",
    "Land_Pallets_F",
    "Land_Pallets_stack_F",
    "Land_Portable_generator_F",
    "Land_PortableLongRangeRadio_F",
    "Land_CratesWooden_F",
    "Land_BarrelEmpty_F",
    "Land_BarrelWater_F",
    "Land_MetalBarrel_empty_F",
    "Land_MetalBarrel_F",
    "Land_WaterBarrel_F",
    "Land_CanisterOil_F",
    "Land_CanisterFuel_F",
    "Land_Suitcase_F",
    "Land_Axe_F",
    "Land_Axe_fire_F",
    "Land_DrillAku_F",
    "Land_DustMask_F",
    "Land_File_F",
    "Land_Gloves_F",
    "Land_Grinder_F",
    "Land_Hammer_F",
    "Land_Meter3m_F",
    "Land_MultiMeter_F",
    "Land_Pliers_F",
    "Land_Saw_F",
    "Land_Screwdriver_V1_F",
    "Land_Screwdriver_V2_F",
    "Land_Wrench_F",
    "Land_Bucket_F",
    "Land_Bucket_clean_F",
    "Land_Bucket_painted_F",
    "MetalBarrel_burning_F",
    "Land_CratesPlastic_F",
    "Land_CratesShabby_F"
  ];

  _debrisCount = floor random 4;
  for "_i" from 0 to _debrisCount do {
    _debrisClass = _crashObjs_debris call BIS_fnc_selectRandom;
    _debris = _debrisClass createVehicle _debrisPos;
  };

  // create a plume of smoke
  [_wreck, "mixed", "large"] call createSmokeColumn;

  // create special encounter enemies
  // create special encounter container

  _containers = [
    "Box_IND_AmmoVeh_F",
    "Box_IND_WpsSpecial_F"
  ];
};

genLocation = {

  /*

  Land_cargo_house_slum_ruins_F
  Land_cargo_house_slum_F
  Land_Slum_House01_F
  Land_Slum_House02_F
  Land_Slum_House03_F
  Land_Kiosk_blueking_ruins_F
  Land_Kiosk_blueking_F
  Land_Kiosk_gyros_F
  Land_Kiosk_papers_F
  Land_Kiosk_redburger_F
  Land_TouristShelter_01_F
  Land_Carousel_01_F
  Land_Swing_01_F
  Land_Metal_Shed_ruins_F
  Land_Metal_Shed_F
  Land_LifeguardTower_01_F

  Land_Shop_01_V1_ruins_F
  Land_i_Shop_01_V1_F
  Land_i_Shop_01_V1_dam_F
  Land_i_Shop_01_V2_F
  Land_i_Shop_01_V2_dam_F
  Land_i_Shop_01_V3_F
  Land_i_Shop_01_V3_dam_F
  Land_u_Shop_01_V1_F
  Land_u_Shop_01_V1_dam_F
  Land_d_Shop_01_V1_F
  Land_Shop_02_V1_ruins_F
  Land_i_Shop_02_V1_F
  Land_i_Shop_02_V1_dam_F
  Land_i_Shop_02_V2_F
  Land_i_Shop_02_V2_dam_F
  Land_i_Shop_02_V3_F
  Land_i_Shop_02_V3_dam_F
  Land_u_Shop_02_V1_F
  Land_u_Shop_02_V1_dam_F
  Land_d_Shop_02_V1_F
  Land_House_Small_01_V1_ruins_F
  Land_i_House_Small_01_V1_F
  Land_i_House_Small_01_V1_dam_F
  Land_i_House_Small_01_V2_F
  Land_i_House_Small_01_V2_dam_F
  Land_i_House_Small_01_V3_F
  Land_i_House_Small_01_V3_dam_F
  Land_u_House_Small_01_V1_F
  Land_u_House_Small_01_V1_dam_F
  Land_d_House_Small_01_V1_F
  Land_House_Small_02_V1_ruins_F
  Land_i_House_Small_02_V1_F
  Land_i_House_Small_02_V1_dam_F
  Land_i_House_Small_02_V2_F
  Land_i_House_Small_02_V2_dam_F
  Land_i_House_Small_02_V3_F
  Land_i_House_Small_02_V3_dam_F
  Land_u_House_Small_02_V1_F
  Land_u_House_Small_02_V1_dam_F
  Land_d_House_Small_02_V1_F
  Land_House_Small_03_V1_ruins_F
  Land_i_House_Small_03_V1_F
  Land_i_House_Small_03_V1_dam_F
  Land_i_Stone_Shed_V1_F
  Land_i_Stone_Shed_V1_dam_F
  Land_i_Stone_Shed_V2_F
  Land_i_Stone_Shed_V2_dam_F
  Land_i_Stone_Shed_V3_F
  Land_i_Stone_Shed_V3_dam_F
  Land_d_Stone_Shed_V1_F
  Land_Stone_HouseSmall_V1_ruins_F
  Land_i_Stone_HouseSmall_V1_F
  Land_i_Stone_HouseSmall_V1_dam_F
  Land_i_Stone_HouseSmall_V2_F
  Land_i_Stone_HouseSmall_V2_dam_F
  Land_i_Stone_HouseSmall_V3_F
  Land_i_Stone_HouseSmall_V3_dam_F
  Land_d_Stone_HouseSmall_V1_F
  Land_Unfinished_Building_01_ruins_F
  Land_Unfinished_Building_01_F
  Land_Unfinished_Building_02_ruins_F
  Land_Unfinished_Building_02_F
  Land_CarService_F
  Land_WIP_ruins_F
  Land_WIP_F
  Land_SlideCastle_F

  */

  // generate a random pos
  // determine the number of _x to spawn
  // spawn _x
};

genVehicle = {

  // generate a random pos
  // determine the number of _x to spawn
  // spawn _x
};

genResource = {

  // generate a random pos
  // determine the number of _x to spawn
  // spawn _x
};

genObjective = {

  // generate a random pos
  // determine the number of _x to spawn
  // spawn _x
};
