----#include !/data/ListBuilderNew
----#include !/common/Math
function translatePos(originPos, originRot, distance, angle)
  local pos = originPos
  local rot = originRot

  local a = distance * math.cos(math.rad(angle + rot.y))
  local b = distance * math.sin(math.rad(angle + rot.y))

  pos.x = pos.x - b
  pos.z = pos.z - a

  return pos
end

function simpleTranslatePos(originPos, xOffset, zOffset)
    local pos = {originPos.x + xOffset, originPos.y, originPos.z + zOffset}
    return pos
end
----#include !/common/Math
----#include !/common/Stringx
local stringx = {
  titleCase = function(string)
    return string:gsub("(%a)([%w_']*)", function(first, rest)
      return first:upper()..rest:lower()
    end)
  end,
}

----#include !/common/Stringx
----#include !/common/Zonex
local zonex = {
  clear = function(zone)
    for _, o in ipairs(zone.getObjects()) do
      destroyObject(o)
    end
  end,

  clearExcept = function(zone, tag)
    for _, o in ipairs(zone.getObjects()) do
      if not o.hasTag(tag) then
        destroyObject(o)
      end
    end
  end,

  firstWhereNot = function(zone, tag)
    for _, o in ipairs(zone.getObjects()) do
      if not o.hasTag(tag) then
        return o
      end
    end
    return nil
  end,
}

----#include !/common/Zonex
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
----#include !/Shelf
-- Utilities around creating and managing minis.
Shelf = {}
Shelf.__index = Shelf;
function Shelf:create()
  local meta = {
    -- TODO: Have the schema be configurable.
    _colliders = {
      small    = { "https://steamusercontent-a.akamaihd.net/ugc/1009315641457429932/1534D6C1AA4F3D5BDA469241B8F0319BE560E7ED/", 1.06299},
      medium   = { "https://steamusercontent-a.akamaihd.net/ugc/1009315641457670521/DAD6653F422046BD6BC4360FE18C96927D5F4C44/", 1.9685},
      large    = { "https://steamusercontent-a.akamaihd.net/ugc/1009315641457670155/6727179496A9F397E953AAA3268C6CC6444598DF/", 2.75591},
      huge     = { "https://steamusercontent-a.akamaihd.net/ugc/1009315641457669798/3B337900892D839BDBC3EBF2A5CC9EC87DDBFED1/", 3.93701},
      laat     = { "https://steamusercontent-a.akamaihd.net/ugc/1924743543116123549/A96493C7DF407D0E68F17FDF360AEEFA07BFAEB9/", 4.72440 },
      epic     = { "https://steamusercontent-a.akamaihd.net/ugc/1009315641457669292/A7F6F75580BF1DFAA23E621875A761FB8B9EF2BC/", 5.90551},
      long     = { "https://steamusercontent-a.akamaihd.net/ugc/963116666702885485/70F17B3327115A379D06F81C6F47F76470D7B826/", 6.88976},
      snail    = { "https://steamusercontent-a.akamaihd.net/ugc/1924743543116106403/74B762E5395F42575CE13125BC944ACDF823246B/", 7.87402}
    },
    _unknown   = {
      -- TODO: Add stand-ins.
    },
    _cache     = {
      -- objects  = {},
    }
  }
  setmetatable(meta, Shelf)
  return meta
end

function Shelf:_getSchema()
  return Global.getTable("CardsSchema")
end

