* shooting generators / transformer stations blows light objects connected to the grid within x meters

```
_centerPos = _this select 0;
blowlights = [
"Lamps_base_F", "Land_PowerPoleWooden_L_F", "PowerLines_base_F", "PowerLines_Small_base_F"
];

_nearestGenerator = nearestObject [_centerPos,"Land_spp_transformer_F"]; _allLights = nearestObjects [_nearestGenerator, blowlights, 700]; waitUntil{damage _nearestGenerator >= 1};
hint "Generator Down";

{
_x setHit ["light_1_hitpoint", 0.97]; _x setHit ["light_2_hitpoint", 0.97]; _x setHit ["light_3_hitpoint", 0.97]; _x setHit ["light_4_hitpoint", 0.97];
} foreach nearestObjects [_nearestGenerator, blowlights, 1000];
```

The script works by setting up an array of lights to blow out after the power goes down. The script also searches out from the position passed to it via execVM to find the nearest solar power transformer to that position. When the generator is destroyed (damage = to 1), all lights within 700 meters will go out by setting the light hit points to 0.97 to break them partially.
