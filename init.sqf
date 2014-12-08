/*

  file: 'init.sqf'
  author: devyn spencer (http://github.com/devynspencer)
  description:
    - initializes core processes and functions
    - initializes modules included in 'server\config.sqf'

*/

// run init processes
call preprocessFileLineNumbers "functions\setRoot.sqf"); // setup mission root
call preprocessFileLineNumbers "compile.sqf"); // compile functions
call preprocessFileLineNumbers "config.sqf"); // compile configuration values

// run core processes
[] execVM "server\functions\geZone.sqf"; // generate zone populations