function Shelf:spawnUnitModels(params)
  -- Standard parameters (required).
  local faction = params.faction
  local name = params.name
  local upgrades = params.upgrades

  -- Optional parameters.
  local callback = params.callback
  local additional = params.additional

  local additionalObjects = {}

  -- TODO: Remove remapping.
  local remap = {
    ["rebel"]      = "Rebel",
    ["imperial"]   = "Empire",
    ["separatist"] = "Separatist",
    ["republic"]   = "Republic",
  }
  if remap[faction] ~= nil then
    faction = remap[faction]
  end
  local units = self:_getSchema().units[faction:upper()]
  if units == nil then
    local model = self:_spawnDudModel(name, "No matching faction found: \"" .. faction .. "\".")
    if callback ~= nil then
      callback(model, 1, self._colliders.small[2])
    end
    return {model}
  end
  local card = units[name:upper()]
  if card == nil then
    local model = self:_spawnDudModel(name, "No matching unit found.\nFaction: \"" .. faction .. "\".")
    if callback ~= nil then
      callback(model, 1, self._colliders.small[2])
    end
    return {model}
  end
  local size = self._colliders[card.size][2]
  local minis = card.minis
  if type(minis) == "number" then
    print("Spawning placeholder minis is not yet implemented (" .. name .. ": " .. tostring(minis) .. ")")
    return {}
  end
  local result = {}
  for _, upgradeName in ipairs(upgrades) do
    local upgrade = self:_fetchUpgradeByName(upgradeName)
    -- TODO: Handle missing upgrade more gracefully.
    if upgrade ~= nil then
      if additional and upgrade.additionalObjects then
        for _, name in ipairs(upgrade.additionalObjects) do
          table.insert(additionalObjects, name)
        end
      end
      if upgrade.mini ~= nil and (upgrade.leader == true or card.heavyWeaponTeam == true) then
        local model = self:_spawnModel(card.size, upgrade.mini)
        model.setName(upgrade.name .. " (Unit Leader)")
        table.insert(result, model)
        if callback ~= nil then
          callback(model, #result, size)
        end
        break
      end     
    end
  end
  for _, config in pairs(minis) do
    local model = self:_spawnModel(card.size, config)
    table.insert(result, model)
    if #result == 1 then
      model.setName(name .. " (Unit Leader)")
    else
      model.setName(name)
    end
    if callback ~= nil then
      callback(model, #result, size)
    end
  end
  for _, upgradeName in ipairs(upgrades) do
    local upgrade = self:_fetchUpgradeByName(upgradeName)
    -- TODO: Handle missing upgrade more gracefully.
    if upgrade ~= nil then
      if upgrade.mini ~= nil and upgrade.leader ~= true and card.heavyWeaponTeam ~= true then
        local model = self:_spawnModel(card.size, upgrade.mini)
        model.setName(upgrade.name)
        table.insert(result, model)
        if callback ~= nil then
          callback(model, #result, size)
        end
      end
      if upgrade.minis ~= nil then
        for _, mini in ipairs(upgrade.minis) do
          local model = self:_spawnModel(card.size, mini)
          model.setName(upgrade.name)
          table.insert(result, model)
          if callback != nil then
            callback(model, #result, size)
          end
        end
      end
    end
  end
  if additional and additional.position then
    for _, name in ipairs(card.additionalObjects or {}) do
      table.insert(additionalObjects, name)
    end
    -- Spawn additional objects attached to unit or upgrade cards.
    if #additionalObjects > 0 or additional.callback then
      self:spawnAdditionalObjects({
        name     = card.name .. "'s Objects",
        position = additional.position,
        rotation = additional.rotation,
        callback = additional.callback,
        objects  = additionalObjects,
        -- TODO: Make this global somehow instead.
        scripts  = params.scripts,
      })
    end
  end
  return {
    rank   = card.rank,
    speed  = card.speed,
    size   = card.size,
    height = card.height or 2,
    models = result,
    tokens = card.tokens
  }
end

function Shelf:spawnAdditionalObjects(params)
  local name     = params.name or "Additional Objects"
  local position = params.position
  local rotation = params.rotation
  local objects  = params.objects or {}
  local callback = params.callback
  spawnObject({
    type              = "Bag",
    position          = position,
    rotation          = rotation,
    callback_function = function(spawnedBag)
      for _, object in ipairs(objects) do
        self:_spawnComplimentaryObject(object, spawnedBag, params.scripts or {})
      end
      if callback then
        callback(spawnedBag)
      end
      spawnedBag.setName(name)
    end
  })
end

function Shelf:_spawnComplimentaryObject(name, container, scripts)
  if not self._cache.objects then
    local cache = {}
    for name, details in pairs(self._getSchema().objects) do
      cache[name:upper()] = details
    end
    self._cache.objects = cache
  end
  local spawn = self._cache.objects[name:upper()]
  local object
  if spawn.token then
    object = self:_spawnModel(nil, spawn.token, { type = 5 })
    object.setName(spawn.token.name or name)
  elseif spawn.model then
    object = self:_spawnModel(nil, spawn.model)
    object.setName(name)
  elseif spawn.cards then
    for i = 1, spawn.multiples or 1 do
      for _, details in ipairs(spawn.cards) do
        local back = details.back or spawn.back
        local card = self:_spawnCard(details.image, back)
        card.setName(details.name)
        container.putObject(card)
      end
    end
  elseif spawn.card then
    local back = spawn.card.back
    local card = self:_spawnCard(spawn.card.image)
    card.setName(spawn.name)
    container.putObject(card)
  else
    print("Unsupported object definition: \"" .. name .. "\" (" .. container.getName() .. ")")
  end
  if object then
    if spawn.scripted then
      local luaScript = scripts[spawn.scripted]
      object.setLuaScript(luaScript)
      object = object.reload()
    end
    container.putObject(object)
  end
end

function Shelf:_spawnCard(front, back)
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

function Shelf:_fetchUpgradeByName(name)
  -- TODO: Remove remapping.
  local remap = {
    ["Battle Shield Wookiee"]        = "Battle Shield Wookiee (Offensive)",
    ["C-3PO Human-Cyborg Relations"] = "C-3PO",
    ["C-3PO Made to Suffer"]         = "C-3PO",
  }
  if remap[name] ~= nil then
    name = remap[name]
  end
  return self:_getSchema().upgrades[name:upper()]
end

function Shelf:_spawnDudModel(name, description)
  local model = self:_spawnModel("small", {
    bundle = "https://steamusercontent-a.akamaihd.net/ugc/1616219505081638790/1BF43B61B14CFD7C588AF6C59972B092674D6C8F/",
  })
  model.setName(name)
  model.setDescription(description)
  return model
end

function Shelf:_spawnModel(size, miniConfig, objectOverrides)
  local mini
  local type = objectOverrides and objectOverrides.type or 1
  if miniConfig.mesh == nil then
    mini = spawnObject({
      type = "Custom_AssetBundle"
    })
    mini.setCustomObject({
      assetbundle = miniConfig.bundle,
      assetbundle_secondary = miniConfig.secondary,
      type = type,
      material = 3,
    })
  else
    local collider = miniConfig.collider
    if not collider and size then
      collider = self._colliders[size][1]
    end
    mini = spawnObject({
      type = "Custom_Model"
    })
    mini.setCustomObject({
      diffuse = miniConfig.diffuse,
      mesh = miniConfig.mesh,
      collider = collider,
      type = type,
      material = 3,
    })
  end
  return mini
end

----#include !/Shelf
----#include !/SpawnList
----#include !/common/Tablex
local tablex = {
  isArray = function(input)
    return #input > 0 and next(input, #input) == nil
  end,

  shallow = function(input)
    if input then
      if #input > 0 and next(input, #input) == nil then
        return {table.unpack(input)}
      else
        local copy = {}
        for k, v in pairs(input) do
          copy[k] = v
        end
        return copy
      end
    else
      return nil
    end
  end,

  forEach = function(input, callback)
    for k, v in pairs(input) do
      callback(v, k)
    end
  end,

  forEachObjectByGUID = function(input, callback)
    for k, v in pairs(input) do
      callback(getObjectFromGUID(v), k)
    end
  end,
}

----#include !/common/Tablex

local function initListSpawner(params)
  local deck = params.deck
  local shelf = params.shelf
  local globals = params.globals
  local color = params.color
  local mount = params.mount
  local orientation = params.orientation
  local unitTokens = params.unitTokens
  local scripts = params.scripts or {}

  local function dealCommandCard(name, contingency)
    local card = deck:spawnCommandCard(name, contingency)
    if contingency then
      card.highlightOn({0, 1, 1})
    end
    local hand = globals.handPos[color:lower()]
    card.setRotation(hand.rot)
    card.setPosition(hand.pos)
  end

  local function drawBattlefieldCard(height, name, type, scenario)
    local card = deck:spawnBattleCard(type, name, scenario)
    local position = mount.getPosition()
    position.y = position.y + 0.23 + (height * 0.1)
    card.setPosition(position)
    local rotation = mount.getRotation()
    rotation.z = 180
    card.setRotation(rotation)
  end

  local function buildBattlefieldDeck(
    scenario,
    objectives,
    deployments,
    conditions
  )
    local i = 0
    for _, card in ipairs(objectives) do
      drawBattlefieldCard(i, card, "objective", scenario)
      i = i + 1
    end
    for _, card in ipairs(deployments) do
      drawBattlefieldCard(i, card, "deployment", scenario)
      i = i + 1
    end
    for _, card in ipairs(conditions) do
      drawBattlefieldCard(i, card, "condition", scenario)
      i = i + 1
    end
  end

  local function computeSpawnPositions(index)
    local templatePos = globals[color:lower() .. "TemplatePos"][index]
    local adjustedPos = tablex.shallow(templatePos)
    local templateHalfWidth = globals.spawnOffsets.templateHalfWidth
    local templateHalfHeight = globals.spawnOffsets.templateHalfHeight
    local cardHeight = globals.spawnOffsets.cardHeight
    local cardWidth = globals.spawnOffsets.unitCardWidth
    local padding = globals.spawnOffsets.padding
    local xOffset = 1
    local zOffset = 1

    if index > 10 then
      -- TODO: Support unit ID tokens > 10.
      index = index - 10
      adjustedPos.z = adjustedPos.z - (templateHalfHeight * 0.3)
    end

    if adjustedPos.z < 0 then
      xOffset = -1
      zOffset = -1
      padding = padding * -1
      cardHeight = cardHeight * -1
      templateHalfWidth = templateHalfWidth * -1
      templateHalfHeight = templateHalfHeight * -1
    end

    adjustedPos.x = adjustedPos.x + templateHalfWidth - padding
    adjustedPos.z = adjustedPos.z - templateHalfHeight + cardHeight

    return {
      adjustedPos = adjustedPos,
      xOffset     = xOffset,
      zOffset     = zOffset,
    }
  end

  local function computeUpgradePositions(index)
    local cardHeight = globals.spawnOffsets.cardHeight
    local cardWidth = globals.spawnOffsets.unitCardWidth
    local upgradeCardWidth = globals.spawnOffsets.upgradeCardWidth
    local padding = globals.spawnOffsets.padding

    local xOffset = 0
    if (index == 1 or index == 4 or index == 7) then
      xOffset = cardWidth - upgradeCardWidth / 2 + padding
    elseif (index == 2 or index == 5) then
      xOffset = -cardWidth / 2 + upgradeCardWidth / 2
    elseif (index == 3 or index == 6) then
      xOffset = upgradeCardWidth / 2 + padding / 2
    end

    local zOffset = 0
    if index > 1 then
      zOffset = cardHeight + padding
    end
    if index >= 5 then
      zOffset = zOffset * 2
    end

    return {
      xOffset     = xOffset,
      zOffset     = zOffset,
    }
  end

  local function initialZOffset(upgradeCount)
    local cardHeight = globals.spawnOffsets.cardHeight
    local padding = globals.spawnOffsets.padding
    local initialZOffset = cardHeight + padding
    if upgradeCount > 1 and upgradeCount < 5 then
      initialZOffset = initialZOffset + (cardHeight + padding)
    elseif upgradeCount > 4 then
      initialZOffset = initialZOffset + (cardHeight + padding) * 2
    end
    return initialZOffset
  end

  local function computeMiniPositions(
    adjustedPos,
    index,
    base,
    xOffset,
    zOffset,
    upgradeCount
  )
    local templateHalfWidth = globals.spawnOffsets.templateHalfWidth
    local unitCardWidth = globals.spawnOffsets.unitCardWidth
    local padding = globals.spawnOffsets.padding

    local baseRadius = base * 0.5
    local initialXOffset = unitCardWidth * 0.5 - baseRadius
    local position = {
      x = adjustedPos.x + initialXOffset * xOffset,
      y = adjustedPos.y,
      z = adjustedPos.z,
    }
    local paddedBase = (base + padding)
    local basesPerRow = math.max(1, math.abs(math.floor(templateHalfWidth * 2.0 / paddedBase)))
    local whole, part = math.modf(index/(basesPerRow + 1));
    local zIndex = whole
    local totalZOffset = initialZOffset(upgradeCount)
    if index > basesPerRow then
      local zFromCard = zOffset * zIndex
      if adjustedPos.z > 0 then
        zFromCard = -zOffset * zIndex
      end
      totalZOffset = totalZOffset - (paddedBase * zFromCard)     
    end
    local newIndex = (index - (basesPerRow * zIndex) - 1)
    local baseOffset = paddedBase * xOffset
    local totalXOffset = (baseOffset * newIndex)
    local xDir = xOffset * -1
    if adjustedPos.z < 0 then
      xDir = xDir * -1
    end

    return simpleTranslatePos(
      position,
      totalXOffset * xDir,
      totalZOffset * zOffset
    )
  end

  local function getGlobalTint()
    return getObjectFromGUID(Global.getVar("gameDataGUID")).getTable("battlefieldTint")
  end

  function initializeMini(pMiniTable)
    local strColor = pMiniTable.colorSide
    strColor = strColor:gsub("^%l", string.upper)

    -- detect leader units
    local leaderInt = pMiniTable.leaderIndex

    local leaderGUID = pMiniTable.miniObjs[leaderInt].obj.getGUID()

    for i, objEntry in pairs(pMiniTable.miniObjs) do
      -- init mini script
      local selectedMiniScript = ""

      -- SET NAME
      local displayName = pMiniTable.displayName or objEntry.name
      objEntry.obj.setName(strColor.. " "..displayName)
      selectedMiniScript = selectedMiniScript .. "colorSide = '"..pMiniTable.colorSide.."'\nminiName = \""..objEntry.name.."\"\n"

      -- SET LEADER GUID
      selectedMiniScript = selectedMiniScript .. "leaderGUID = \"" .. leaderGUID .. "\"\n"

      if i == leaderInt then
        -- DESCRIPTION
        local description = ""

        for p, upgradeName in pairs(pMiniTable.upgrades) do
          description = description .. upgradeName .. "\n"
        end
        objEntry.obj.setDescription(description)

        -- miniGUIDs

        local silhHeight = 0
        local silhOffset = 0

        -- TODO: Handle JSON Import because the miniTable isn't fully populated 
        local silhType = "custom"
        if pMiniTable.type then
          if string.find(pMiniTable.type, "Trooper") then
              silhType = "notched"
            if pMiniTable.baseSize == small then
              silhType = "small"
            end
          else
            silhHeight = pMiniTable.silhData[1]
            silhOffset = pMiniTable.silhData[2]
          end
        else
          silhHeight = pMiniTable.silhData[1]
          silhOffset = pMiniTable.silhData[2]
        end

        local miniGUIDsScript = "miniGUIDs = {}\n"
        for n, objEntry in pairs(pMiniTable.miniObjs) do
          miniGUIDsScript = miniGUIDsScript .. "miniGUIDs["..n.."] = '" .. objEntry.obj.getGUID() .. "'\n"
        end

        local miniName = ""
        if pMiniTable.name then
          if pMiniTable.name ~= nil then
            miniName = pMiniTable.name:lower()
          end
        end

        selectedMiniScript = selectedMiniScript .. miniGUIDsScript ..
          "cardGUID = \"" .. pMiniTable.unitCardGUID ..
          "\"\n unitName = \"".. miniName ..
          "\"\n silhType = \"".. silhType ..
          "\"\n silhHeight = \"".. silhHeight ..
          "\"\n silhOffset = \"".. silhOffset ..
          "\"\n commandName = \"".. pMiniTable.commandName ..
          "\"\n commandType = \"".. pMiniTable.commandType ..
          "\"\n selectedSpeed = ".. pMiniTable.selectedSpeed ..
          "\n baseSize = \"".. pMiniTable.baseSize ..
          "\"\n unitID = " .. pMiniTable.unitID ..
          "\n unitIDTokenGUID = \"".. pMiniTable.unitIDTokenGUID ..
          "\"\n" .. globals.modelMiniScript
      else
        objEntry.obj.use_snap_points = false
      end

      -- SET SCRIPT
      objEntry.obj.setLuaScript(selectedMiniScript)
    end
  end

  function initializeCommandToken(cData)
    local tokenObj = spawnObject({
      type           = "Custom_Model",
      rotation       = cData.rot,
      position       = cData.pos,
    })
    tokenObj.setCustomObject({
      mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314446513/4DBBAC00ABA5EABE88C2A86C3311C3FB6645FF25/",
      collider = "https://steamusercontent-a.akamaihd.net/ugc/785234780866339915/85F7E717B9EFBE0396126CA673DF17EAFEC7D451/",
      diffuse = Global.getTable("commandTokenData")[color:lower()][cData.commandType],
      type = 0,
      material = 3
    })
    tokenObj.setName(cData.name)
    -- Set the objects script.
    -- Note this is used instead of "setTable()" because onLoad/onSave is buggy with stuff that stacks.
    local luaScript = string.format(
      "_G.unitData = {" ..
      "  baseSize      = [[%s]],\n" ..
      "  colorSide     = [[%s]],\n" ..
      "  commandType   = [[%s]],\n" ..
      "  fixedArc      = %s,\n" ..
      "  fixedMove     = %s,\n" ..
      "  selectedSpeed = %s,\n" ..
      "  strafeMove    = %s,\n" ..
      "}\n\n",
      cData.baseSize,
      color:lower(),
      cData.commandType,
      tostring(cData.baseSize:lower() ~= "small"),
      tostring(cData.baseSize:lower() ~= "small"),
      tostring(cData.selectedSpeed),
      tostring(cData.baseSize:lower() ~= "small")
    )
    tokenObj.setLuaScript(luaScript .. globals.tokenScript)
  end

  local function initializeMiniAndCommandToken(
    index,
    unitInfo,
    faction,
    miniData
  )
    -- TODO: Remove mapping.
    if faction == "Empire" then
      faction = "Imperial"
    end
    -- TODO: Support homebrew factions better than this
    if not ({
      imperial   = 1,
      rebel      = 1,
      separatist = 1,
      republic   = 1,
      shadowcollective = 1,
    })[faction:lower()] then
      faction = "Imperial"
    end
    local rankAndRemap = unitInfo.rank
    if rankAndRemap:lower() == "special forces" then
      rankAndRemap = "specialForces"
    end
    local commandType =
      faction:lower() ..
      rankAndRemap:lower():gsub("^%l", string.upper)
    local commandName =
      color:gsub("^%l", string.upper) ..
      " " ..
      faction:gsub("^%l", string.upper) ..
      " " ..
      unitInfo.rank:gsub("^%l", string.upper) ..
      " Command Token"
    miniData.name = unitInfo.name
    miniData.baseSize = unitInfo.size
    miniData.commandName = commandName
    miniData.commandType = commandType
    miniData.selectedSpeed = unitInfo.speed
    miniData.silhData = miniData.silhData or {}
    miniData.type = miniData.type

    initializeMini(miniData)

    local commandTray = getObjectFromGUID(
      Global.getTable("commandTokenTrayData")[color:lower()][commandType]
    )
    local position = commandTray.getPosition()
    position.y = position.y + 0.5 + (0.2 * index)
    local rotation = self.getRotation()
    rotation.y = rotation.y + 180

    local tokensToSpawn = 1
    if unitInfo.tokens then
      tokensToSpawn = unitInfo.tokens
    end
    for i = tokensToSpawn, 1, -1 do
      initializeCommandToken({
        name          = commandName,
        commandType   = commandType,
        pos           = position,
        rot           = rotation,
        baseSize      = unitInfo.size,
        selectedSpeed = unitInfo.speed,
      })
    end
  end

  local function spawnUnit(
    unit,
    index,
    faction,
    totalUnits
  )
    --Min JSON Payload
    local name = unit.name
    local upgrades = unit.upgrades or {}
    local loadout = unit.loadout or {}

    --if we spawn via JSON we don't have
    --enough data to parse silhs anymore...
    --we need type and any custom values
    --so load everything off the deck if needed
    local completeUnitData

    local type = unit.type    
    local silhData = unit.silhData or {}

    if unit.silhData == nil then
      silhData = {}
      completeUnitData = deck:getUnitByFactionAndName(faction, name)
      if completeUnitData.silhouette ~= nil then
        for k, v in pairs(completeUnitData.silhouette) do
          table.insert(silhData, completeUnitData.silhouette[k])
        end
      end
    end

    if unit.type == nil then
      if completeUnitData == nil then
        completeUnitData = deck:getUnitByFactionAndName(faction, name)
      end
      type = completeUnitData.type
    end

    -- Prep unit card spawn locations.
    local offsets = computeSpawnPositions(index)
    local rotation = self.getRotation()
    local unitCard = deck:spawnUnitCard(faction, name)
    unitCard.setPosition(offsets.adjustedPos)
    unitCard.setRotation({0, rotation.y + 180, 0})

    -- Spawn upgrade cards.
    for i, upgrade in ipairs(upgrades) do
      local uOffsets = computeUpgradePositions(i)
      local upgradeCard = deck:spawnUpgradeCard(upgrade)
      upgradeCard.setPosition(
        simpleTranslatePos(
          offsets.adjustedPos,
          uOffsets.xOffset * offsets.xOffset * -1,
          uOffsets.zOffset * offsets.zOffset
        )
      )
      upgradeCard.setRotation({0, rotation.y + 180, 0})
    end

    -- Spawn unit ID token.
    local unitId = unitTokens.takeObject({
      position = offsets.adjustedPos,
      rotation = {0, rotation.y + 180, 0},
      smooth   = false,
    })

    local unitIdState = ((index - 1) % 10) + 1

    if unitIdState > 1 then
      unitId = unitId.setState(unitIdState)
    end

    local miniData = {
      name            = name,
      colorSide       = color:lower(),
      upgrades        = {},
      miniObjs        = {},
      -- Intentionally omitted. We use the name assigned from the spawned model.
      displayName     = nil,
      unitID          = index,
      unitCardGUID    = unitCard.getGUID(),
      unitIDTokenGUID = unitId.getGUID(),
      leaderIndex     = 1,
      upgrades        = upgrades,
      type            = type,
      silhData        = silhData
    }

    -- Spawn loadout and addon cards.
    local additional = {
      position = offsets.adjustedPos,
      rotation  = rotation,
    }
    if #loadout > 0 then
      additional.callback = function(spawnedBag)
        for _, upgrade in ipairs(loadout) do
          local upgradeCard = deck:spawnUpgradeCard(upgrade)
          spawnedBag.putObject(upgradeCard)
        end
      end
    end
    local result = shelf:spawnUnitModels({
      faction    = faction,
      name       = name,
      upgrades   = upgrades,
      additional = additional,
      scripts    = scripts,
      callback   = function(model, index, base)
        local position = computeMiniPositions(
          offsets.adjustedPos,
          index,
          base,
          offsets.xOffset,
          offsets.zOffset,
          #upgrades
        )
        model.setPosition(position)
        model.setRotation({rotation.x, rotation.y + 180, rotation.z})
        model.setColorTint(getGlobalTint())
        table.insert(miniData.miniObjs, {
          obj    = model,
          name   = model.getName(),
          leader = index == miniData.leaderIndex,
        })
      end,
    })

    initializeMiniAndCommandToken(
      index,
      result,
      faction,
      miniData
    )
  end

  return function(listData)
    for _, c in ipairs(listData.commandCards) do
      dealCommandCard(c, false)
    end
    for _, c in ipairs(listData.contingencies) do
      dealCommandCard(c, true)
    end
    local scenario = listData.battlefieldDeck.scenario or "standard"
    buildBattlefieldDeck(
      scenario,
      listData.battlefieldDeck.objective,
      listData.battlefieldDeck.deployment,
      listData.battlefieldDeck.condition or listData.battlefieldDeck.conditions
    )
    for i, unit in ipairs(listData.units) do
      spawnUnit(
        unit,
        i,
        listData.armyFaction,
        #listData.units
      )
    end
    mount.call("setScenario", {name = scenario})
  end
end

----#include !/SpawnList

local __state = {}

local _deck = Deck:create()
local _shelf = Shelf:create()
local _scriptRange1Token = nil
local _scriptPOIToken = nil

function onSave()
  return JSON.encode(__state)
end

function _onLoadShared(state)
  self.interactable = false
  __state = JSON.decode(state)
  _loadScripts()
  _disableVisualElements()
  _mainMenu()
end

function _loadScripts()
  getObjectFromGUID("4d25eb").takeObject({
    callback_function = function(token)
      _scriptRange1Token = token.getLuaScript()
      destroyObject(token)
    end
  })
  getObjectFromGUID("094230").takeObject({
    callback_function = function(poi)
      _scriptPOIToken = poi.getLuaScript()
      destroyObject(poi)
      end
  })
end

function _disableVisualElements()
  for _, guid in ipairs(__state.guids.options) do
    getObjectFromGUID(guid).interactable = false
  end
  for _, guid in ipairs(__state.guids.buttons) do
    getObjectFromGUID(guid).interactable = false
  end
  getObjectFromGUID(__state.guids.mount).interactable = false
end

local ui = {
  clear = function()
    for _, guid in ipairs(__state.guids.options) do
      local object = getObjectFromGUID(guid)
      object.clearButtons()
    end
    for _, guid in ipairs(__state.guids.buttons) do
      local button = getObjectFromGUID(guid)
      button.clearButtons()
      button.setColorTint({0, 0, 0})
    end
    local back = getObjectFromGUID(__state.guids.back)
    back.clearButtons()
    back.setColorTint({0, 0, 0})
  end,

  back = function(tooltip, callback)
    local button = getObjectFromGUID(__state.guids.back)
    local callName = "_onButtonClicked_Back"
    _G[callName] = function()
      button.AssetBundle.playTriggerEffect(0)
      callback()
    end
    button.createButton({
      click_function    = callName,
      function_owner    = self,
      label             = "BACK",
      position          = {0, 0.65, 0},
      scale             = {1, 1, 0.7},
      width             = 1500,
      height            = 2000,
      font_size         = 400,
      color             = {0.7573, 0.7573, 0.7573, 0.01},
      font_color        = {0, 0, 0, 100},
      tooltip           = tooltip,
    })
    button.setColorTint({1, 0, 0})
  end,

  draw = function(buttons)
    for i, config in ipairs(buttons) do
      local callback = "_onButtonClicked_" .. i
      local button
      if i > 4 then
        -- Emulate a button by drawing a rectangle.
        --
        -- Sorry, this is a huge hack until we have XML-UI list building
        -- or a new table design that can account for more option buttons.
        button = getObjectFromGUID(__state.guids.buttons[4])
        button.createButton({
          click_function = callback,
          function_owner = self,
          label          = config.title,
          tooltip        = config.tooltip,
          position       = {-11, 0.3, i},
          scale          = {3, 3, 3},
          width          = 4200,
          height         = 600,
          font_size      = 400,
          font_color     = {0, 0, 0, 100},
        })
      else
        local option = getObjectFromGUID(__state.guids.options[i])
        button = getObjectFromGUID(__state.guids.buttons[i])
        option.createButton({
          click_function = callback,
          function_owner = self,
          label          = config.title,
          tooltip        = config.tooltip,
          position       = {-0.35, 0.3, 0},
          scale          = {0.5, 0.5, 0.5},
          width          = 4200,
          height         = 600,
          font_size      = 400,
          font_color     = {0, 0, 0, 100},
          color          = {0.7573, 0.7573, 0.7573, 0.01},
        })
        button.createButton({
          click_function = callback,
          function_owner = self,
          label          = config.secondary or "",
          tooltip        = config.tooltip,
          position       = {0, 0.65, 0},
          width          = 1400,
          height         = 1400,
          font_size      = 1100,
          color          = {1, 1, 1, 0.01},
          font_color     = {0, 0, 0, 100},
          alignment      = 3,
        })
        button.setColorTint(config.tint)
      end
      
      _G[callback] = function()
        button.AssetBundle.playTriggerEffect(0)
        config.callback()
      end
    end
  end,
}

function _clearZone()
  if __state.guids.deckBuilder then
    local o = getObjectFromGUID(__state.guids.deckBuilder)
    if o then
      destroyObject(o)
    end
    __state.guids.deckBuilder = nil
  end
  __state.guids.unitBuilders = {}
  zonex.clearExcept(getObjectFromGUID(__state.guids.cardZone), "Table")
  zonex.clearExcept(getObjectFromGUID(__state.guids.handZone), "Table")
  zonex.clearExcept(getObjectFromGUID(__state.guids.battleZone), "Table")

  local data = Global.getTable("commandTokenTrayData")[__state.color:lower()]
  for _, obj in ipairs(getObjectFromGUID(data.trayZoneGUID).getObjects()) do
    if obj.getVar("isAToken") == true then
      destroyObject(obj)
    end
  end
  for _, obj in ipairs(getObjectFromGUID(data.stack).getObjects()) do
    destroyObject(obj.takeObject())
  end
end

function _spawnTemplates()
  local globals = Global.getTable("listBuilder")
  local deckBuilder = spawnObject({
    type       = "Custom_Model",
    position   = globals.deckBuilderPos[__state.color:lower()],
    rotation   = self.getRotation(),
  })
  deckBuilder.setCustomObject({
    mesh       = globals.deckBuilderMesh,
    diffuse    = globals.deckBuilderDiffuse,
    type       = 1,
    material   = 3,
  })
  deckBuilder.setLuaScript(
    string.format(
      [[
        selectedFaction  = "%s"
        selectedScenario = "%s"
        %s
      ]],
      __state.faction,
      "Standard",
      getObjectFromGUID(globals.deckBuilderGUID).getLuaScript()
    )
  )
  __state.guids.deckBuilder = deckBuilder.getGUID()

  local unitTemplate = getObjectFromGUID(globals.modelTemplateGUID)
  for i = 1, 20, 1 do
    local position = globals[__state.color:lower() .. "TemplatePos"][i]
    local rotation
    if __state.color == "Red" then
      rotation = {0, 0, 180}
    else
      rotation = {0, 180, 180}
    end
    local unitBuilder = unitTemplate.clone({
      position = position,
      rotation = rotation,
      scale    = {1, 1, 1},
    })
    Wait.frames(function()
      unitBuilder.call("initializeWithFactionAndDeckBuilder", {
        faction         = __state.faction,
        deckBuilderGUID = __state.guids.deckBuilder,
        listBuilderGUID = self.getGUID(),
      })
    end)
    position = unitBuilder.getPosition()
    unitBuilder.setPosition({position.x, 1, position.z})
    table.insert(__state.guids.unitBuilders, unitBuilder.getGUID())
  end
end

function getStateOfPrevious(unitBuilderGUID)
  for i, guid in ipairs(__state.guids.unitBuilders) do
    if guid == unitBuilderGUID then
      if i == 1 then
        return nil
      end
      return getObjectFromGUID(
        __state.guids.unitBuilders[i - 1]
      ).call("getListText")
    end
  end
end

function _mainMenu()
  ui.clear()
  ui.draw({
    {
      title    = "Create Army",
      tooltip  = "Create an army",
      callback = _chooseFaction,
      tint     = {0, 0.913, 1},
    },
    {
      title    = "Load Army",
      tootlip  = "Load an army from JSON or Data Disk",
      callback = _loadArmy,
      tint     = {0, 0.913, 1},
    },
    {
      title    = "Clear Side",
      tooltip  = "Clears the units and cards on your side of the table",
      callback = _clearZone,
      tint     = {0, 0.913, 1},
    },
    {
      title    = "Auto Tint",
      tooltip  = "Apply automatic base tining to yet-to-be-deployment units",
      callback = _autoTint,
      tint     = {0, 0.913, 1},
    }
  })
end

function _autoTint()
  local colorMap
  if __state.color == "Red" then
    colorMap = {
      {245, 34, 45},
      {255, 169, 64},
      {255, 236, 61},
      {130, 0, 20},
      {135, 56, 0},
      {135, 104, 0},
      {121, 0, 0},
      {123, 46, 0}
    }
  else
    colorMap = {
      {64, 169, 255},
      {54, 207, 201},
      {146, 84, 222},
      {0, 58, 140},
      {0, 71, 79},
      {34, 7, 94},
      {0, 84, 121},
      {0, 14, 64}
    }
  end
  for i, color in pairs(colorMap) do
    colorMap[i] = {
      color[1] / 255,
      color[2] / 255,
      color[3] / 255,
    }
  end
  local rankCount = {}
  for _, obj in pairs(getObjectFromGUID(__state.guids.cardZone).getObjects()) do
    if obj.getVar("isAMini") == true then
      local unitData = obj.getTable("unitData")
      local rankType = unitData.commandType
      local colorIndex = rankCount[rankType]
      if colorIndex == nil then
        colorIndex = 0
      end
      colorIndex = colorIndex + 1
      if colorIndex > #colorMap then
        colorIndex = 1
      end
      rankCount[rankType] = colorIndex
      local miniGUIDs = obj.getTable("miniGUIDs")
      for _, miniGuid in pairs(miniGUIDs) do
        local miniObj = getObjectFromGUID(miniGuid)
        miniObj.setColorTint(colorMap[colorIndex])
      end
      local unitIDTokenObject = getObjectFromGUID(obj.getVar("unitIDTokenGUID"))
      if unitIDTokenObject then
        unitIDTokenObject.setColorTint(colorMap[colorIndex])
      end
    end
  end
end

function _chooseFaction()
  _clearZone()
  ui.clear()
  ui.back("Go back to the main menu", _mainMenu)
  local buttons = {}
  for _, faction in ipairs(_deck:getFactions()) do
    local title = stringx.titleCase(faction)
    table.insert(buttons, {
      title    = title,
      tooltip  = "Create a " .. title .. " army",
      callback = function()
        _createArmy(title)
        _clearZone()
        _spawnTemplates()
      end,
      tint     = {0, 0.913, 1},
    })
  end
  ui.draw(buttons)
end

function _createArmy(faction)
  __state.faction = faction
  ui.clear()
  ui.back("Go back to faction selection", _chooseFaction)
  ui.draw({
    {
      title     = "Spawn Army",
      tooltip   = "Finish creating and spawn your army",
      callback  = _saveAndLoadArmy,
      tint      = {1, 0, 0},
    },
    {
      title     = "Save Army",
      tooltip   = "Save army to a data disk",
      callback  = _saveArmy,
      tint      = {0, 0.913, 1},
    },
    {
      title     = "Reset Army",
      tooltip   = "Reset army creation",
      callback  = _resetArmy,
      tint      = {0, 0.913, 1},
    },
    {
      title     = stringx.titleCase(_getSelectedScenario()) .. " Battle Deck",
      tooltip   = "Change battle deck",
      secondary = "→",
      callback  = _changeBattleDeck,
      tint      = {0, 0.913, 1},
    }
  })
end

function _saveAndLoadArmy()
  _saveArmy()
  Wait.time(_loadArmy, 0.5)
end

function _generateListData()
  local deckBuilder = getObjectFromGUID(__state.guids.deckBuilder)
  local battleDeck = deckBuilder.getTable("battlefieldCardSelection")
  battleDeck.scenario = _getSelectedScenario()
  local listData = {
    author          = "SWLegion TTS Mod",
    points          = __state.points,
    armyFaction     = __state.faction,
    units           = {},
    commandCards    = deckBuilder.getTable("commandCardSelection"),
    contingencies   = deckBuilder.getTable("contingencyCardSelection"),
    battlefieldDeck = battleDeck,
  }
  for _, guid in ipairs(__state.guids.unitBuilders) do
    local unitBuilder = getObjectFromGUID(guid)
    local text = unitBuilder.call("getListText")
    if text then
      local upgrades = {}
      for _, entry in ipairs(text.upgrades) do
        table.insert(upgrades, entry)
      end
      local silhData = {}
      for _, entry in ipairs(text.silhData) do
        table.insert(silhData, entry)
      end
      table.insert(listData.units, {
        name     = text.name,
        upgrades = upgrades,
        type = text.type,
        silhData = silhData
      })
    end
  end
  return listData
end

function _saveArmy()
  local globals = Global.getTable("listBuilder")
  local listData = _generateListData()
  local diskZone = getObjectFromGUID(__state.guids.diskZone)
  local diskMount = getObjectFromGUID(__state.guids.mount)

  for _, maybeDisk in ipairs(diskZone.getObjects()) do
    if maybeDisk ~= diskMount then
      destroyObject(maybeDisk)
    end
  end

  local position = translatePos(
    diskMount.getPosition(),
    diskMount.getRotation(),
    0.03,
    90
  )
  position.y = position.y + 1
  local dataDisk = getObjectFromGUID(globals.dataDisk.guid).clone({
    position     = position,
    rotation     = self.getRotation(),
    scale        = {1, 1, 1},
    snap_to_grid = false,
    smooth       = false,
  })
  dataDisk.setPosition(position)
  dataDisk.setLock(false)
  dataDisk.setName(
    string.format(
      "%s Army: %d Points (%s)",
      stringx.titleCase(__state.faction),
      __state.points,
      stringx.titleCase(_getSelectedScenario())
    )
  )
  dataDisk.script_state = JSON.encode(listData)
  _clearZone()
  _mainMenu()
end

function _resetArmy()
  _clearZone()
  _spawnTemplates()
end

function _getSelectedScenario()
  return getObjectFromGUID(__state.guids.battleDeck).call("getScenario")
end

function _setSelectedScenario(name)
  _createArmy(__state.faction)
  getObjectFromGUID(__state.guids.battleDeck).call("setScenario", {
    name = name,
  })
  local deckBuilder = getObjectFromGUID(__state.guids.deckBuilder)
  if deckBuilder then
    deckBuilder.call("switchBattleDeck", {
      name = name,
    })
  end
end

function _changeBattleDeck()
  local current = _getSelectedScenario()
  local scenarios = _deck:getBattleCardScenarios()
  local index = 0
  for i, name in ipairs(scenarios) do
    if name:lower() == current:lower() then
      index = i
      break
    end
  end
  index = index + 1
  if index > #scenarios then
    index = 1
  end
  current = scenarios[index]
  _setSelectedScenario(current)
end

function _loadArmy()
  local mount = getObjectFromGUID(__state.guids.mount)
  local zone = getObjectFromGUID(__state.guids.diskZone)
  for _, object in ipairs(zone.getObjects()) do
    if object ~= mount then
      _loadArmyFromJson(JSON.decode(object.script_state))
      _mainMenu()
      return
    end
  end
  broadcastToAll(
    "No data disk inserted for " .. stringx.titleCase(__state.color)
  )
end

function _loadArmyFromJson(data)
  _clearZone()
  if data.armyFaction == "" then
    data.armyFaction = "shadowcollective"
  end
  _setSelectedScenario(data.battlefieldDeck.scenario)
  local spawn = initListSpawner({
    deck        = _deck,
    shelf       = _shelf,
    globals     = Global.getTable("listBuilder"),
    color       = __state.color,
    mount       = getObjectFromGUID(__state.guids.battleDeck),
    orientation = self.getRotation(),
    unitTokens  = getObjectFromGUID(Global.getVar("unitIDTokenBagGUID")),
    -- TODO: Make this global somehow instead.
    scripts     = {
      ["toggle-range-1"] = _scriptRange1Token,
      ["poi-token"] = _scriptPOIToken
    }
  })
  spawn(data)
end

-- TODO: Rename to _importFromText.
function importFromText(_, text)
  _loadArmyFromJson(JSON.decode(text))
  _mainMenu()
end

-- TODO: Rename to _toggleListImporterUI
function toggleListImporterUI()
  local uiStatus = self.UI.getAttribute('listImporterUI', 'active')
  local newStatus = true
  if uiStatus == 'True' then
    newStatus = false
  end
  self.UI.setAttribute('listImporterUI', 'active', newStatus)
end

function _calculatePoints()
  local zone = getObjectFromGUID(__state.guids.cardZone)
  local total = 0
  for _, card in pairs(zone.getObjects()) do
    local points = card.getVar("ptCost")
    if points then
      total = total + points
    end
  end
  __state.points = total

  -- TODO: Make the counter persist.
  local counter = getObjectFromGUID(__state.guids.counter)
  counter.setValue(total)
end

-- TODO: This is terrible performance wise.
function onObjectDestroyed()
  _calculatePoints()
end

-- TODO: This is terrible performance wise.
function onObjectLeaveScriptingZone()
  _calculatePoints()
end

-- TODO: This is terrible performance wise.
function onObjectEnterScriptingZone()
  _calculatePoints()
end

----#include !/data/ListBuilderNew

function onLoad(state)
  _onLoadShared(state)
end
