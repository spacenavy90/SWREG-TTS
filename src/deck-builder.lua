----#include !/Deck
-- Utilities around creating and managing decks of cards.
Deck = {}
Deck.__index = Deck;
function Deck:create()
  local meta = {
    _backs = {
      command     = "https://steamusercontent-a.akamaihd.net/ugc/923676470468121470/B601C237FC093688B758499B99CC87FDFE2FDD0F/",
      contignency = "https://steamusercontent-a.akamaihd.net/ugc/1753560235958347056/F845CB170FEF761DC7025AA3EEAE731F018C0E73/",
      horizontal  = {
        objective   = "https://steamusercontent-a.akamaihd.net/ugc/786360308354563159/BDB495B60FFED8707BD013502C2F03D3F047B63E/",
        condition   = "https://steamusercontent-a.akamaihd.net/ugc/786360308354563381/FF7DF081311A20CC396CAC9391D85EB1FBCA44E1/",
        deployment  = "https://steamusercontent-a.akamaihd.net/ugc/786360308354562872/AF68672CC3B5A0A27A37FA0C02FD87F2210FAB86/",
      },
      vertical    = {
        objective   = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071278905/7391A9D8F237C6D5361EE068AB9083F51FAEE83E/",
        condition   = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279002/608E86CFE4BAF5BA63E5AAE86ECBA1526E6EB26C/",
        deployment  = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071278944/D0E9A51135A2AEEF1CB100554DA46B0704ECCB28/",
      },
    },
    _unknown = {
      command     = "https://steamusercontent-a.akamaihd.net/ugc/1683770885590601027/47E5B7470CAAC79372CB5C607AEF29DF195EB7CE/",
      unit        = "https://steamusercontent-a.akamaihd.net/ugc/1683770885590600993/4D9BAC2DD180E2CFF9A591E19EFEBD470CB25855/",
      upgrade     = "https://steamusercontent-a.akamaihd.net/ugc/1683770885590601060/FA4DD3B17A42BCD5A81D063CD13E257A0EBD419D/",
    },
    _cache   = {
      upgrades    = {},
    },
  }
  setmetatable(meta, Deck)
  return meta
end

function Deck:_getSchema()
  return Global.getTable("CardsSchema")
end

function Deck:spawnUnitCard(faction, name)
  -- TODO: Remove remapping.
  local remap = {
    ["imperial"]   = "Empire",
  }
  if remap[faction] ~= nil then
    faction = remap[faction]
  end
  local units = self:_getSchema().units[faction:upper()]
  if units == nil then
    return self:_spawnUnitOrBattleDud(name, "No matching faction found: \"" .. faction .. "\".")
  end
  local unit = units[name:upper()]
  if unit == nil then
    return self:_spawnUnitOrBattleDud(name, "No matching unit found.\n" .. "Faction: " .. faction)
  else
    local image = unit.image
    if image == "" then
      image = self._unknown.unit
    end
    local card = self:_spawnCard(image, image)
    if image == "" then
      card.setDescription("No image specified! Using fallback.")
    end
    local name = unit.name
    if unit.title ~= nil then
      name = name .. ": " .. unit.title
    end
    card.setName(name)
    return card
  end
end

function Deck:spawnUnitDeck(faction, position)
  local units = self:_getSchema().units[faction:upper()]
  if units == nil then
    return self:_spawnUnitOrBattleDud(faction, "No matching faction found.")
  end
  local header
  local deck
  for name, _ in pairs(units) do
    local card = self:spawnUnitCard(faction, name)
    if header == nil then
      header = card
      deck = card
    else
      local container = header.putObject(card)
      if container ~= nil then
        deck = container
      end
    end
    if position ~= nil then
      card.setPosition(position)
    end
  end
  return deck
end

