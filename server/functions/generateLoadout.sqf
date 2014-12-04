/*
  @name: generateLoadout.sqf
  @description: randomly generates and equips a unit with items based on unit role
  @author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
  @params: [
    chance_*  - chance to generate an item for slot *
    num_items - number of random items that will be potentially generated for the character
    head      - class name of head item to return
    face      - class name of face item to return
    uniform   - class name of uniform item to return
    vest      - class name of vest item to return
    backpack  - class name of backpack item to return
    weapon    - class name of weapon item to return
    items     - class name of items item to return
    ]
  @examples:
  @returns: [_head, _face, _uniform, _vest, _backpack, _weapon, _items]
*/

private [
  "_marker",
  "_unit",
  "_roleHeadwear",
  "_roleFacewear",
  "_roleUniforms",
  "_roleVests",
  "_roleBackpacks",
  "_roleWeapons",
  "_headwear",
  "_facewear",
  "_uniform",
  "_vest",
  "_backpack",
  "_weapon"
];

_roleHeadwear  = [

];

_roleFacewear  = [

];

_roleUniforms  = [

];

_roleVests     = [

];

_roleBackpacks = [

];

_roleWeapons   = [

];


_marker   = [_this, 0, objNull, ""] call BIS_fnc_param;
_unit     = [_this, 1, objNull, ""] call BIS_fnc_param;
_headwear = [] call BIS_fnc_param;
_facewear = [] call BIS_fnc_param;
_uniform  = [] call BIS_fnc_param;
_vest     = [] call BIS_fnc_param;
_backpack = [] call BIS_fnc_param;
_weapon   = [] call BIS_fnc_param;
