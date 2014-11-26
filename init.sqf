/*
  @name: init.sqf
  @description: initializes all server activities
  @author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie.Altis
  @params: []
  @returns: begins client & server processes necessary for delivery of core gameplay elements
*/

// list the modules to be loaded here
_modulesArray = [
    population
    // territory
    // crafting
    // construction
]

// load modules listed in _modulesArray
switch (in _modulesArray) do {

    // zone population module
    case 'population': {
        spawn initPopulation;
    }

    // always load the core module
    default {
        spawn initBase;
    }
}