function Deck:spawnUpgradeCard(name)
  -- TODO: Remove remapping.
  local remap = {
    ["A-180 Config"]                    = "A-180 Rifle Config",
    ["A-300 Config"]                    = "A-300 Long Range Config",
    ["A-280-CFE Config"]                = "A280-CFE Sniper Config",
    ["Battle Shield Wookiee"]           = "Battle Shield Wookiee (Offensive)",
    ["E-11D Config"]                    = "E-11D Focused Fire Config",
    ["J-19 Bo-rifle"]                   = "J-19 Bo-Rifle Blaster",
    ["C-3PO Human-Cyborg Relations"]    = "C-3PO",
    ["C-3PO Made to Suffer"]            = "C-3PO",
    ["Iden's ID10 Seeker Droid Droid"]  = "Iden's ID10 Seeker Droid",
  }
  if remap[name] ~= nil then
    name = remap[name]
  end
  local upgrade = self:_getSchema().upgrades[name:upper()]
  if upgrade == nil then
    return self:_spawnUpgradeDud(name, "No matching upgrade found.")
  else
    local unknown = self._unknown.upgrade
    local name = upgrade.name
    local front = upgrade.image
    local back = ""
    if upgrade.flip == nil then
      back = front
    else
      name = name .. " / " .. upgrade.flip.name
      back = upgrade.flip.image
    end
    if front == "" then
      front = unknown
    end
    if back == "" then
      back = unknown
    end
    local card = self:_spawnCard(front, back)
    if front == unknown or back == unknown then
      card.setDescription("One or more images not specified! Using fallback.")
    end
    card.setName(name)
    return card
  end
end

function Deck:spawnUpgradeDeck(position)
  local header
  local deck
  for name, _ in pairs(self:_getSchema().upgrades) do
    local card = self:spawnUpgradeCard(name)
    if header == nil then
      header = card
      deck = card
    else
      local container = header.putObject(card)
      if container ~= nil then
        deck = container
      end
    end
    if position ~= nil then
      card.setPosition(position)
    end
  end
  return deck
end

function Deck:spawnCommandCard(name, isContingency)
  if not self._cache.commands then
    self:_cacheCommandCardsByName()
  end
  local command = self._cache.commands[name:upper()]
  if command == nil then
    return self:_spawnCommandDud(name, "No matching command found.", isContingency)
  else
    local name = command.name
    local image = command.image
    if image == "" then
      image = self._unknown.command
    end
    local back = self._backs.command
    if isContingency == true then
      back = self._backs.contignency
    end
    local card = self:_spawnCard(image, back)
    if command.image == "" then
      card.setDescription("No image specified! Using fallback.")
    end
    card.setName(name)
    return card
  end
end

function Deck:spawnCommandDeck(position)
  if not self._cache.commands then
    self:_cacheCommandCardsByName()
  end
  local header
  local deck
  for name, _ in pairs(self._cache.commands) do
    local card = self:spawnCommandCard(name)
    if header == nil then
      header = card
      deck = card
    else
      local container = header.putObject(card)
      if container ~= nil then
        deck = container
      end
    end
    if position ~= nil then
      card.setPosition(position)
    end
  end
  return deck
end

function Deck:_cacheCommandCardsByName()
  local schema = self:_getSchema()
  local cache = {}
  for _, units in pairs(schema.units) do
    for _, unit in pairs(units) do
      if unit.commands then
        for _, command in ipairs(unit.commands) do
          cache[command.name:upper()] = command
        end
      end
    end
  end
  for _, command in pairs(schema.commands) do
    cache[command.name:upper()] = command
  end
  self._cache.commands = cache
end

function Deck:spawnBattleCard(category, name, scenario)
  if scenario == nil then
    scenario = "standard"
  end
  -- TODO: Remove remapping.
  if category == "conditions" then
    category = "condition"
  end
  local categories = self:_getSchema().battlefield[scenario:lower()]
  if categories == nil then
    return self:_spawnUnitOrBattleDud(name, "No matching scenario: \"" .. scenario .. "\".")
  end
  local cards = categories[category:lower()]
  if cards == nil then
    return self:_spawnUnitOrBattleDud(name, "No matching command card found.\n" .. "Scenario: " .. scenario .. "\nCategory: " .. category)
  end
  local details = cards[name:upper()]
  if details == nil then
    return self:_spawnUnitOrBattleDud(name, "No matching command card found.\n" .. "Scenario: " .. scenario .. "\nCategory: " .. category)
  else
    local image = details.image
    if image == "" then
      image = self._unknown.unit
    end
    local type = details.type
    local card = self:_spawnCard(image, self._backs[type:lower()][category:lower()])
    if image == "" then
      card.setDescription("No image specified! Using fallback.")
    end
    card.setName(details.name)
    return card
  end
