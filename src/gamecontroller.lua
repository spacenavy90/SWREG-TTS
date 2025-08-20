----#include !/Analytics
function ga_track(data)
  local url =  "http://www.google-analytics.com/collect"
  local payload = {
    v   = "1",
    tid = "UA-192712398-2",
    cid = Global.getVar("CCID"),
    uid = Global.getVar("UUID"),
  }
  for k, v in pairs(data) do
    payload[tostring(k)] = tostring(v)
  end
  WebRequest.post(url, payload)
end

function ga_event(category, action, label, value)
  local data = {
    t   = "event",
    ec  = category,
    ea  = action,
  }
  if label ~= nil then
    data["el"] = label
    if value ~=nil then
      data["ev"] = value
    end
  end
  ga_track(data)
end

function ga_view(screen, title)
  local data = {
    t   = "pageview",
    dp  = screen,
  }
  if title ~= nil then
    data["dt"] = title
  end
  ga_track(data)
end

function ga_timing(category, variable, time, label)
  ga_track({
    t   = "timing",
    utc = category,
    utv = variable,
    utt = time,
    utl = label,
  })
end

function ga_exception(description, is_fatal)
  if is_fatal == true then
    is_fatal = 1
  else
    is_fatal = 0
  end
  ga_track({
    t   = "exception",
    exd = description,
    exf = is_fatal,
  })
end

----#include !/Analytics
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

existingMasks = {}
existingPoiGuide = nil

function onload(save_state)
    _G.Deck = Deck:create()

    -- init values
    gameData = getObjectFromGUID(Global.getVar("gameDataGUID"))
    battlefieldTint = gameData.getTable("battlefieldTint")

    gameController = Global.getTable("gameController")
    mountZone = getObjectFromGUID(gameController.mountZoneGUID)
    battlefieldZone = getObjectFromGUID(Global.getVar("battlefieldZoneGUID"))
    battlefieldTable = getObjectFromGUID(Global.getVar("battlefieldTable"))
    customMapsCartridge = getObjectFromGUID(gameController.customMapsGUID)
    deploymentOverlays = getObjectFromGUID(gameController.deploymentOverlaysGUID)

    listBuilder = Global.getTable("listBuilder")
    redZone = getObjectFromGUID(listBuilder.redZoneGUID)
    blueZone = getObjectFromGUID(listBuilder.blueZoneGUID)
    screen = getObjectFromGUID(Global.getVar("screenGUID"))
    objectiveCards = getObjectFromGUID(gameController.objectiveCardsGUID)
    deploymentCards = getObjectFromGUID(gameController.deploymentCardsGUID)
    conditionsCards = getObjectFromGUID(gameController.conditionsCardsGUID)
    setUpData = Global.getTable("setUpData")
    setUpData.deploymentMount = getObjectFromGUID(setUpData.deploymentMountGUID)
    setUpData.conditionsMount = getObjectFromGUID(setUpData.conditionsMountGUID)
    setUpData.objectiveMount = getObjectFromGUID(setUpData.objectiveMountGUID)
    commandTokenTrayData = Global.getTable("commandTokenTrayData")
    commandTokenData = Global.getTable("commandTokenData")
    zonesGUIDs = Global.getTable("zonesGUIDs")

    setUpController = getObjectFromGUID(Global.getVar("setUpControllerGUID"))
    battleDeckTypes = {"deployment", "objective", "conditions"}

    blueDeckMount = getObjectFromGUID(listBuilder.blueDeckMountGUID)
    redDeckMount = getObjectFromGUID(listBuilder.redDeckMountGUID)
    blueDeckZone = getObjectFromGUID(listBuilder.blueDeckZoneGUID)
    redDeckZone = getObjectFromGUID(listBuilder.redDeckZoneGUID)


    -- button Models
    dataDiskMount = getObjectFromGUID("a44dcb")

    optionObjs = {}

    optionObjs.gameControllerOption1 = getObjectFromGUID("9200f4")
    optionObjs.gameControllerOption2 = getObjectFromGUID("de5eb8")
    optionObjs.gameControllerOption3 = getObjectFromGUID("44c5b4")
    optionObjs.gameControllerOption4 = getObjectFromGUID("a4448e")
    optionObjs.gameControllerOption5 = getObjectFromGUID("971605")

    optionButtons = {}

    optionButtons.gameControllerOption1Button = getObjectFromGUID("4663eb")
    optionButtons.gameControllerOption2Button = getObjectFromGUID("3c301d")
    optionButtons.gameControllerOption3Button = getObjectFromGUID("05d327")
    optionButtons.gameControllerOption4Button = getObjectFromGUID("6cfaf1")
    optionButtons.gameControllerOption5Button = getObjectFromGUID("3cd1bf")

    backButton = getObjectFromGUID("ae44c9")
    prevButton = getObjectFromGUID("f563ce")
    nextButton = getObjectFromGUID("d81a06")

    homeScreen()
    mainMenu()
end

