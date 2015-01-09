---
layout: page
title: HUD Requirements
---
## Style
**HUD elements should be uniform in style and colors:** Think hand-scribbled, blood spattered menus crudely drawn on crumpled paper in messy handwriting.

* [ ] **font** - `Permanent Marker`, handwriting diary font, monospaced ID font, and general text font added
* [ ] **colors** - muted color palette of < 8 colors selected
* [ ] **elements** - hud, looting, inventory, crafting, trading, medical, group menus
* [ ] **components** - all core components, (i.e. outlines, background opacity, close buttons) defined in configs

### Menu Components
* [ ] border outlines (items, buttons, inventory grid units)
* [ ] inventory grid unit
* [ ] background opacity & colors
* [ ] close buttons

#### Inventory Grid Units
Items should be constructed of many grid units, and specify the following:

* x units - units across; should calculate image width based off units
* y units - units tall; should calculate image height based off units
* image - image to lay across all grid units
* color - border outline should be a calculated automatically based off of this
* quantity - white text with drop shadow in upper right corner

Empty grid units should be darker (possibly shadowed) and one neutral color

#### Considerations
* hand-drawn lines defining all player menus such as map, inventory, crafting, resource & group management.
* white-stroked hand-drawn icons and buttons
* HUD elements should be framed/backlit by lightly colored, semi-transparent shapes
* temporary elements (status affects, observations) should fade in and out if possible

### Player HUD Elements

## Components
* [ ] hud
* [ ] looting
* [ ] inventory
* [ ] crafting
* [ ] trading
* [ ] medical
* [ ] group management
* [ ] infrastructure management
* [ ] ID / journal - *dynamically generated* character info, carried as in-game items; address, nationality, age, gender, blood type, allergies **(id)** backstory, fears, likes, dislikes **(journal)**

## Inventory

### player (paper doll)
Display a distributed collection of inventory grids for equipped items, and the corresponding inventory grids underneath any equipped items.

* **head**
* **face**
* **clothes**
* **chest**
* **waist**
* **back & lash points** - lash points should show item models on character's back
* **shoulder**
* **ID**

### player (options)
* weight
* "craft" button
* "open all" button
* "close all" button

### inspect
Display as inventory list.

* Could later be item specific, i.e: corpse paper doll / container / captive paper doll

### ground
Display as inventory list.

### Other Considerations
* [ ] `attachTo` items to shoulder/back/belt/chest dynamically, based on inventory location


## HUD

### Status Affects
Display information of player status, conditions, or other affects currently applied to the player.

* icon based
* semi-transparent

### Health

### Observations
Player character will occasionally mention observations here, as a way of communicating more directly with the player. The goal for this area is to present small, unique, or otherwise intangible details to the player i.e:

* smells
* sounds
* tastes
* feelings
* temperatures
