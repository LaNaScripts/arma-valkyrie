/*
  @name: get_unitLoadout.sqf
  @description: randomly generates a list of items based on a unit's assigned role
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
  "_role",
  "_faction"
  "_head",
  "_face",
  "_uniform",
  "_vest",
  "_backpack",
  "_weapon",
  "_items"
];

_unit = _this select 0;

// unit role; defaults to value provided from get_unitRole
_unitRole = [_this, 1, (get_unitRole _unit), ""] call BIS_fnc_param
_unitFaction = [_this, 2, (faction _unit), ""] call BIS_fnc_param


return _loadout
