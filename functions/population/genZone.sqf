/*

	file: functions\genZone.sqf
	author:	http://devynspencer.github.io
	about: generates random locations near a marker for a number of populations

	- traffic
	- patrols
	- objectives
	- encounters
	- vehicles
	- containers
	- resources
	- convoys

*/

// temporary
private [
	"_markerList"
];

_markerList = [
	"mkr_1",
	"mkr_2",
	"mkr_3",
	"mkr_4",
	"mkr_5"
];

{
	[_x] call genGroup;
	[_x] call genVehicle;

} forEach _markerList;
