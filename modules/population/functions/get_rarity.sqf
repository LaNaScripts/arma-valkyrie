/*
@name: get_rarity.sqf
@description: Randomly determines the rarity of an event, item etc.
@author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
@params: [_rand, _rarity]
@returns: the rarity of something, in string form
*/

private [
  "_rand",
  "_rarity"
]

// generate a random number to determine the item's rarity
_rand = [_this, 1, (floor random 100), 0] call BIS_fnc_param;

// assign rarity value to item; higher value = higher rarity
switch _rand do {
  case (_rand > 89): {_rarity = "_rare";};
  case (_rand > 59): {_rarity = "_uncommon";};
  case (_rand > 39): {_rarity = "_common";};
  default:           {_rarity = "_basic";};
};

_rarity;
