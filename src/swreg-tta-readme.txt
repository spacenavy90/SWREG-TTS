# Star Wars Regiment Army Builder JSON Guide

This document explains how to use, create, and edit JSON entries in the `regiment-tta.json` file for the Star Wars Regiment Army Builder on Tabletop Admiral.

## Overview
- The `regiment-tta.json` file contains all data for units, upgrades, objectives, conditions, advantages, factions, and keywords used by the army builder.
- The file is structured as a single JSON object with a `data` property containing arrays for each data type.
- All edits must maintain valid JSON syntax (commas, brackets, etc.).

## Main Sections
- `units`: Array of unit objects (troopers, vehicles, etc.)
- `upgrades`: Array of upgrade card objects (gear, weapons, pilots, etc.)
- `objectives`, `conditions`, `advantages`: Arrays of scenario cards
- `factions`: Array of playable factions
- `keywords`: Array of keyword definitions

## Editing Guidelines
- Always use a text editor with JSON syntax highlighting and validation.
- Each entry in an array is a JSON object, separated by commas.
- Do not leave trailing commas after the last entry in any array.
- All property names and string values must be in double quotes.

## Creating/Editing Units
Each unit object should follow this structure:
```json
{
  "name": "Stormtroopers",
  "factions": [ 
        { 
        "name": "Empire", 
        "rank": "Corps" 
        } 
    ],
  "imageUrl": "<image-url>",
  "upgradeTypes": [
    "Personnel", 
    "Weapon", 
    "Training"
    ],
  "points": 50,
  "health": 1,
  "courage": 1,
  "move": 4,
  "defense": 0,
  "keywords": [
    "Precise X"
    ],
  "elements": 1,
  "unlimited": true,
  "unittype": ["Trooper"]
}
```
- `factions` is an array of objects with `name` and `rank`.
- `upgradeTypes` lists allowed upgrade slots.
- `keywords` are strings matching entries in the `keywords` array.
- `imageUrl` should be a direct link to the card image.

## Creating/Editing Upgrades
Each upgrade object should follow this structure:
```json
{
  "name": "Personal Energy Shields",
  "points": 15,
  "factions": ["Rebel", "Empire", "Republic", "Separatist"],
  "keywords": ["Shields X"],
  "availableIn": ["AT-AT"],
  "type": "Gear",
  "requiresTier": "Corps",
  "requiresProperty": {
        "property": "unittype",
        "value": "Trooper"
    },
  "imageUrl": "<image-url>"
}
```
- `factions` is an array of faction names (or empty for all).
- `type` must match one of the upgrade types used in units' `upgradeTypes`.
- Optional properties: `requiresTier`, `requiresProperty`, `availableIn`, `effect`.
- `keywords` are strings matching entries in the `keywords` array.

## Creating/Editing Objectives, Conditions, Advantages
- Each is an array of objects with at least `name` and `imageUrl(s)`.
- Example:
```json
{
  "name": "Area Denial",
  "imageUrls": ["<map-image-url>", "<card-image-url>"],
  "factions": [ { "name": "Rebels" }, ... ]
}
```

## Creating/Editing Keywords
- Each keyword object should have `name` and `definition`.
- Example:
```json
{
  "name": "Impact X",
  "definition": "During the Modify Attack Dice step..."
}
```

## Best Practices
- Validate your JSON after every edit (use https://jsonlint.com/ or a code editor with validation).
- Keep backup copies before making large changes.
- Follow the structure and property names exactly as shown in existing entries.
- When adding new entries, copy the format of similar existing entries.

## Troubleshooting
- If the army builder website fails to load, check for JSON syntax errors (missing commas, brackets, or quotes).
- Ensure all referenced keywords and upgrade types exist in their respective arrays.

---
For further help, see the example entries in the file or contact the project maintainer.