end

function Deck:spawnBattleDeck(position, scenarioName)
  if scenarioName == nil then
    scenarioName = "standard"
  end
  local scenario = self:_getSchema().battlefield[scenarioName:lower()]
  if scenario == nil then
    return self:_spawnUnitOrBattleDud("Deck failed to load: " .. scenario, "No matching scenario.")
  end
  local header
  local deck
  for category, cardsByName in pairs(scenario) do
    for name, details in pairs(cardsByName) do
      local card = self:spawnBattleCard(category, name, scenarioName)
      if header == nil then
        header = card
        deck = card
      else
        local container = header.putObject(card)
        if container ~= nil then
          deck = container
        end
      end
      if position ~= nil then
        card.setPosition(position)
      end
    end
  end
  return deck
end

function Deck:_spawnUnitOrBattleDud(name, description)
  local card = self:_spawnCard(self._unknown.unit)
  card.setName(name)
  card.setDescription(description)
  return card
end

function Deck:_spawnUpgradeDud(name, description)
  local card = self:_spawnCard(self._unknown.upgrade)
  card.setName(name)
  card.setDescription(description)
  return card
end

function Deck:_spawnCommandDud(name, description, isContingency)
  local back = self._backs.command
  if isContingency == true then
    back = self._backs.contignency
  end
  local card = self:_spawnCard(self._unknown.command, back)
  card.setName(name)
  card.setDescription(description)
  return card
end

function Deck:_spawnCard(front, back)
  local custom = spawnObject({
    type     = "CardCustom",
    position = {54.62, 0.94, -35.45},
    scale    = {0.83, 1, 0.83},
  })
  -- Failsafe to avoid a `nil` error.
  if back == nil then
    back = front
  end
  custom.setCustomObject({
    face     = front,
    back     = back,
  })
  return custom
end

function Deck:getFactions()
  local result = {}
  for faction, _ in pairs(self._getSchema().units) do
    table.insert(result, faction)
  end
  return result
end

function Deck:getUnitsByFactionAndRank(faction, rank)
  -- TODO: Remove remapping.
  local remap = {
    ["imperial"]   = "Empire",
  }
  if remap[faction] ~= nil then
    faction = remap[faction]
  end
  local units = self:_getSchema().units[faction:upper()]
  if units == nil then
    return {}
  end
  local result = {}
  for _, unit in pairs(units) do
    if unit.rank:upper() == rank:upper() then
      table.insert(result, unit)
    end
  end
  return result
end

function Deck:getUnitByFactionAndName(faction, name)
  -- TODO: Remove remapping.
  local remap = {
    ["imperial"]   = "Empire",
  }
  if remap[faction] ~= nil then
    faction = remap[faction]
  end
  local units = self:_getSchema().units[faction:upper()]
  if not units then
    return nil
  end
  return units[name:upper()]
end

function Deck:getUpgradesByType(type, filterForUnit)
  -- Makes the cost of this less unbearable since it's called many times.
  local cacheKey = type:upper()
  if filterForUnit then
    cacheKey = cacheKey .. "_" .. filterForUnit.name:upper()
  end
  if self._cache.upgrades[cacheKey] then
    return self._cache.upgrades[cacheKey]
  end
  local result = {}
  for _, upgrade in pairs(self:_getSchema().upgrades) do
    if upgrade.type:upper() == type:upper() then
      if not filterForUnit or self:_isUpgradeValidFor(upgrade, filterForUnit) then
        table.insert(result, upgrade)
      end
    end
  end
  self._cache.upgrades[cacheKey] = result
  return result
end

