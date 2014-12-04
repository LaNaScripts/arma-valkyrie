/*

  file:        set_contents.sqf
  author:      devyn spencer (http://github.com/devynspencer)
  description: populates contents of a crate/backpack/vehicle/ with random items
  parameters:
    - container // loot amounts should fit within the limitations of different containers
    - rarity    // maximum rarity of item pools to generate from; default = 1 (common)

  1. randomly select a container type

  2. determine size of loot pool

  3. determine number of items to generate

  4. load all loot pools

    - items
    - gear
    - vests
    - uniforms
    - weapons
    - ammo
    - resources*
    - structures*

  5. combine all pool arrays into one pool to generate from // pushBack

  6. select a random item from the aggregate pool from 1 to _num

    - determine what the item is
    - add the item to the container user the appropriate function

*/

private [

];

// randomly select a container type, unless specified
_lootContainer = [_this, 0, (pl_containers call BIS_fnc_selectRandom), ""] call BIS_fnc_param;

// determine size of loot pool
call {
if (_container == "") exitWith {};
if () exitWith {};
 };

// determine number of items to generate

// load all loot pools

 _ = // items
 _ = // gear
 _ = // vests
 _ = // uniforms
 _ = // weapons
 _ = // ammo
 _ = // resources*
 _ = // structures*

// combine all pool arrays into one pool to generate from // pushBack

// select a random item from the aggregate pool from 1 to _num

- determine what the item is
- add the item to the container user the appropriate function



call BIS_fnc_selectRandom for _i in _num
