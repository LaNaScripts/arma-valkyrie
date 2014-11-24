## map load - generate new zones

## get zone parameters

## define additional zone meta-parameters using specified parameters
- zone status
- zone visibility
- zone color

## setup zone triggers

### player enters (or reenters) the zone - case statement that checks zone status
- indicate entry into zone and zone status via popup

#### zone status == inactive
- if no population exists => generate a population pool for the zone
- populate the zone based on the appropriate population pool
     
#### zone status == hostile
- do nothing?
     
#### zone status == claimed
- player can perform actions specific to "claimed" territory (ie: territories system)
- remind player of how to access territory actions (radio menu?) menu

### player leaves zone
- if zone status == "claimed" => erase population

### zone contains player but no enemies (enemies all dead)