function Deck:_isUpgradeValidFor(upgrade, unit)
  local restrictions = upgrade.restrictions

  -- Basically this exists so B1's can equip Binoculars/Scanner.
  -- Hopefully AMG uses this again in the future, because otheriwse ugh.
  if restrictions and restrictions.override and restrictions.override.unit then
    for _, overrideForUnit in ipairs(restrictions.override.unit) do
      if overrideForUnit:upper() == unit.name:upper() then
        return true
      end
    end
  end

  if restrictions then
    if restrictions.include then
      local nonUnitChecks = 0
      local passedNonUnit = 0

      if restrictions.include.faction then
        nonUnitChecks = nonUnitChecks + 1
        for _, unitFaction in ipairs(restrictions.include.faction) do
          if unitFaction:upper() == unit.faction:upper() then
            passedNonUnit = passedNonUnit + 1
            break
          end
        end
      end

      -- If there is a unit test, and we pass, then it's valid.
      -- There currently are no "<NAME> and <OTHER CONDITION> only upgrades".
      if restrictions.include.unit then
        for _, unitName in ipairs(restrictions.include.unit) do
          if unitName:upper() == unit.name:upper() then
            return nonUnitChecks == passedNonUnit
          end
        end

        if nonUnitChecks > 0 and not restrictions.include.rank then
          return false
        end
      end

      if restrictions.include.rank then
        nonUnitChecks = nonUnitChecks + 1
        for _, unitRank in ipairs(restrictions.include.rank) do
          if unitRank:upper() == unit.rank:upper() then
            passedNonUnit = passedNonUnit + 1
            break
          end
        end
      end

      if restrictions.include.type then
        nonUnitChecks = nonUnitChecks + 1
        for _, unitType in ipairs(restrictions.include.type) do
          if string.find(unit.type:upper(), unitType:upper()) then
            passedNonUnit = passedNonUnit + 1
            break
          end
        end
      end

      if restrictions.include.slot then
        for _, slotType in ipairs(restrictions.include.slot) do
          nonUnitChecks = nonUnitChecks + 1
          if unit.upgrades[slotType] then
            passedNonUnit = passedNonUnit + 1
          end
        end
      end

      if restrictions.include.alignment and unit.name:upper() ~= "ANAKIN SKYWALKER" then
        local known = {
          imperial   = 1,
          rebel      = 1,
          separatist = 1,
          republic   = 1,
        }
        if not known[unit.faction:lower()] then
          -- HACK: Don't filter out alignment based cards for homebrew factions.
          return true
        end
        for _, unitAlignment in ipairs(restrictions.include.alignment) do
          unitAlignment = unitAlignment:upper()
          if unitAlignment == "LIGHT" then
            return unit.faction:upper() == "REBEL" or unit.faction:upper() == "REPUBLIC"
          elseif unitAlignment == "DARK" then
            return unit.faction:upper() == "EMPIRE" or unit.faction:upper() == "SEPARATIST" or unit.faction:upper() == "SHADOWCOLLECTIVE"
          end
        end
      end

      return nonUnitChecks > 0 and passedNonUnit == nonUnitChecks
    end

    if restrictions.exclude then
      if restrictions.exclude.type then
        for _, unitType in ipairs(restrictions.exclude.type) do
          if string.find(unit.type:upper(), unitType:upper()) then
            return false
          end
        end
      end
    end
  end

  return true
end

function Deck:getUpgradeByName(name)
  return self:_getSchema().upgrades[name:upper()]
end

function Deck:getCommandsByFactionAndUnits(faction, units)
  -- TODO: Remove remapping.
  local remap = {
    ["imperial"]   = "Empire",
  }
  if remap[faction] ~= nil then
    faction = remap[faction]
  end
  local schema = self:_getSchema()
  local database = schema.units[faction:upper()]
  if not database then
    return {}
  end
  local result = {}
  for _, name in ipairs(units) do
    local unit = database[name:upper()]
    if unit and unit.commands then
      for _, command in ipairs(unit.commands) do
        table.insert(result, command)
      end
    end
  end
  for _, command in pairs(schema.commands or {}) do
    if command.faction:upper() == "GENERIC" or command.faction:upper() == faction:upper() then
      table.insert(result, command)
    end
  end
  return result
end

