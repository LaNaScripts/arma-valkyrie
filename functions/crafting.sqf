// close an open menu
closeMenu = {
  {
    player removeAction _x
  } forEach manatee_craft_menu;
  manatee_craft_menu = [];

  {
    player removeAction _x
  } forEach manatee_craft_menu_ind;
  manatee_craft_menu_ind = [];

  {
    player removeAction _x
  } forEach manatee_craft_menu_sur;
  manatee_craft_menu_sur = [];

  {
    player removeAction _x
  } forEach manatee_craft_menu_wea;

  manatee_craft_menu_wea = [];
  crafting_menu_open = false;
  show_industrial = false;
  show_survival = false;
  show_weapons = false;
};

craftMenu = {
  {
    player removeAction _x
  } forEach manatee_craft_menu;

  manatee_craft_menu = [];
  crafting_menu_open = true;
  show_industrial = false;
  show_survival = false;
  show_weapons = false;

  sleep 1;
  cutText ["Opened Crafting Menu. Scroll your mouse to access it.", "PLAIN",2];
  sleep 1;
  _restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";

  manatee_craft_menu = [];
  manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#0074E8"">" + ("Crafting Menu") +"</t>"), "", "", 99, false, false, "", _restriction]];
  manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#FF7300"">" + ("Close Menu") +"</t>"), "manatee\crafting\closemenu.sqf", "", 98, false, true, "", _restriction]];
  manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#4AC925"">" + ("Industrial Parts") +"</t>"), "manatee\crafting\industrial.sqf", "", 97, false, false, "", _restriction]];
  manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#4AC925"">" + ("Survival Gear") +"</t>"), "manatee\crafting\survival.sqf", "", 95, false, false, "", _restriction]];
  manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#4AC925"">" + ("Weapons Crafting") +"</t>"), "manatee\crafting\weapons.sqf", "", 93, false, false, "", _restriction]];
  manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#0074E8"">" + ("-----------------------------") +"</t>"), "", "", 91, false, false, "", _restriction]];
};

survival = {

  /* survival crafting

  PARAMS:
  - TYPE (see below)
  - output item
  - array of input items and how many of each item

    TYPE // note: add more types for each addItem/addBackpack/addWeapon/addVest command
    - 0 for magazine
    - 1 for weapon/toolbelt

  EXAMPLES:

    [[TYPE, "Finished Readable Item Name", "FinishedItemClassName", "FinishedQty"],
    [[TYPE, "RequiredClassName", "RequiredQty"], // output
    [TYPE, "RequiredClassName2", "RequiredQty"] ... ]] // inputs

  */

  sleep 1;

  if (!show_survival) then {
    show_survival = true;

    _restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";

    _itemName = "Bandage";
    _titleColor = "#FFC726";
    _title = format ["<t color=%1>%2</t>", _titleColor, _itemName];

    craftItem = "manatee\crafting\oven.sqf";

    _output = [0, _itemName, "item_classname_1", 1];
    _inputs = [[0, "item_classname_2", 2], [0, "item_classname_3", 1]];

    cmenu_survival = [];

    cmenu_survival set [count cmenu_survival, player addaction [_title, craftItem, [_output, _inputs], 94, false, false, "", _restriction]];

  } else {
    show_survival = false;
    {
      player removeAction _x;
    } foreach cmenu_survival;
    cmenu_survival = [];
  };
};

// craft item
oven = {
  disableUserInput true;

  // close the menu
  _nil = execVM "manatee\crafting\closemenu.sqf";

  // get all the parameters
  _parameters    = _this select 3;
  _makeItem      = _parameters select 0;
  _neededItems   = _parameters select 1;
  _makeItemType  = _makeItem select 0;
  _makeItemName  = _makeItem select 1;
  _makeItemClass = _makeItem select 2;
  _makeItemQty   = _makeItem select 3;
  _craftCheckTime = 2; // time to spend checking for materials; added later
  _craftTime     = 3; // time to spend crafting; added later

  // play lengthy medic animation
  player playActionNow "Medic";
  //[player, "repair", 0, false] call dayz_zombieSpeak;

  // display onscreen status text
  cutText [format ["Attempting to craft %1, Qty: %2", _makeItemName, _makeItemQty], "PLAIN DOWN"];
  sleep _craftCheckTime;
  //sleep 5;

  // get players inventory and story them as arrays
  // TODO: will need to add other inventory types here
  _mags = magazines player;
  _weps = weapons player;

  // assume true until otherwise proven false
  _correctInventory = true;

  // loop through the array of needed items for the build
  {
    _itemType = _x select 0;
    _itemClass = _x select 1;
    _itemQty = _x select 2;

    if (_itemType == 0) then {
      if (_itemClass in _mags) then {

        // TODO: this command may need to be updated
        _inUserInv = {_x == _itemClass} count magazines player;

        if (_inUserInv < _itemQty) then {
          _correctInventory = false;
        };
      } else {
        _correctInventory = false;
      };
    } else {
      if (_itemClass in _weps) then {
        _inUserInv = 1;
      } else {
        _correctInventory = false;
      };
    };
  } forEach _neededItems;

  // check for the required materials
  if (_correctInventory) then {

    // remove the items now
    {
      _itemType2 = _x select 0;
      _itemClass2 = _x select 1;
      _itemQty2 = _x select 2;
      for "_i" from 0 to _itemQty2-1 do {
        if (_itemType2 == 0) then {
          player removeMagazine _itemClass2;
        } else {
          player removeWeapon _itemClass2;
        };
      };
    } forEach _neededItems;

    sleep 2;
    player playActionNow "Medic";
    //[player, "repair", 0, false] call dayz_zombieSpeak;

    // display onscreen status text
    cutText [format ["Crafting a %1", _makeItemName], "PLAIN DOWN"];

    // wait for given crafting time
    sleep _craftTime;
    //sleep 6;

    // ensure the player is still a valid target for addItem
    if (alive player) then {
      _error = false;

      for "_i" from 0 to _makeItemQty - 1 do {
        // TODO: not sure why this item is called out specifically
        if (_makeItemClass == "PipeBomb") then {
          _result = player addMagazine "PipeBomb";
          // return the item class for whatever was crafted
        } else {
          _result = [player, _makeItemClass] call BIS_fnc_invAdd;
        };

        if (!_result) then {
          _error = true;
        };
      };

      if (_error) then {
        // display onscreen status text
        cutText ["One or more items were lost in the crafting process.", "PLAIN DOWN"];
      } else {
        // display onscreen status text
        cutText [format ["You have successfully created: %1", _makeItemName], "PLAIN DOWN"];
      };
    };

    // the players gear does not match
  } else {
    _neededString = [];

    {
      // TODO: weird var names?
      _itemClass3 = _x select 1;
      _itemQty3 = _x select 2;
      _inUserInv3 = {_x == _itemClass3} count magazines player;

      // TODO: not sure about this
      if (_itemClass3 == "PartGeneric") then {
        _itemClass3 = "ScrapMetal";
      };

      // prepare the crafting requirements string
      _neededString set [count _neededString, format["%1/%2 %3", _inUserInv3, _itemQty3, _itemClass3]];

    } forEach _neededItems;

    // display onscreen status text
    cutText [format ["%1 Requirements: %2", _makeItemName, _neededString], "PLAIN DOWN", 1];
  };

  disableUserInput false;
};