function homeScreen()
    screen.createButton({click_function = "dud", function_owner = self, label = "", position = {0.9, 0.25, 0}, rotation = {0, -90, 90}, scale = {0.5, 0.5, 0.5}, width = 0, height = 0, font_size = 100, font_color = {0.8867, 0.7804, 0, 1}, alignment = 1})
    printToScreen("STAR WARS REGIMENT TTS MOD\n by SpaceNavy\n\nSelect an option below to start", 80, 3)
end


-- MENU

function mainMenu()
    timerScreen = false

    printToScreen("STAR WARS REGIMENT TTS MOD\n by SpaceNavy\n\nSelect an option below to start", 80, 3)

    clearAllButtons()
    local menuEntries = {}
    menuEntries[1] = {functionName = "mapMenu", label = "Maps", tooltip = "Map Menu", buttonTint = {0,0.913,1}}
    menuEntries[2] = {functionName = "gameOptionsMenu", label = "Set Up", tooltip = "Set Up options menu", buttonTint = {0,0.913,1}}

    createMenu(menuEntries, 1)

end

function defineBattlefieldMenuBlue()
    blueDeckMount.call("defineBattlefield")
end

function enterTintData(obj, dataString, tintTable)
    local tintString =  "{r = "..tintTable.r..", g = "..tintTable.g..", b = "..tintTable.b.."}"
    enterData(obj, dataString, tintString)
    obj.setTable(dataString, tintTable)
end

function enterData(obj, dataString, newValue)
    dataScript = obj.getLuaScript()
    dataString = dataString .. " = "
    local stringStart = 0
    local valueStart = 0
    stringStart, valueStart = string.find(dataScript, dataString)
    valueStart = valueStart

    local valueEnd = 0
    local valueNil = 0
    valueEnd, valueNil = string.find(dataScript, "\n", valueStart)
    valueEnd = valueEnd

    local newDataScript = string.sub(dataScript, 1, valueStart).. newValue .. string.sub(dataScript, valueEnd)

    obj.setLuaScript(newDataScript)
end

function reset()
    clearSetUpCards("all")
    mainMenu()
end

function debug()
    local battlefieldObjs = battlefieldZone.getObjects()
    local redObjs = redZone.getObjects()
    local blueObjs = blueZone.getObjects()
    removeLockedRulers()
    reloadObj(battlefieldObjs)
    reloadObj(redObjs)
    reloadObj(blueObjs)
end

function reloadObj(selectedObjs)
    for _, obj in pairs(selectedObjs) do
        if obj.getName() == "Movement Template" then
            destroyObject(obj)
        else
            obj.reload()
        end

    end
end

function removeLockedRulers()
    local allObjs = getAllObjects()
    for _, obj in pairs(allObjs) do
        if obj.getName() == "Cohesion Ruler" or obj.getName() == "Range Ruler" then
            destroyObject(obj)
        end
    end
end

function standbyTokens()
    local allObjs = getAllObjects()
    for i, obj in pairs(allObjs) do
        if obj.getVar("isAToken") == true then
            obj.call("standby")
        end
    end
end

function clearPlayerZones()
    local redZoneObjs = redZone.getObjects()
    local blueZoneObjs = blueZone.getObjects()

    for i, obj in pairs(redZoneObjs) do
        if obj ~= battlefieldTable then
            destroyObject(obj)
        end
    end
    for i, obj in pairs(blueZoneObjs) do
        if obj ~= battlefieldTable then
            destroyObject(obj)
        end
    end
end

