/*
  @name: generateGroup.sqf
  @description: creates a group of units with random equipment and skills based on group type
  @author: created by Devyn Spencer for http://github.com/devynspencer/valkyrie
  @params:
  @examples:
  @returns:
*/

private [
  "_marker",
  "_units"
];

// populate with required / support roles first then finish by looping through _groupCount - (number of special / support roles filled) of 2-3 generic roles

// _groupCount = 5
// _groupRoles = [marksman, engineer] + from generic pool: [assault, defender, grenadier] pyro?