function Deck:getBattleCardType(name, scenario)
  if not scenario then
    scenario = 'standard'
  end
  scenario = scenario:lower()
  for type, cards in pairs(self:_getSchema().battlefield[scenario]) do
    if cards[name:upper()] then
      return type
    end
  end
  return nil
end

function Deck:getBattleCardNamesByType(name, scenario)
  if not scenario then
    scenario = 'standard'
  end
  scenario = scenario:lower()
  if name:lower() == "conditions" then
    name = "condition"
  end
  name = name:lower()
  local cards = self:_getSchema().battlefield[scenario][name]
  if not cards then
    return {}
  end
  local result = {}
  for _, entry in pairs(cards) do
    table.insert(result, entry.name)
  end
  return result
end

function Deck:getDeploymentBoundary(name, scenario_name)
  if not scenario_name then
    scenario_name = 'standard'
  end
  scenario_name = scenario_name:lower()
  local scenario = self:_getSchema().battlefield[scenario_name]
  if not scenario then
    print("Could not find cards for scenario: " .. scenario_name)
    return {}
  end
  local deployment = scenario.deployment[name:upper()]
  if not deployment then
    print("Could not find cards for deployment: " .. name .. " (" .. scenario_name .. ")")
    return {}
  end
  return deployment.zone or {}
end

function Deck:getBattleCardScenarios()
  local result = {}
  for name, deck in pairs(self._getSchema().battlefield) do
    local hasCards = 0
    for _, cards in pairs(deck) do
      if #cards then hasCards = hasCards + 1 end
    end
    if hasCards == 3 then
      table.insert(result, name)
    end
  end
  return result
end

function Deck:getBattleCardObjects(name, card_type, scenario_name)
  if not scenario_name then
    scenario_name = 'standard'
  end
  scenario_name = scenario_name:lower()
  local scenario = self:_getSchema().battlefield[scenario_name]
  if not scenario then
    print("Could not find cards for scenario: " .. scenario_name)
    return {}
  end
  local cards = scenario[card_type]
  if not cards then
    print("Could not find cards for type: " .. card_type)
    return {}
  end
  for cardName, card in pairs(cards) do
    if cardName:upper() == name:upper() then
      return card.additionalObjects or {}
    end
  end
  return {}
end

----#include !/Deck

-- Defined via setLuaScript:
--   _G.selectedScenario

function onload(save_state)
    self.interactable = false
    listBuilder = Global.getTable("listBuilder")
    _G.Deck = Deck:create()

    battlefieldEntry = {}
    battlefieldEntry.clickFunction = {}
    battlefieldEntry.clickFunction[1] = "objectiveSubMenu"
    battlefieldEntry.clickFunction[2] = "deploymentSubMenu"
    battlefieldEntry.clickFunction[3] = "conditionsSubMenu"

    battlefieldEntry.labelString = {}
    battlefieldEntry.labelString[1] = "Objective"
    battlefieldEntry.labelString[2] = "Deployment"
    battlefieldEntry.labelString[3] = "Conditions"

    selectedCommanders = {}

    deckBuilderCommandCategories = {
      "1 Pips",
      "1 Pips: Contingencies",
      "2 Pips",
      "2 Pips: Contingencies",
      "3 Pips",
      "3 Pips: Contingencies"
    }

    resetCommandCards()

    -- Default selections. Can be changed by the user!
    battlefieldCardSelection = {
      objective = {
        "Key Positions",
        "Breakthrough",
        "Intercept The Transmissions",
        "Recover The Supplies",
      },
      deployment = {
        "Battle Lines",
        "The Long March",
        "Disarray",
        "Major Offensive",
      },
      conditions = {
        "Clear Conditions",
        "Limited Visibility",
        "Rapid Reinforcements",
        "Hostile Environment",
      },
    }

    resetButtons()
end


function resetCommandCards()
    commandCardSelection = {
      "Ambush",
      "Push",
      "Assault",
      "Standing Orders",
    }
    contingencyCardSelection = {}
end

function addCommander(selectedCommander)
    table.insert(selectedCommanders, selectedCommander)
    resetCommandCards()
    resetButtons()
end

function resetButtons()
    nilChoices()
    updateButtons()
