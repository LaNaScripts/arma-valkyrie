/*
=======================================================================================================================

	Script: garbageCollector.sqf
	Author(s): T-800a

	Description:
	Small clean up script.
	loop checks every 30 sec for things to delte, if there is something, it will be deleted after given time.
	
	Parameter(s):

	Example(s):
	in the init.sqf:	[] execVM "garbageCollector.sqf";

=======================================================================================================================
*/

if ( ! isServer ) exitWith {};

private [ "_unitGarbage", "_itemGarbage" ];

garbageCollector_WTIME = 60;		// time in seconds after weaponholders / items are deleted
garbageCollector_UTIME = 120;		// time in seconds after dead units are deleted

_unitGarbage = [];
_itemGarbage = [];

garbageCollector_fnc_rm = 
{
	private [ "_obj", "_time", "_switch", "_atl", "_progress" ];
	_obj = _this select 0;
	_time = _this select 1;
	if ( count _this > 2 ) then { _switch = _this select 2; } else { _switch = false; };
	sleep _time;
	/*
	_progress = 0;
	if ( _switch ) then
	{
		_obj enableSimulation false;
		
		while { _progress < 200 } do
		{
			_atl = getPosATL _obj;
			_obj setPosATL [ _atl select 0, _atl select 1, ( _atl select 2 ) - 0.01 ];
		
			sleep 0.1;
			
			_progress = _progress + 1;
		};	
	};
	*/
	deleteVehicle _obj;
};

while { true } do 
{
	sleep 15;
	
	// RM Dead Bodies
	{ 
		if ( !( _x in _unitGarbage ) ) then
		{
			_unitGarbage pushBack _x;
			
			if ( _x isKindOf "Man" ) then { [ _x, garbageCollector_UTIME, true ] spawn garbageCollector_fnc_rm; };
		};
	} forEach allDead;
	
	// RM Weapons
	{	
		private [ "_unit" ];
		_unit = _x;
		{
			{ 	 
				if ( !( _x in _itemGarbage ) ) then
				{
					_itemGarbage pushBack _x;
					
					[ _x, garbageCollector_WTIME ] spawn garbageCollector_fnc_rm;
				};		
			} forEach ( getpos _unit nearObjects [ _x, 75 ] );
		} forEach [ "WeaponHolder", "GroundWeaponHolder", "WeaponHolderSimulated" ];
	} forEach allUnits;	
	
	_unitGarbage = _unitGarbage - [ objNull ];
	_itemGarbage = _itemGarbage - [ objNull ];
};