function defineBattlefieldMenu(params)
    local selectedDeck = params.deck
    local selectedScenario = params.scenario
    if #selectedDeck.getObjects() < 12 then
      broadcastToAll("At least 12 cards are required to use battlefield vetoes. Move your choices manually to the right places!")
      return
    end
    _G.selectedScenario = selectedScenario
    print(selectedScenario)
    ga_view("game_controller/define_battlefield")
    clearAllButtons()
    changeBackButton("reset", "Go back to Main Menu")
    local menuEntries = {}
    menuEntries[1] = {functionName = "finishDefineBattlefieldMenu", label = "NEXT", tooltip = "NEXT", buttonTint = {0,0.913,1}}
    createMenu(menuEntries, 1)
    revealBattleCards(selectedDeck, selectedScenario)
    printToScreen("DEFINE BATTLEFIELD\nStarting with Blue player, players eliminate left most card.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 60, 2)
end

function finishDefineBattlefieldMenu()
    defineBattlefield()
    spawnObjectiveConditionsDelay()
    mainMenu()
end

function gameOptionsMenu()
    ga_view("game_controller/game_options")
    clearAllButtons()
    changeBackButton("mainMenu", "Go back to Main Menu")
    local menuEntries = {}
    menuEntries[1] = {
      functionName = "flipMap",
      label = "Flip Map",
      tooltip = "Flip the map to the other side",
      buttonTint = {0,0.913,1}
    }
    menuEntries[2] = {
      functionName = "defineBattlefieldMenuBlue",
      label = "Blue Player: Define Battlefield",
      tooltip = "Spawn Battlefield Objective, Deployment and Condition cards from Blue Deck",
      buttonTint = {0,0.913,1}
    }
    menuEntries[3] = {
      functionName = "debug",
      label = "Debug Objects",
      tooltip = "Corrects terrain that is spawned incorrectly or removes stuck rulers or movement templates",
      buttonTint = {0,0.913,1}
    }
    menuEntries[4] = {
      functionName = "spawnCardDecks",
      label = "Spawn Card Decks",
      tooltip = "Spawn Unit/Upgrade/Command cards for manual use",
      buttonTint = {0,0.913,1}
    }
    menuEntries[5] = {
      functionName = "enableExperimentalFeatures",
      label = "Enable Experiments",
      tooltip = "Enables experimental unsupported features",
      buttonTint = {0,0.913,1}
    }
    createMenu(menuEntries, 1)
end

function mapMenu()
    ga_view("game_controller/map_menu")
    printToScreen("MAP MENU", 80, 3)

    clearAllButtons()
    changeBackButton("mainMenu", "Go back to Main Menu")

    callBackMapMenu = "mapMenu"

    local menuEntries = {}
    menuEntries[1] = {functionName = "featuredMapsMenu", label = "Featured Maps", tooltip = "List and download pre-made maps", buttonTint = {0,0.913,1}}
    menuEntries[2] = {functionName = "loadMap", label = "Load Map", tooltip = "Load Map from Data Cartridge", buttonTint = {0,0.913,1}}
    menuEntries[3] = {functionName = "saveMap", label = "Save Map", tooltip = "Save Map to a Data Cartridge", buttonTint = {0,0.913,1}}
    menuEntries[4] = {functionName = "flipMap", label = "Flip Map", tooltip = "Flip the map to the other side", buttonTint = {0,0.913,1}}
    menuEntries[5] = {functionName = "customMapMenu", label = "Custom Maps", tooltip = "Create a Custom Map", buttonTint = {0,0.913,1}}
    menuEntries[6] = {functionName = "clearZones", label = "Clear Map", tooltip = "Clears everything from current Battlefield area", buttonTint = {0,0.913,1}}
    menuEntries[7] = {functionName = "saveConditions", label = "Save Battlefield Tokens", tooltip = "Saves Objects from the Objective/Deployment/Conditions", buttonTint = {0,0.913,1}}
    menuEntries[8] = {functionName = "toggleMaskMid", label = "Toggle Masks : Mid", tooltip = "Toggles Masking Objects for the middle of the Battlefield", buttonTint = {0,0.913,1}}
    menuEntries[9] = {functionName = "togglePoiGuide", label = "Toggle Poi Guide", tooltip = "Toggles Poi Layout Projector to help with Map Creation", buttonTint = {0,0.913,1}}
    createMenu(menuEntries, 1)
end

function featuredMapsMenu()
  ga_view("game_controller/featured_maps")
  printToScreen("FEATURED MAPS\n\nThese are maps featured by the community.\n\nSee https://go.swlegion.dev/maps for details.", 80, 3)
  changeBackButton("mapMenu", "Go back to Maps Menu")
  local buttonTint = {0,0.913,1}
  local menuEntries = {
    {
      label = "Competitive",
      tooltip = "View Competitive Maps",
      functionName = "featuredCompetitiveMenu",
      buttonTint = buttonTint,
    },
    {
      label = "Skirmish",
      tooltip = "View Skirmish (3x3) Maps",
      functionName = "featuredSkirmisMenu",
      buttonTint = buttonTint,
    }
  }
  createMenu(menuEntries, 1)
end

function featuredCompetitiveMenu()
  ga_view("game_controller/featured_maps/competitive")
  printToScreen("FEATURED MAPS\n\nThese are maps featured by the community.\n\nSee https://go.swlegion.dev/maps for details.", 80, 3)
  changeBackButton("featuredMapsMenu", "Go back to featured maps")
  local url = "https://raw.githubusercontent.com/swlegion/tts/master/contrib/maps/competitive.json"
  WebRequest.get(url, function(data)
    local items = JSON.decode(data.text)
    local menu = {}
    for _, entry in pairs(items) do
      table.insert(menu, {
        label = entry['name'],
        tooltip = 'Download map',
        url = entry['url'],
        buttonTint = {0,0.913,1}
      })
    end
    createMenu(menu, 1)
  end)
end

function featuredSkirmisMenu()
  ga_view("game_controller/featured_maps/skirmish")
  printToScreen("FEATURED MAPS\n\nThese are maps featured by the community.\n\nSee https://go.swlegion.dev/maps for details.\n\nFull support for Skirmish is currently limited:\nhttps://go.swlegion.dev/skirmish.", 80, 3)
  changeBackButton("featuredMapsMenu", "Go back to featured maps")
  local url = "https://raw.githubusercontent.com/swlegion/tts/master/contrib/maps/skirmish.json"
  WebRequest.get(url, function(data)
    local items = JSON.decode(data.text)
    local menu = {}
    for _, entry in pairs(items) do
      table.insert(menu, {
        label = entry['name'],
        tooltip = 'Download map',
        url = entry['url'],
        buttonTint = {0,0.913,1}
      })
    end
    createMenu(menu, 1)
  end)
end

function createMapMenu(selectedCartridge, mapMenuCallback)
  local selectedMapsTable = selectedCartridge.getObjects()
  local menuEntries = {}
  for iM, entry in pairs(selectedMapsTable) do
      _G["spawnCustomMap"..entry.name] = function() spawnCustomMap(entry.name, selectedCartridge, mapMenuCallback) end
      table.insert(menuEntries, {functionName = "spawnCustomMap"..entry.name, label = entry.name, tooltip = "Load ".. entry.name .." map", buttonTint = {0,0.913,1}})
  end
  createMenu(menuEntries, 1)
end

function customMapMenu()
  ga_view("game_controller/custom_maps")
  clearAllButtons()
  changeBackButton("mapMenu", "Go back to Maps Menu")
  createMapMenu(customMapsCartridge, "mapMenu")
end

-- SETUP Menu

function spawnCardDecks()
  ga_event("Game", "spawnCardDecks")
  local factions = Deck:getFactions()
  for _, faction in ipairs(factions) do
    Deck:spawnUnitDeck(faction, {52.43, 1.42, 32.53})
  end
  Deck:spawnUpgradeDeck({52.43, 1.84, 29.23})
  Deck:spawnCommandDeck({52.51, 1.42, 26.35})
  Deck:spawnBattleDeck({52.43, 1.42, 23})
end

function setBattleCardPos()
    for i, battleDeckType in pairs(battleDeckTypes) do
        for n=1, 4, 1 do
            local setUpCardPos = gameController.setUpCardsPos[battleDeckType][n]
            local spawnPos = {}
            
            spawnPos.x = screen.getPosition().x - setUpCardPos[1]
            spawnPos.y = screen.getPosition().y - setUpCardPos[2]
            spawnPos.z = screen.getPosition().z - setUpCardPos[3]

            local spawnRot = {55.91, 270.00, 0.00}
            local spawnedCardObj = setUp5Data.spawnedCards[battleDeckType][n]

            spawnedCardObj.setLock(true)
            spawnedCardObj.setScale({0.5,1,0.5})
            spawnedCardObj.setRotation(spawnRot)
            spawnedCardObj.setPosition(spawnPos)

            Wait.frames(function()
              debugSpawnSetupCard(spawnedCardObj)
            end)
        end
    end
end

function createMatrixFromDeck(battleDeckInserted, battleDeckScenario)
  -- CLONE DECK
  local battleDeckClone = battleDeckInserted.clone({
      position     = {0,-10,0},
      rotation     = {55.91, 270.00, 0.00},
      scale        = {0.5, 1, 0.5},
  })
  battleDeckClone.shuffle()
  local battleDeckTable = battleDeckClone.getObjects()

  -- for each card
  
  local cardMatrixSelected = {
    deployment = {},
    objective  = {},
    conditions = {},
  }

  for i, card in ipairs(battleDeckClone.getObjects()) do
    local object = battleDeckClone.takeObject({
      position     = {i*1, -10, 0},
    })
    local name = object.getName()
    local type = Deck:getBattleCardType(name, battleDeckScenario)
    -- TODO: Rename conditions -> condition
    if type == "condition" then
      type = "conditions"
    end
    table.insert(cardMatrixSelected[type], object)
  end

  if battleDeckClone then
    destroyObject(battleDeckClone)
  end

  return cardMatrixSelected.objective, 
         cardMatrixSelected.deployment,
         cardMatrixSelected.conditions
end

function revealBattleCards(insertedDeck, battleDeckScenario)
    clearSetUpCards("all")
    setUp5Data = {
      objectiveCards  = objectiveCards,
      deploymentCards = deploymentCards,
      conditionsCards = conditionsCards,
      spawnedCards    = {},
    }
    if insertedDeck == nil then
        setUp5Data.spawnedCards.objective = spawnSetupCards("objective")
        setUp5Data.spawnedCards.deployment = spawnSetupCards("deployment")
        setUp5Data.spawnedCards.conditions = spawnSetupCards("conditions")
    else
        objectiveCardMatrix, deploymentCardMatrix, conditionsCardMatrix = createMatrixFromDeck(insertedDeck, battleDeckScenario)
        setUp5Data.spawnedCards.objective = objectiveCardMatrix
        setUp5Data.spawnedCards.deployment = deploymentCardMatrix
        setUp5Data.spawnedCards.conditions = conditionsCardMatrix
        setBattleCardPos()
    end
    setUp5Data.cardSelection = {objective = 1, deployment = 1, conditions = 1}

    createButtonSetUpCard("objective", 1)
    createButtonSetUpCard("deployment", 1)
    createButtonSetUpCard("conditions", 1)
    Wait.frames(debugSetupCards)
end

function debugSetupCards()
    for i = 1, 4, 1 do
        if setUp5Data.spawnedCards.objective[i] then
            setUp5Data.spawnedCards.objective[i].setRotation({55.91, 270.00, 0.00})
        end

        if setUp5Data.spawnedCards.deployment[i] then
            setUp5Data.spawnedCards.deployment[i].setRotation({55.91, 270.00, 0.00})
        end
        if setUp5Data.spawnedCards.conditions[i] then
            setUp5Data.spawnedCards.conditions[i].setRotation({55.91, 270.00, 0.00})
        end
    end
end

function clearSetUpCards(clearedCards)
    if setUp5Data then
        for i = 1, 4, 1 do
            if setUp5Data.cardSelection.objective == i and clearedCards == "eliminate" then
            else
                if setUp5Data.spawnedCards.objective[i] then
                    destroyObject(setUp5Data.spawnedCards.objective[i])
                end
            end

            if setUp5Data.cardSelection.deployment == i and clearedCards == "eliminate" then
            else
                if setUp5Data.spawnedCards.deployment[i] then
                    destroyObject(setUp5Data.spawnedCards.deployment[i])
                end
            end

            if setUp5Data.cardSelection.conditions == i and clearedCards == "eliminate" then
            else
                if setUp5Data.spawnedCards.conditions[i] then
                    destroyObject(setUp5Data.spawnedCards.conditions[i])
                end
            end
        end
    end

    if clearedCards == "all" then
        setUp5Data = nil
    end

end

function defineBattlefield()
    clearSetUpCards("eliminate")
    insertSetUpCard("objective")
    insertSetUpCard("deployment")
    insertSetUpCard("conditions")
end

function insertSetUpCard(cardType)
    local mount = setUpData[cardType.."Mount"]
    local finalPos = {mount.getPosition().x, mount.getPosition().y+0.23, mount.getPosition().z}
    local finalCard = setUp5Data.spawnedCards[cardType][setUp5Data.cardSelection[cardType]]
    finalCard.setScale({0.83,1,0.83})
    finalCard.setLock(false)
    finalCard.setPosition(finalPos)
    finalCard.setRotation(mount.getRotation())
    finalCard.clearButtons()
end

function spawnObjectiveConditionsDelay()
    Wait.frames(spawnObjectiveConditions)
end

function spawnObjectiveConditions()
    local scenario = _G.selectedScenario
    setUpController.call("changeScenario", {scenario})
    setUpController.call("checkCardCall", {"deployment"})
    setUpController.call("checkCardCall", {"objective"})
    setUpController.call("checkCardCall", {"conditions"})
end


function eliminateCard(eliminatedCategory, eliminateNumber)
    local eliminiatedCard = setUp5Data.spawnedCards[eliminatedCategory][eliminateNumber]
    local cardRot = eliminiatedCard.getRotation()
    cardRot.x = cardRot.x + 180
    eliminiatedCard.setRotation(cardRot)
    eliminiatedCard.clearButtons()

    if eliminateNumber ~= 3 then
        createButtonSetUpCard(eliminatedCategory, eliminateNumber+1)
    end

    setUp5Data.cardSelection[eliminatedCategory] = eliminateNumber+1
end

function createButtonSetUpCard(cardType, selectedNumber)
    _G["eliminate"..cardType..selectedNumber] = function() eliminateCard(cardType, selectedNumber) end

    local data = {click_function = "eliminate"..cardType..selectedNumber, function_owner = self, label = "ELIMINATE", position = {-1, 1, 0}, rotation = {0, -90, 0}, scale = {0.7, 0.5, 0.5}, width = 2000, height = 400, font_size = 300, color = {1, 0, 0, 0.8}, font_color = {0,0,0, 1.25}}

    setUp5Data.spawnedCards[cardType][selectedNumber].createButton(data)
end

function spawnSetupCards(selection)
        setUp5Data[selection.."CardsClone"] = setUp5Data[selection .."Cards"].clone({
            position     = {0,-10,0}
        })

        setUp5Data[selection.."CardsClone"].shuffle()

        local spawnedCardTable = {}

        for n=1, #gameController.setUpCardsPos[selection], 1 do
            local setUpCardPos = gameController.setUpCardsPos[selection][n]

            local spawnPos = {}
            spawnPos.x = screen.getPosition().x - setUpCardPos[1]
            spawnPos.y = screen.getPosition().y - setUpCardPos[2]
            spawnPos.z = screen.getPosition().z - setUpCardPos[3]

            local spawnRot = {55.91, 270.00, 0.00}

            spawnedCard = setUp5Data[selection.."CardsClone"].takeObject({
                position       = spawnPos,
                rotation       = spawnRot,
                smooth         = false,
                top            = true
            })

            spawnedCard.setLock(true)
            spawnedCard.setRotation(spawnRot)

            spawnedCardTable[n] = spawnedCard

            Wait.frames(function()
              debugSpawnSetupCard(spawnedCard)
            end)
        end

        destroyObject(setUp5Data[selection.."CardsClone"])

        return spawnedCardTable
end

function debugSpawnSetupCard(spawnedSetupCard)
    spawnedSetupCard.setRotation({55.91, 270.00, 0.00})
end

function flipObjPos(pObj)
    local objPos = pObj.getPosition()
    local newPos = objPos
    local objRot = pObj.getRotation()
    objRot.y = objRot.y+180
    newPos.x = 8-(objPos.x - 8)
    newPos.z = -objPos.z

    pObj.setPosition(newPos)
    pObj.setRotation(objRot)
end

function flipMap()
    ga_event("Game", "flipMap")
    --Get a list of any objects which are inside of the zone.
    local allObjs = battlefieldZone.getObjects()

    --Check if the table we made is empty due to the zone being empty
    if #allObjs == 0 then
    else
        for _, obj in ipairs(allObjs) do
            -- flip obj
            if obj ~= battlefieldTable then
                flipObjPos(obj)
            end
        end
    end
end

function spawnCustomMap(selectedMap, selectedCartridgeObj, mapMenuCallback, clearZone)
    ga_event("Creative", "spawnCustomMap", selectedMap)
    if mapMenuCallback ~= nil then
        self.call(mapMenuCallback)
    end

    if clearZone ~= false then
        clearZones()
    end

    -- clone cartridge
    local selectedCartridgeObjClone = selectedCartridgeObj.clone({
        position     = {0,-10,0}
    })


    -- get guid
    local selectedCartridgeTable = selectedCartridgeObj.getObjects()

    for i, entry in pairs(selectedCartridgeTable) do
        if entry.name == selectedMap then
            selectedGUID = entry.guid
            break
        end
    end

    selectedCartridgeObjClone.takeObject({
        position       = {0,-10,3},
        callback       = "spawnFromCartridgeDelay",
        callback_owner = self,
        smooth         = false,
        guid           = selectedGUID
    })

    -- delete clone
    destroyObject(selectedCartridgeObjClone)
end

function spawnFromCartridgeDelay(spawnFromCartridgeObj)
    spawnFromCartridgeObj.setLock(true)
    Wait.frames(function()
      spawnMapFromCartridge(spawnFromCartridgeObj)
      destroyObject(spawnFromCartridgeObj)
    end)
end


function spawnMapFromCartridge(selectedCartridge)
    ga_event("Game", "spawnMapFromCartridge", selectedCartridge.getName())
    clearZones()
    changeBattlefieldTint(selectedCartridge.getTable("battlefieldTint"))
    for i = 1, #selectedCartridge.getObjects(), 1 do
      selectedCartridge.takeObject({
        position          = {0,-10-i,0},
        smooth            = false,
        callback_function = function(spawnedObject)
          Wait.frames(function()
            placeTerrain(spawnedObject)
          end)
        end,
    })
    end
end

function clearZones()
    clearMap()
end

function clearMap()

    --Get a list of any objects which are inside of the zone.
    local objectsInZone = battlefieldZone.getObjects()

    --Check if the table we made is empty due to the zone being empty
    if #objectsInZone == 0 then
    else
        --If it isn't empty, we use a for loop to look at each entry in the list
        for _, object in ipairs(objectsInZone) do
            -- destroy object
            if object ~= battlefieldTable then
                destroyObject(object)
            end
        end
    end
end

function prepareToSave()
    -- delete cartridgeObjs
    local mountObjs = mountZone.getObjects()

    for i, obj in pairs(mountObjs) do
        if obj ~= dataDiskMount then
            destroyObject(obj)
        end
    end

    -- create data cartridge
    local spawnPos = dataDiskMount.getPosition()
    -- offset to "snap" the cartridge neatly
    spawnPos.x = spawnPos.x + 0.05
    spawnPos.y = spawnPos.y - 0.41
    spawnPos.z = spawnPos.z + 0.02
    local dataCartridgeOriginal = getObjectFromGUID(gameController.dataCartridgeGUID)

    dataCartridge = dataCartridgeOriginal.clone({
        position     = spawnPos
    })

    dataCartridge.setLock(false)
    dataCartridge.setScale({1,1,1})

    battlefieldTint = gameData.getTable("battlefieldTint")

    local cartridgeScript = "battlefieldTint = {r = " .. battlefieldTint.r .. ", g = " .. battlefieldTint.g .. ", b = " .. battlefieldTint.b .. "}"
    dataCartridge.setLuaScript(cartridgeScript)
end

function saveConditions()
    prepareToSave()

    local zoneBox = getObjectFromGUID(zonesGUIDs.conditions)
    local zoneObjs = zoneBox.getObjects()
    logObj(zoneObjs)
end

function saveMap()
    prepareToSave()

    local zoneBox = getObjectFromGUID(zonesGUIDs.battlefield)
    local zoneObjs = zoneBox.getObjects()
    ga_event("Creative", "saveMap", #zoneObjs)
    logObj(zoneObjs)
end

function logObj(selectedObjs)
    for _, obj in pairs(selectedObjs) do
        if obj.getName() ~= "TABLE" then
            local objLuaScript = getLuaScriptData(obj)

            if string.len(obj.getLuaScript()) > 5 then
                objLuaScript = objLuaScript .. "\nscripted = true"
            else
                objLuaScript = objLuaScript
            end
            obj.setLuaScript(objLuaScript.."\n"..obj.getLuaScript())

            dataCartridge.putObject(obj)
        end
    end
end

function getLuaScriptData(targetObj)
    local returnString = ""

    local returnPos = targetObj.getPosition()
    returnString = returnString .. "position = {x = " .. returnPos.x .. ", y = " .. returnPos.y .. ", z = " .. returnPos.z .. "}\n"

    local returnRot = targetObj.getRotation()
    returnString = returnString .. "rotation = {x = " .. returnRot.x .. ", y = " .. returnRot.y .. ", z = " .. returnRot.z .. "}\n"

    return returnString
end

function loadMap()
    -- get cartridge
    local mountObjs = mountZone.getObjects()

    for i, obj in pairs(mountObjs) do
        if obj.getTable("battlefieldTint") ~= nil then
            loadedCartridge = obj
        end
    end

    -- spawn cartridge
    if loadedCartridge ~= nil then
        clearZones()
        spawnMapFromCartridge(loadedCartridge)
    else
    end
end

function placeTerrain(paObj)
    local spawnPos = paObj.getTable("position")
    paObj.setPosition(spawnPos)

    local spawnRot = paObj.getTable("rotation")
    paObj.setRotation(spawnRot)

    if paObj.getVar("scripted") == true then
    else
        paObj.setLuaScript("")
    end


    if paObj.getName() == "BATTLEFIELD" then
        paObj.interactable = false
        paObj.setLock(true)
        paObj.setLuaScript("function onload() self.interactable = false end")
    end
end

-- UTILITY FUNCTIONS

function dud()
end

function clearAllButtons(exception)
    for _, optionObjEntry in pairs(optionObjs) do
        optionObjEntry.clearButtons()
    end

    for _, optionButtonEntry in pairs(optionButtons) do
        optionButtonEntry.clearButtons()
        optionButtonEntry.setColorTint({0,0,0})
    end

    if exception ~= backButton then
        backButton.clearButtons()
        backButton.setColorTint({0,0,0})
    end

    prevButton.clearButtons()
    prevButton.setColorTint({0,0,0})
    nextButton.clearButtons()
    nextButton.setColorTint({0,0,0})
end

function printToScreen(screenText, fontSize, selectedAlignment)
    screen.editButton({
        int = 0, click_function = "dud", function_owner = self, label = screenText, position = {0.9, 0.25, 0}, rotation = {0, -90, 90}, scale = {0.5, 0.5, 0.5}, width = 0, height = 0, font_size = fontSize, font_color = {0.8867, 0.7804, 0, 1}, alignment = selectedAlignment
    })
end


function createOptionButton(optionNumber, optionClickFunction, optionLabel, optionToolTip,tint)
    optionObj = optionObjs["gameControllerOption"..optionNumber]
    optionButton = optionButtons["gameControllerOption"..optionNumber.."Button"]

    _G["gameControllerOptionFunction"..optionNumber] = function()
        optionButtons["gameControllerOption"..optionNumber.."Button"].AssetBundle.playTriggerEffect(0)
        _G[optionClickFunction](optionNumber)
    end
    local stringLength = string.len(optionLabel)

    if stringLength < 24 then
        buttonFontSize = 400
    else
        local stringDif = stringLength - 22
        buttonFontSize = 400 - (stringDif * 8)
    end

    optionObj.createButton({
        click_function = "gameControllerOptionFunction"..optionNumber, function_owner = self, label = optionLabel, position = {-0.35, 0.3, 0}, scale = {0.5, 0.5, 0.5}, width = 4200, height = 600, font_size = buttonFontSize, color = {0.7573, 0.7573, 0.7573, 0.01}, font_color = {0, 0, 0, 100},tooltip = optionToolTip
    })

    optionButton.createButton({
        click_function = "gameControllerOptionFunction"..optionNumber, function_owner = self, label = "", position = {0, 0.65, 0}, width = 1400, height = 1400, font_size = 1100, color = {1,1,1,0.01},font_color = {1,1,1,100}, tooltip = optionToolTip, alignment = 3
    })

    optionButton.setColorTint(tint)
end

function changeBackButton(optionClickFunction, optionToolTip)
    _G["gameControllerBackButtonFunction"] = function()
        backButton.AssetBundle.playTriggerEffect(0)
        _G[optionClickFunction]()
    end

    backButton.createButton({
        click_function = "gameControllerBackButtonFunction", function_owner = self, label = "BACK", position = {0, 0.65, 0}, scale = {1, 1, 1.4}, width = 1500, height = 2000, font_size = 400, color = {0.7573, 0.7573, 0.7573, 0.01}, font_color = {0, 0, 0, 100}, tooltip = optionToolTip
    })
    backButton.setColorTint({1,0,0})
end

function changeNextButton(optionClickFunction, optionToolTip)
    _G["gameControllerNextButtonFunction"] = function()
        nextButton.AssetBundle.playTriggerEffect(0)
        _G[optionClickFunction]()
    end

    nextButton.createButton({
        click_function = "gameControllerNextButtonFunction", function_owner = self, label = "NEXT", position = {0, 0.65, 0}, scale = {1, 1, 0.7}, width = 1500, height = 2000, font_size = 400, color = {0.7573, 0.7573, 0.7573, 0.01}, font_color = {0, 0, 0, 100}, tooltip = optionToolTip
    })
    nextButton.setColorTint({0.7,0.7,0})
end

function changePrevButton(optionClickFunction, optionToolTip)
    _G["gameControllerPrevButtonFunction"] = function()
        prevButton.AssetBundle.playTriggerEffect(0)
        _G[optionClickFunction]()
    end

    prevButton.createButton({
        click_function = "gameControllerPrevButtonFunction", function_owner = self, label = "PREV", position = {0, 0.65, 0}, scale = {1, 1, 0.7}, width = 1500, height = 2000, font_size = 400, color = {0.7573, 0.7573, 0.7573, 0.01}, font_color = {0, 0, 0, 100}, tooltip = optionToolTip
    })
    prevButton.setColorTint({0.7,0.7,0})
end

optionUrls = {}

function downloadMap(mapIndex)
  local url = optionUrls[mapIndex]
  printToScreen("DOWNLOADING MAP...")
  downloadMapByUrl(url)
end

function downloadMapByUrl(url)
  WebRequest.get(url, function(data)
    -- TTS deletes the download handler after Wait.time, so copy the text.
    local text = data.text
    printToScreen("UNPACKING MAP...\n\nThis may take several seconds...")
    Wait.frames(function()
      local json = JSON.decode(text)
      if not json.ObjectStates then
        printToAll("Failed to decode map.")
        return
      end
      spawnObjectJSON({
        json = JSON.encode(json.ObjectStates[1]),
        position = dataDiskMount.getPosition(),
        callback_function = function(disk)
          spawnMapFromCartridge(disk)
          disk.destroyObject()
          mainMenu()
        end
      })
    end)
  end)
end

function createMenu(optionTable, selectedIndex)
    clearAllButtons(backButton)

    if #optionTable > 5 then
        -- create prev and next buttons
        if selectedIndex-5 > 0 then
            _G["prevButtonFunction"] = function() createMenu(optionTable, selectedIndex-5) end
            changePrevButton("prevButtonFunction", "Previous Menu options")
        end
        if selectedIndex+4 < #optionTable then
            _G["nextButtonFunction"] = function() createMenu(optionTable,selectedIndex+5) end
            changeNextButton("nextButtonFunction", "More menu options")
        end
    end

    for oI=0,4,1 do
        if optionTable[selectedIndex+oI] ~= nil then
            local entry = optionTable[selectedIndex+oI]
            if entry.url ~= nil then
              optionUrls[selectedIndex+oI] = entry.url
              createOptionButton(oI+1, "downloadMap", entry.label,entry.tooltip, entry.buttonTint)
            else
              createOptionButton(oI+1, entry.functionName, entry.label,entry.tooltip, entry.buttonTint)
            end
        end
    end
end



function changeBattlefieldTint(tint)
    enterTintData(gameData, "battlefieldTint", tint)

    local allUnits = getAllObjects()
    for _,unit in pairs(allUnits) do
        if unit.getCustomObject().type == 1 then
            unit.setColorTint(tint)
            --unit.setTable("battlefieldTint", tint)
        end
    end
end

function onPlayerChangedColor(player_color)
    if player_color == "Red" or player_color == "Blue" then
        if Player[player_color].host == false and Player[player_color].promoted == false then
            Player[player_color].promote()
        end
    end
end

function enableExperimentalFeatures()
    ga_event("Global", "enableExperimentalFeatures")
    Global.UI.show("legionDisplay")
end

function getExistingMaskLength()
    local length = 0
    if existingMasks != nil then
        for i, obj in pairs(existingMasks) do
            length = length + 1
        end
    end
    return length
end

function toggleMaskMid()   
    local length = getExistingMaskLength() 
    if length > 0 then
        clearMasks()
    else
        placeMask(35,9)
        placeMask(-19,9)
        placeMask(35,-9)
        placeMask(-19,-9)
    end
end

function toggleMaskRight()
    local length = getExistingMaskLength() 
    if length > 0 then
        clearMasks()
    else
        placeMask(35,9)
        placeMask(17,9)
        placeMask(35,-9)
        placeMask(17,-9)
    end
end

function toggleMaskLeft()
    local length = getExistingMaskLength() 
    if length > 0 then
        clearMasks()
    else
        placeMask(-1,9)
        placeMask(-19,9)
        placeMask(-1,-9)
        placeMask(-19,-9)
    end
end

function clearMasks()
    if existingMasks != nil then
        for i, obj in pairs(existingMasks) do
            if obj != nil then
                destroyObject(obj)
            end
        end
        existingMasks = {}
    end
end

function placeMask(x, z)
    local projector = spawnObject({
        type        = "Custom_AssetBundle",
        position    = {
          x,
          75,
          z,
        },
        scale       = {0, 0, 0},
      })
      local asset = "https://steamusercontent-a.akamaihd.net/ugc/2264809616949875099/DB2BBB502F11E04185A603B8A4FD0F2391B905C6/"
      projector.setName("Masking Boundary")
      projector.setLock(true)
      projector.setCustomObject({
        assetbundle = asset,
      })  
    table.insert(existingMasks, projector)
end

function togglePoiGuide()   
    local length = getExistingMaskLength() 
    if existingPoiGuide ~= nil then
        destroyObject(existingPoiGuide)
        existingPoiGuide = nil
    else
        local projector = spawnObject({
            type = "Custom_AssetBundle",
            position = { 8, 30, 0 },
            scale = {0,0,0}
        })
        local asset = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649901469/35992792768FE398E61633C99C02D069A54F65B1/"
        projector.setName("Poi Guide")
        projector.setLock(true)
        projector.setCustomObject({
            assetbundle = asset
        })
        existingPoiGuide = projector
    end
end