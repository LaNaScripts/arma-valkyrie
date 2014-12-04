valkyrie.Altis
==============

Arma 3 modules designed around facilitating a rich, dynamically-generated open world adventures. Experience a grittier, engaging version of Altis that adapts to your play style.

This project is a collection of dynamic Arma 3 modules designed to create a dynamic, immersive, and unique single player gameplay experience using the Arma 3 engine, while also allowing for extensive customization and replayability.

## Gameplay
Enter the role of a lone survivor lost deep within enemy lines. Overcome an overwhelming enemy force using only your wits and the resources around you (though if one of those resources *happens* to be an enemy heavy weapons cache, so be it).

## Core Elements
The overall goal of this project is to provide players with an enormous open world platform while retaining the small details that make a game interesting. Technically speaking, this requires a well-designed codebase that leverages dynamic spawns and limits placement of static elements for longer than absolutely necessary. 

## Modules
Specifically, the project is broken into many small and medium sized modules which can be endlessly combined to deliver a highly dynamic environment. Check out the [module development timeline](/development/timeline.md) for the status of each module.

### [optimized maps](#)
Explore an entirely new, feature-rich environment in the sands of Takistan.

* Enlarged version of Arma 2 Takistan map (reworked from scratch) with objects updated or removed, and several large desert regions added.
* New map will simultaneously offer increased performance as well as a larger playable area.
* New regions will support a *very* large array of dynamic encounters, and improve the overall balance of the environment

Had enough of the sun? Explore the frozen tundras of an *entirely* new map designed specifically for the Valkyrie module pack. Better pack your snow shoes ...

### [zone populations](#)
What's your next adventure look like? Spend less time in the editor and more time on the battlefield! Feed your sense of adventure with dynamic, self-populating zones that ensure you'll never have the same experience twice.

* dynamic enemy patrols - random behavior, loadouts, and skills from a pool of predefined encounter groups
* rural patrols - less populated areas are more likely to enemy fast movers, such as spawn technical patrols as well as civilian smugglers
* random supply airdrops - supply drops spawn randomly in player inhabited zones
* supply chasers - enemies are interested in those supplies too!

Populations are determined using a list of encounters, each with an extensive array of enemies, rewards, tasks, events, and unlockable support call-ins that can potentially be spawned.

### [Dynamic tasks](#)
Receive a randomly generated task upon approaching a place of interest marker (?). Available tasks are based on encounters generated within an area, and are intended to be dynamic while remaining in a similar context to the other elements of an encounter.

### [Virtual Training](#)
Make sure you're ready for the wastes with an extensive virtual training environment, built to showcase all aspects of valkyrie and its supporting modules.

### [resource system](#)
Salvage resources from the environment to feed your ambitions! Trade with ai merchants for [construction](#) materials, vehicles, [food](#) & supplies, repairs, weapon upgrades, or [mercenaries](#).

### [mercenaries and transport system](#)
Recruit mercenaries with randomly generated gear and expertise. Armed to the teeth already? Earn some spending money through random contracts like convoy escorts or emplacement sabotage.

### [territories, convoys, and raiding](#)
Secure key locations and defend supply convoys to secure valuable resources, or raid your enemies for theirs! Short on time? Destroy key enemy structures to render them useless until they are rebuilt - at the cost of resources.

### [construction & crafting](#)
Reshape your environment to stash supplies, provide shelter, or gain a necessary advantage when forced to halt the [advance](#) of an overwhelming enemy force. Facilitate larger operations by moving supplies via convoy or air transport.

* watch posts, guard towers
* radio towers / zone controllers. Carryable, deployable as small folding table and chair under aerial camo tent. Allow for detailed coordination of efforts in an area, and presents a key local resource to attack/defend.
* concrete & debris road barricades, sandbags
* ied charges


### [advanced caching and seeding](#)
Amass a fortune without slowing Altis to a crawl! Ensure your resources, upgrades, and tactics continue to shape Altis after you log out through intelligent caching of your strategic assets.

Save computing resources by storing unused supplies, weapons, and vehicles in a virtual resource manifest while they continue to interact with the world through a common resource pool.

Incidentally, the use of resource pools is at the core of all modules in this project, providing a significant performance boost while still supporting the original design of each module and providing a common platform for all components to interact with each other.

Looking for a change? Take an active role in shaping the world around you with environmental seeding. Beyond reducing cpu overhead and saving content, resource manifests are a great way to explore interesting gameplay scenarios.

* Setup a new resource manifest to quickly customize a new game, or try out a "what if" scenario in the world.
* Alternatively, use this module to add another level of dynamism to the start of each game by randomly generating a new resource pool.

### [active enemy communications](#)
Counterattack! Test your abilities and evolve your strategy against cunning enemy forces that react and redeploy to counter your actions. Stay one step ahead and silence key communication hubs, and confuse your enemies with feigned advances.

### [support units](#)
You did remember your radio, right?

* earn or purchase access to single-use support packages
* radio supply drops
* player-assisting ai spotters

### [organic recruitment](#)
Help the civilians of Altis come alive!

Support, avoid, or engage organic groups of ai that evolve from civilians to resistance fighters, military conscripts, or anarchists based on their surroundings.

### [night operations](#)
Strike from the shadows and see Altis in an entirely new *light*. Use the cover of night to your advantage to harass a stronger enemy force, but be careful - how can you be so sure you're not being hunted as well?

Engage dynamic enemy forces that make intelligent use of the light to fight on their terms.

### [equipment upgrades](#)
Use collected scrap to reinforce vehicles, weapons, and equipment and improve their features. One man's trash ...

### [drone reconnaissance](#)
* purchase UAVs, set them to patrol a map location, and view a live video feed from the UAV control console
* fixed view recon view using [kzk's seagullCam](http://killzonekid.com/arma-scripting-tutorials-fly-like-an-e-seagull/) on player-owned UAVs

### [perimeter defense](#)
* Craft improvised motion detectors, wide area cameras, and low/medium-tech traps using raw materials scavenged from the environment.

### [advanced health system](#)
* resistance to fatigue via being healthy and well fed

[1]: Hemsworth not included
