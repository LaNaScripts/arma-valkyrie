// =======================================================================================================
//
//		skillEXEC.sqf
//
// =======================================================================================================

if ( !isServer ) exitWith {};

sleep 10;

_enemySide = WEST;

_UnitsSkillArray = [
	[ "aimingAccuracy", 0.50 ],
	[ "aimingShake", 0.40 ],
	[ "aimingSpeed", 0.40 ],
	[ "endurance", 0.60 ],
	[ "spotDistance", 0.95 ],
	[ "spotTime", 0.85 ],
	[ "courage", 0.80 ],
	[ "reloadSpeed", 0.40 ],
	[ "commanding", 0.75 ]
];

{	// -> forEach allUnits
	private [ "_tmpUnit" ];
	_tmpUnit = _x;
//	if ( side _tmpUnit == _enemySide ) then 
//	{
		{	// -> forEach _UnitsSkillArray
			_tmpUnit setskill [ ( _x select 0 ), ( _x select 1 ) ];
		} forEach _UnitsSkillArray;
//	};	
} foreach allUnits;	