end

function removeCommander(selectedCommander)
    for k, entry in pairs (selectedCommanders) do
        if entry ==  selectedCommander then
            table.remove(selectedCommanders, k)
            break
        end
    end
    resetCommandCards()
    resetButtons()
end

function nilChoices()
    selectionEntry = {}
    for i=1,11,1 do
        selectionEntry[i] = {}
        selectionEntry[i].entryName = ""
        selectionEntry[i].clickFunction = "dud"
        selectionEntry[i].fontSize = 160
        selectionEntry[i].color = {0.1764,0.1764,0.1764,50}
        selectionEntry[i].fontColor = {0,0,0,0}
    end
end

function updateButtons()
    self.clearButtons()
    resetCommandCardButtons()
    resetBattlefieldButtons()
    resetChoicesButtons()
end

function resetCommandCardButtons()
    for i=1,6,1 do

        _G["commandCardEntry"..i] = function() commandCardSubMenu(i) end

        local data = {
            click_function = "commandCardEntry"..i,
            function_owner = self,
            label = deckBuilderCommandCategories[i],
            position = {1.4, 0.28, 2.394-(i*0.354)},
            rotation = {0, 180, 0},
            scale = {0.5, 0.5, 0.5},
            width = 2040,
            height = 410,
            font_size = correctStringLength(deckBuilderCommandCategories[i]),
            color = {0.1764, 0.1764, 0.1764, 0.01},
            font_color = {0, 0, 0, 100},
            tooltip = ""
        }
        self.createButton(data)
    end
end

function resetBattlefieldButtons()
    for n=1,3,1 do
        local data = {
            click_function = battlefieldEntry.clickFunction[n],
            function_owner = self,
            label = battlefieldEntry.labelString[n],
            position = {1.4, 0.28, -0.336-(n*0.354)},
            rotation = {0, 180, 0},
            scale = {0.5, 0.5, 0.5},
            width = 2040,
            height = 410,
            font_size = 160,
            color = {0.1764, 0.1764, 0.1764, 0.01},
            font_color = {0, 0, 0, 100},
            tooltip = ""
        }
        self.createButton(data)
    end
end

function resetChoicesButtons()

    for i=1,11,1 do
        local choiceData = {
            click_function = selectionEntry[i].clickFunction,
            function_owner = self,
            label = selectionEntry[i].entryName,
            position = {-1.45, 0.28, 2.394-(i*0.354)},
            rotation = {0, 180, 0},
            scale = {0.5, 0.5, 0.5},
            width = 2040,
            height = 410,
            font_size = selectionEntry[i].fontSize,
            color = selectionEntry[i].color,
            font_color = selectionEntry[i].fontColor,
            tooltip = ""
        }
        self.createButton(choiceData)
    end
end

function commandCardSubMenu(numberSelection)
  nilChoices()

  -- PIP SELECTION
  local pipSelected = math.ceil(numberSelection / 2)
  local isContingencies = numberSelection % 2 == 0
  local selectedCards
  if isContingencies then
    selectedCards = contingencyCardSelection
  else
    selectedCards = commandCardSelection
  end

  local validCCs = Deck:getCommandsByFactionAndUnits(
    selectedFaction,
    selectedCommanders
  )

  local index = 1
  for _, potentialCC in ipairs(validCCs) do
    if potentialCC.pip == pipSelected then
      local availableCard = potentialCC.name
      local selected = false
      for _, card in ipairs(selectedCards) do
        if availableCard == card then
          selected = true
          break
        end
      end
      _G["choiceSubMenu"..index] = function() 
        selectCommandCard(isContingencies, availableCard, numberSelection)
      end
      local aColor = {0.1764,0.1764,0.1764,0.01}
      if selected then
        aColor = {0,1,1,0.5}
      end
      local aFontColor = {0,0,0,100}
      if selected then
        aFontColor = {0,0,0,2}
      end
      setChoiceAttributes(
        index,
        availableCard,
        "choiceSubMenu"..index,
        aColor,
        aFontColor
      )
      index = index + 1
    end
  end

  updateButtons()
end

function objectiveSubMenu()
    battlefieldCardSubMenu("objective")
