---
layout: page
title: Timeline
---
In rough order of attention, here is a brief outline of the features and topics we are giving priority:

## [Dynamic Units](#)
Units spawned into the world will be outfitted with random clothing, equipment, weapons, and behaviors based on predetermined unit roles.

## [Area patrols](#)
Enemy patrols will randomly spawn (relatively) near the player

* Patrols award a small amount of resources and experience when destroyed
* Destroying enemy patrols will eventually increase reputation with other factions and allow for special support options to be accumulated and used

## [Resources](/mod/resources)
Salvage resources from the environment, for use in crafting and construction.

* metal - tools, weapons, & subcomponents
* materials - buildings
* chemicals - explosives, medkits, poisons
* cloth - clothing + subcomponents
* food - basic
* water - basic
* intel - research
* mechanisms - guns, traps
* parts - subcomponents

## [Construction](/mod/construction)
Reshape your environment to stash supplies, provide shelter, or gain a necessary advantage when forced to halt the advance of an overwhelming enemy force. Facilitate larger operations by moving supplies via convoy or air transport.

* watch posts - wood or metal, provides vision over an area; can be upgraded to hold a small cache of supplies
* guard towers - concrete structures with room for supplies and an NPC garrison; can be upgraded with weaponry
* radio towers - enables communication over a large area; can be upgraded with a larger antenna to increase it's functional range
* command structure - allows for detailed coordination of efforts in an area; can be upgraded to unlock more units and research options
* obstacles & cover - concrete & debris, road barricades, sandbags, razor wire, wood / metal fences; each can be upgraded to improve durability and reduce building costs

## [Crafting](/mod/crafting)
A core component of the mod, crafting system will encourage players to explore the world to discover new resources, while rewarding players who develop mature crafting infrastructures.

General concepts include:

* common resource system
* research and schematics as later requirements
* standard craftable components
* crafting automation through improvements

Example categories of craftable goods include:

* consumables
* traps
* weapons - melee and ranged
* tools
* equipment
* fuel
* explosives
* ammunition
* resource containers
* backpacks

## [Dynamic objectives](#)
Players will receive random notifications of areas of interest, with each representing a dynamically generated encounter with unique requirements, enemies, and tactics.

Receive a randomly generated task upon approaching a place of interest marker (?). Available tasks are based on encounters generated within an area, and are intended to be dynamic while remaining in a similar context to the other elements of an encounter.

* Enemies will dynamically spawn near an objective with behavior appropriate for the objective's type
* Environmental objects will be generated near an objective to facilitate a particular narrative

## [Populations](#)
What's your next adventure look like? Spend less time in the editor and more time on the battlefield! Feed your sense of adventure with dynamic, self-populating zones that ensure you'll never have the same experience twice.

* dynamic enemy patrols - random behavior, loadouts, and skills from a pool of predefined encounter groups
* rural patrols - less populated areas are more likely to enemy fast movers, such as spawn technical patrols as well as civilian smugglers
* random supply airdrops - supply drops spawn randomly in player inhabited zones
* supply chasers - enemies are interested in those supplies too!

Populations are determined using a list of encounters, each with an extensive array of enemies, rewards, tasks, events, and unlockable support call-ins that can potentially be spawned.

## [Upgrades](/mod/upgrades)
Combine collected scrap with other resources to reinforce and improve the features of:

* vehicles
* weapons
* NPC underlings
* equipment
* structures
* improvements

Improved buildings and equipment allow for new gameplay features, units, and strategies, while vehicles and weapons can be improved to improve their durability, performance, and reliability.

## [Civilian Weapons](#)
A major goal of this project is to add in the civilian equipment that should have shipped with Arma in the first place. Models for the following weapons will be created:

* melee weapons
* hunting bows & crossbows (fuck yeah, Daryl!)
* civilian rifles
* civilian handguns
* makeshift explosives

## [Civilian Items](#)
Similarly, another major goal of this project is to expand the current pool of civilian equipment available in Arma 3. Models for the following items will be created:

* packaged & raw food items items
* beverage containers
* backpacking gear
* civilian clothing
* civilian paramilitary tools & equipment

## [Civilian Vehicles](#)
Similarly, another major goal of this project is to expand the current pool of civilian vehicles available in Arma 3. Models for the following vehicles will be created:

* economy sedans, hatchbacks, station wagons, vans
* civilian offroad vehicles
* civilian airplanes
* large civilian cargo vehicles & semi trucks
* large civilian fishing vessels & houseboats

## [Support Requests](/mod/support)
You did remember your radio, right?

* earn or purchase access to single-use support packages
* radio supply drops
* player-assisting ai spotters
* request a distraction from an infiltration team
* helicopter airlifts

## [AI Behaviors & Tactics](#)
Counterattack! Test your abilities and evolve your strategy against cunning enemy forces that react and redeploy to counter your actions. Stay one step ahead and silence key communication hubs, and confuse your enemies with feigned advances.

## [Optimization](#)
The overall goal of this project is to provide players with an enormous open world platform while retaining the small details that make a game interesting. Technically speaking, this requires a well-designed codebase that leverages dynamic spawns and limits placement of static elements for longer than absolutely necessary.

Therefore, in order to provide a high-quality gameplay experience, plugins and server optimizations will be developed as necessary.

* A streamlined, uniform module structure focusing on logically organizing the key components to maximize acclimation and reusability
* A collection of several completely new maps, featuring new terrain types and environmental objects
* Map redesigns will focus on replacing (often unnecessary) 'hard-coded' objects with dynamically-generated objects and developing support for caching of entire environments to conserve resources.
* Population caching of unoccupied zones. An expansion of the above, where enemy behaviors, morale, casualities, and tactics will be cached in addition to object data such as class types, object states, and positions
* Language extensions, providing support for outside languages and frameworks such as json/yaml/nodejs in order to increase code reuse, modularity, and flexibility.
* Hash ID generation for object validation, i.e. this
Database support for reliable, persistent worlds and scalable retrieval of player data.

### Headless Client Modules
A fortunate result of Bohemia's recent attention towards integrating headless clients into their codebase, server calculations will be split into HC modules that each process a particular aspect of the game, separate from all other components:

* Locations: dynamically generated objects, cover, and clutter
* Weather patterns: random weather events and temperature, windspeed, and humidity calculations
* Populations: includes group dynamics, and unit behaviors / tactics

## Defense system
Build the ultimate arcade survival platform!

Survive waves of enemies that become progressively more difficult to overcome
Cash in resources earned by defeating enemies to bolster your defenses

## Virtual Training
Make sure you're ready for the wastes with an extensive virtual training environment, built to showcase all aspects of valkyrie and its supporting modules.

## Mercenaries
Recruit mercenaries with randomly generated gear and expertise. Armed to the teeth already? Earn some spending money through random contracts like convoy escorts or emplacement sabotage.

## Raiding
Secure key locations and defend supply convoys to secure valuable resources, or raid your enemies for theirs! Short on time? Destroy key enemy structures to render them useless until they are rebuilt - at the cost of resources.

## Advanced Caching and Seeding
Save computing resources by storing unused supplies, weapons, and vehicles in a virtual resource manifest while they continue to interact with the world through a common resource pool.

Setup a new resource manifest to quickly customize a new game, or try out a "what if" scenario in the world.
Alternatively, use this module to add another level of dynamism to the start of each game by randomly generating a new resource pool.

## Recruitment
Support, avoid, or engage organic groups of ai that evolve from civilians to resistance fighters, military conscripts, or anarchists based on their surroundings.

## Night Operations
Strike from the shadows and see Altis in an entirely new light. Use the cover of night to your advantage to harass a stronger enemy force, but be careful - how can you be so sure you're not being hunted as well?

Engage dynamic enemy forces that make intelligent use of the light to fight on their terms.

## Drone Reconnaissance
purchase UAVs, set them to patrol a map location, and view a live video feed from the UAV control console

## Perimeter Defense
Craft new improvements to protect your territory:

* motion detectors
* wide area cameras
* modular traps - either defensive (flare, smoke, tranq, stun, cage) traps or lethal (grenade, flame, nail-jar) mines

## Health & Fatigue
Explore the world with new concerns for health conditions, ailments, fatigue, and weight capacity

* Gain a resistance to fatigue via being healthy and well fed

## Transport System
Purchase, borrow, or defend AI transports to a location.

## Territories
Valuable locations with unique resources, benefits, and inhabitants.

## Convoys
Collections of AI vehicles transporting valuable cargo...
