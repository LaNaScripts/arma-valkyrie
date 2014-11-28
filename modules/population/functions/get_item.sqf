/*
  @name: get_pool.sqf
  @description: randomly select an item from a pool of items
  @author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
  @params: [
    _pool   -- pool to select an item from; defaults to random pool
    _rarity -- rarity of item to select; defaults to random rarity
  ]
  @returns: an object classname in string form
*/

private [
  "_pools",
  "_pool",
  "_rarity",
  "_object"
]

// item pools to choose from
_pools = [
  "weapons",
  "items",
  "uniforms",
  "ammo",
  "backpacks"
];

// by default, randomly select an item category to select from
_pool = [_this, 0, (_pools call BIS_fnc_selectRandom), ""] call BIS_fnc_param;
_rarity = [_this, 1, ([] call getRarity), ""] call BIS_fnc_param;

// randomly select the item based on the given item _pool and _rarity
switch _pool do {
  case "weapons": {
    #include "pools\equipment\weapons.sqf"
  };

  case "items": {
    #include "pools\equipment\items.sqf"
  };

  case "uniforms": {
    #include "pools\equipment\uniforms.sqf"
  };

  case "ammo": {
    #include "pools\equipment\ammo.sqf"
  };
};

_item = _items call BIS_fnc_selectRandom;

_item;