end

function deploymentSubMenu()
    battlefieldCardSubMenu("deployment")
end

function conditionsSubMenu()
    battlefieldCardSubMenu("conditions")
end

function battlefieldCardSubMenu(selectedType)
  nilChoices()

  j = 1
  for i, entry in ipairs(Deck:getBattleCardNamesByType(selectedType, selectedScenario)) do
    _G["choiceSubMenu"..i] = function() 
      toggleBattlefieldCard(selectedType, entry)
    end
    acolor = {0.1764,0.1764,0.1764,0.01}
    afontColor = {0,0,0,100}

    for _, entryChoice in ipairs(battlefieldCardSelection[selectedType]) do
      if entryChoice:lower() == entry:lower() then
        acolor = {0,1,1,0.5}
        afontColor = {0,0,0,2}
        break
      else
        acolor = {0.1764,0.1764,0.1764,0.01}
        afontColor = {0,0,0,100}
      end
    end

    setChoiceAttributes(j, entry, "choiceSubMenu"..i, acolor, afontColor)
    j = j + 1
  end

  updateButtons()
end

function setChoiceAttributes(numberSelect, entryName, clickFunction, color, fontColor)

    selectionEntry[numberSelect].entryName = entryName
    selectionEntry[numberSelect].clickFunction = clickFunction

    selectionEntry[numberSelect].fontSize = correctStringLength(entryName)

    selectionEntry[numberSelect].color = color
    selectionEntry[numberSelect].fontColor = fontColor
end

function selectCommandCard(isContingencies, selectedCard, subMenuIndex)
    local selectedCards

    if isContingencies then
      selectedCards = contingencyCardSelection
    else
      selectedCards = commandCardSelection
    end

    for i, n in ipairs(selectedCards) do
      if n == selectedCard then
        table.remove(selectedCards, i)
        commandCardSubMenu(subMenuIndex)
        return
      end
    end

    table.insert(selectedCards, selectedCard)
    commandCardSubMenu(subMenuIndex)
end

function toggleBattlefieldCard(battlefieldCardType, selectedBattlefieldCard)
    noCardFound = true
    for i, entry in pairs (battlefieldCardSelection[battlefieldCardType]) do
        if entry ==  selectedBattlefieldCard then
            noCardFound = false
            table.remove(battlefieldCardSelection[battlefieldCardType], i)
            break
        else
            noCardFound = true
        end
    end
    if noCardFound == true then
        table.insert(battlefieldCardSelection[battlefieldCardType], selectedBattlefieldCard)
    end

    battlefieldCardSubMenu(battlefieldCardType)
end

function dud()
end

function correctStringLength(measuredString)
    if string.len(measuredString) > 21 then
        local returnLength = 160 - ((string.len(measuredString) - 22) * 5.5)
        return returnLength
    else
        return 160
    end
end

function switchBattleDeck(params)
  if not params or not params.name then
    return
  end
  _G.selectedScenario = params.name
  -- TODO: Make configurable as defaults.
  if params.name:lower() == 'standard' then
    battlefieldCardSelection = {
      objective = {
        "Key Positions",
        "Breakthrough",
        "Intercept The Transmissions",
        "Recover The Supplies",
      },
      deployment = {
        "Battle Lines",
        "The Long March",
        "Disarray",
        "Major Offensive",
      },
      conditions = {
        "Clear Conditions",
        "Limited Visibility",
        "Rapid Reinforcements",
        "Hostile Environment",
      },
    }
  elseif params.name:lower() == 'skirmish' then
    battlefieldCardSelection = {
      objective  = {
        "Breach",
        "Control",
        "Elimination",
        "Pivotal Positions",
      },
      deployment = {
        "Battle Lines",
        "Faceoff",
        "Flanking Positions",
        "Meeting Engagement",
      },
      conditions = {
        "War Weary",
        "Improvised Defenses",
        "Dawn",
        "Clear Conditions",
      },
    }
  else
    battlefieldCardSelection = {
      objective  = {},
      deployment = {},
      conditions = {},
    }
  end
  resetButtons()
  updateButtons()
end
