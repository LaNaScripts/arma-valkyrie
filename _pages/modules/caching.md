---
layout: page
title: caching
---
Initially caching will involve checking for a population pool for the zone:

* if no population pool => generate a new population pool based on zone params
* if population pool => repopulate the zone based on population pool

After the population pool has been identified, the zone will be randomly repopulated with the contents of the pool.

### caching system

Eventually, the zone should be cached with a greater deal of specificity:

* for each unit in the zone => add location information for the unit to it's entry in the population pool for the zone

That way, zones will be repopulated in the same way they were left by the player, making stepping in and out of a zone less noticeable.

With that said, repopulation should involve a small amount of unpredictability, ie: units being moved slightly away from their cached positions. This will allow zones to seem slightly more dynamic while giving players a level of predictability in where to expect encounters to be placed.
