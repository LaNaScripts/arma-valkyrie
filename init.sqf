/*

  file: 'init.sqf'
  author: devyn spencer (http://github.com/devynspencer)
  description:
    - initializes core processes and functions
    - initializes modules included in 'server\config.sqf'

*/

// run init processes
[] execVM "server\functions\setRoot.sqf"; // setup mission root

[] execVM "compile.sqf"; // compile functions
[] execVM "config.sqf"; // compile configuration values

// run core processes
[] execVM "server\functions\genZone.sqf"; // generate zone populations
