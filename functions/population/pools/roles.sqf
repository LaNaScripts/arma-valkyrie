/*

  file:   pools\roles.sqf
  author: http://devynspencer.github.io
  about:  provides an array of configuration values for customizing individual unit roles
  example:

    // get all role configurations for a faction
    _civilianRoles = (v_roles select 0) select 0;
    _eastRoles = (v_roles select 0) select 1;
    _guerRoles = (v_roles select 0) select 2;

    // randomly select a faction and role
    _faction = (v_roles select 0) call BIS_selectRandom;
    _role    = _faction call BIS_selectRandom;

    // more concise version of the above
    _role = ((v_roles select 0) call BIS_selectRandom) call BIS_selectRandom;

*/

v_roles = [
  [ // factions array index [0] - CIVILIAN
    [ // roles array index [0] - v_immigrants
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [0] - v_immigrants
    [ // roles array index [1] - v_hunters
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [1] - v_hunters
    [ // roles array index [2] - v_drivers
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [2]
    [ // roles array index [3] - v_merchants
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [3] - v_merchants
    [ // roles array index [4] - v_armsDealers
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [4] - v_armsDealers
    [ // roles array index [5] - v_smugglers
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [5] - v_smugglers
    [ // roles array index [6] - v_fugitives
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [6] - v_fugitives
    [ // roles array index [7] - v_searchRescue
      "CIVILIAN", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ] // roles array index [6] - v_searchRescue
  ], // factions array index [0] - CIVILIAN
  [ // factions array index [1] - EAST
    [ // roles array index [0] - v_conscripts
      "EAST", // faction
      [v_weaponsHandgun], // weapons
      [v_shemags, v_balaclavas], // headgear
      [], // goggles
      [v_vests_l], // vests
      [v_uniforms_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [0] - v_conscripts
    [ // roles array index [1] - v_acolytes
      "EAST", // faction
      [v_weaponsCarbine, v_weaponsSMG], // weapons
      [v_shemags, v_balaclavas], // headgear
      [], // goggles
      [v_vests_l, v_vests_m], // vests
      [v_uniforms_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [1] - v_acolytes
    [ // roles array index [2] - v_hoarders
      "EAST", // faction
      [v_weaponsRifle, v_weaponsLMG], // weapons
      [v_helmetsUrban_o], // headgear
      [], // goggles
      [v_vests_l, v_vests_m], // vests
      [v_uniforms_o, v_uniformsUrban_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [2] - v_hoarders
    [ // roles array index [3] - v_shocks
      "EAST", // faction
      [v_weaponsSMG], // weapons
      [v_balaclavas, v_helmetsUrban_o, v_helmets_o], // headgear
      [], // goggles
      [v_vests_h], // vests
      [v_uniforms_o, v_uniformsUrban_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [3] - v_shocks
    [ // roles array index [4] - v_vassals
      "EAST", // faction
      [v_weaponsRifle, v_weaponsLauncherRifle], // weapons
      [v_helmetsUrban_o, v_helmets_o], // headgear
      [], // goggles
      [v_vests_h], // vests
      [v_uniforms_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [4] - v_vassals
    [ // roles array index [5] - v_arachs
      "EAST", // faction
      [v_weaponsCarbine, v_weaponsSMG], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [v_uniformsGhillie], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [5] - v_arachs
    [ // roles array index [6] - v_marksmen
      "EAST", // faction
      [v_weaponsDMR, v_weaponsSniper], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [v_uniformsGhillie], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [6] - v_marksmen
    [ // roles array index [7] - v_heavies
      "EAST", // faction
      [v_weaponsLMG], // weapons
      [v_helmetsBreather], // headgear
      [], // goggles
      [v_vestsRebreather], // vests
      [v_uniformsUrban_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [6] - v_heavies
    [ // roles array index [7] -   v_smokers
      "EAST", // faction
      [v_weaponsSMG], // weapons
      [v_helmetsBreather], // headgear
      [], // goggles
      [v_vestsRebreather], // vests
      [v_uniformsUrban_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [7] - v_smokers
    [ // roles array index [8] - v_ghosts
      "EAST", // faction
      [v_weaponsDMR], // weapons
      [v_helmetsBreather], // headgear
      [], // goggles
      [v_vestsRebreather], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [8] - v_ghosts
    [ // roles array index [9] - v_shreaks
      "EAST", // faction
      [v_weaponsSMG], // weapons
      [v_helmetsClosed], // headgear
      [], // goggles
      [v_vests_l, v_vests_m], // vests
      [v_uniformsUrban_o], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [9] - v_shreaks
    [ // roles array index [10] - v_wisps
      "EAST", // faction
      [v_weaponsCarbine, v_weaponsHandgun], // weapons
      [v_helmetsClosed], // headgear
      [], // goggles
      [v_vests_l, v_vests_m], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ] // roles array index [10] - v_wisps
  ], // factions array index [1] - EAST
  [ // factions array index [2] - GUER
    [ // roles array index [0] - v_rebels
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [0] - v_rebels
    [ // roles array index [1] - v_raiders
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [1] - v_raiders
    [ // roles array index [2] - v_marauders
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [2] - v_marauders
    [ // roles array index [3] - v_spies
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [3] - v_spies
    [ // roles array index [4] - v_insurgents
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [4] - v_insurgents
    [ // roles array index [5] - v_sharpShooters
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [5] - v_sharpShooters
    [ // roles array index [6] - v_rangers
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ], // roles array index [6] - v_rangers
    [ // roles array index [7] - v_trappers
      "GUER", // faction
      [], // weapons
      [], // headgear
      [], // goggles
      [], // vests
      [], // uniforms
      [], // backpacks
      [], // supplies
      [], // skills
      [], // behaviors
      [], // morale
      [], // tactics
      [], // heavyWeapons
      [] // specialUnits
    ] // roles array index [7] - v_trappers
  ] // factions array index [2]
];
