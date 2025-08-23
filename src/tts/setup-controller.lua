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

function onload(save_state)
    _G.Deck = Deck:create()
    _G.Shelf = Shelf:create()
    self.interactable = false

    -- intialize
    setUpCards = Global.getTable("setUpCards")
    setUpData = Global.getTable("setUpData")
    battlefieldZone = getObjectFromGUID(Global.getVar("battlefieldZoneGUID"))
    gameData = getObjectFromGUID(Global.getVar("gameDataGUID"))
    battlefieldTint = gameData.getTable("battlefieldTint")

    -- token scripts
    _G.scriptRange1Token = nil
    _G.scriptBombCart = nil
    _G.scriptPOIToken = nil
    getTokenScripts()

    -- buttonObjs
    optionObjs = {}
    optionObjs.objective = getObjectFromGUID("9480a7")
    optionObjs.deployment = getObjectFromGUID("538f4d")
    optionObjs.conditions = getObjectFromGUID("c6b3a9")

    optionButtons = {}
    optionButtons.objective = getObjectFromGUID("10483c")
    optionButtons.deployment = getObjectFromGUID("1e6398")
    optionButtons.conditions = getObjectFromGUID("337dc3")

    optionZones = {}
    optionZones.objective = getObjectFromGUID("d0ca46")
    optionZones.deployment = getObjectFromGUID("b74727")
    optionZones.conditions = getObjectFromGUID("ec8c41")

    objectiveMenu()
    deploymentMenu()
    conditionsMenu()

    _G.selectedScenario = "standard"
    drawInput()
end

function drawInput()
  self.clearInputs()
  self.createInput({
    input_function = "scenarioChanged",
    function_owner = self,
    label          = "Scenario",
    alignment      = 3,
    position       = {x = -3.0, y = 0.2, z = 0},
    rotation       = {x = 0, y = 180, z = 0},
    width          = 2000,
    height         = 350,
    font_size      = 323,
    validation     = 4,
    value          = _G.selectedScenario,
    tooltip        = "Battlefield Deck Type",
  })
end

function scenarioChanged(_, _, input, editing)
  if input and not editing then
    _G.selectedScenario = input
  end
end

function changeScenario(params)
  _G.selectedScenario = params[1]
  drawInput()
end

function getTokenScripts()
  getObjectFromGUID("4d25eb").takeObject({
    callback_function = function(token)
      _G.scriptRange1Token = token.getLuaScript()
      destroyObject(token)
    end
  })
  _G.scriptBombCart = getObjectFromGUID("b497e1").getLuaScript()
  getObjectFromGUID("094230").takeObject({
    callback_function = function(poi)
      _G.scriptPOIToken = poi.getLuaScript()
      destroyObject(poi)
      end
  })
end

function objectiveMenu()
    clearButton("objective")
    createOptionButton("objective", "checkObjective", "Objective", "Spawn Relevant Objective Tokens", {0,0.913,1})
end

function deploymentMenu()
    clearDeploymentBoundary()
    clearButton("deployment")
    createOptionButton("deployment", "checkDeployment", "Deployment", "Create Deployment overlay", {0,0.913,1})
end


function conditionsMenu()
    clearButton("conditions")
    createOptionButton("conditions", "checkConditions", "Conditions", "Spawn Relevant Conditions Tokens", {0,0.913,1})
end

function checkCardCall(cardTable)
  return checkCard(cardTable[1])
end

function checkCard(cardType)
  local battleDeckScenario = _G.selectedScenario
  setUpCardData = nil
  zoneObj = nil
  zoneObj = getObjectFromZone(cardType)

  if zoneObj then
    local name = zoneObj.getName()
    local type = Deck:getBattleCardType(name, battleDeckScenario)
    -- TODO: Clean up once there is a better mechanism for these types of cards.
    if not type then
      return false
    end
    if type == "condition" then
      type = "conditions"
    end
    if type:upper() == cardType:upper() then
      self.call("activate"..type, name)
    else
      self.call("wrong".. type)
    end
  else
    self.call("no".. cardType)
  end
  return true
end

function getObjectFromZone(selectedZone)
    local zoneObjs = nil
    local selectedObj =  nil
    local zoneObjs = optionZones[selectedZone].getObjects()
    for i, obj in pairs(zoneObjs) do
        if obj ~= optionObjs[selectedZone] then
            selectedObj = obj
            break
        end
    end
    if selectedObj ~= nil then
        return selectedObj
    else
        return nil
    end
end


function spawnObjs(cardType, selectedBattleCardName)
  local objects = Deck:getBattleCardObjects(
    selectedBattleCardName,
    cardType,
    _G.selectedScenario
  )
  if #objects == 0 then
    return
  end
  local position = ({
    objective  = {49, 1, 16},
    deployment = {49, 1, 12},
    condition  = {49, 1, 08}, 
  })[cardType:lower()]
  Shelf:spawnAdditionalObjects({
    name     = selectedBattleCardName .. "'s Objects",
    position = position,
    objects  = objects,
    -- TODO: Make this global somehow instead.
    scripts  = {
      ["toggle-range-1"] = _G.scriptRange1Token,
      ["bomb-cart"]      = _G.scriptBombCart,
      ["poi-token"]      = _G.scriptPOIToken
    }
  })
end

local xStart = -25
local zStart = 15
local yValue = 20

local deployLinks = {}
  deployLinks.r = "https://steamusercontent-a.akamaihd.net/ugc/1738944060882006204/75F636F4133C5F85682ECDEBBECB9F6CD821315F/"
  deployLinks.rh = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708249497/CC08277B7D876CF1FFCEDD3FC499AC38034B36D8/"
  deployLinks.rs = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708249497/CC08277B7D876CF1FFCEDD3FC499AC38034B36D8/"
  deployLinks.rss = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708249497/CC08277B7D876CF1FFCEDD3FC499AC38034B36D8/"
  deployLinks.rl = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708336160/21601D81F35521B72E015AA6316913521943E73F/"
  deployLinks.rc = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708336119/D74B484417970BC524ED4624932102C6BF956E91/"
  deployLinks.rcc = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708336119/D74B484417970BC524ED4624932102C6BF956E91/"
  deployLinks.b = "https://steamusercontent-a.akamaihd.net/ugc/1738944060882006162/077B3B0AE278E39363F5BD3AE070B5AE36F025FA/"
  deployLinks.bh = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708249441/767C99D0983A24618F97511192498FBEED1557F2/"
  deployLinks.bs = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708249441/767C99D0983A24618F97511192498FBEED1557F2/"
  deployLinks.bss = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708249441/767C99D0983A24618F97511192498FBEED1557F2/"
  deployLinks.bl = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708335699/9EF627695432090869A748114A0ED41B262FAE46/"
  deployLinks.bc = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708335638/DB6B86B4DA42884BDF3D899DD66AF5DBD94263B8/"
  deployLinks.bcc = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708335638/DB6B86B4DA42884BDF3D899DD66AF5DBD94263B8/"

local deployRotations = {}
  deployRotations.r = 0 
  deployRotations.rh = 0
  deployRotations.rs = 90
  deployRotations.rss = 90
  deployRotations.rl = 0
  deployRotations.rc = 0
  deployRotations.rcc = 0
  deployRotations.b = 0
  deployRotations.bh = 0
  deployRotations.bs = 90
  deployRotations.bss = 90
  deployRotations.bl = 0
  deployRotations.bc = 0
  deployRotations.bcc = 0

local deployOffset = {}
  deployOffset.r = {0, 0, 0}
  deployOffset.rh = {0, 0, -1.5}
  deployOffset.rs = {1.5, 0, 0}
  deployOffset.rss = {-1.5, 0, 0}
  deployOffset.rl = {0, 0, 0}
  deployOffset.rc = {1.5, 0, -1.5}
  deployOffset.rcc = {-1.5, 0, -1.5}
  deployOffset.b = {0, 0, 0}
  deployOffset.bh = {0, 0, 1.5}
  deployOffset.bs = {-1.5, 0, 0}
  deployOffset.bss = {1.5, 0, 0}
  deployOffset.bl = {0, 0, 0}
  deployOffset.bc = {-1.5, 0, 1.5}
  deployOffset.bcc = {1.5, 0, 1.5}

function AddVectors(vectorA, vectorB)
  vectorA[1] = vectorA[1] + vectorB[1]
  vectorA[2] = vectorA[2] + vectorB[2]
  vectorA[3] = vectorA[3] + vectorB[3]
  return vectorA  
end

function spawnBoundaryCell(cell, x, z)
  local asset = deployLinks[cell]
  local offset = deployOffset[cell]
  local pos = {
    xStart + (6 * (x - 1)),
    yValue,
    zStart - (6 * (z - 1)),
  }

  pos = AddVectors(pos, offset)

  local projector = spawnObject({
    type        = "Custom_AssetBundle",
    position    = pos,
    scale       = {0, 0, 0},
    rotation    = {0, deployRotations[cell], 0}
  })
  projector.setName("Deployment Boundary")
  projector.setLock(true)
  projector.setCustomObject({
    assetbundle = asset,
  })
end

function spawnDeploymentBoundary(matrix)
    local function invertMatrix(input)
      -- See https://github.com/swlegion/tts/issues/275.
      local output = {}
      local height = #input
      local width  = #input[1]
      for y = 1, height, 1 do
        output[y] = {}
        for x = 1, width, 1 do
          output[y][x] = " "
        end
      end
      for y = 1, height, 1 do
        for x = 1, width, 1 do
          output[y][x] = input[height + 1 - y][width + 1 - x]
        end
      end
      return output
    end
    
    matrix = invertMatrix(matrix)
    -- matrix is in the format of
    -- { x, x, x, x, x, x, x, x, x, x, x, x }
    -- { x, x, x, x, x, x, x, x, x, x, x, x }
    -- { x, x, x, x, x, x, x, x, x, x, x, x }
    -- { x, x, x, x, x, x, x, x, x, x, x, x }
    -- { x, x, x, x, x, x, x, x, x, x, x, x }
    -- { x, x, x, x, x, x, x, x, x, x, x, x }
    -- ... where "x" can either be:
    -- "r" :  red deployment zone
    -- "b" :  blue deployment zone
    -- ""  :  ignore
    for z, row in pairs(matrix) do
      for x, cell in pairs(row) do
        if cell == " " then
          -- skip the blank cells
        elseif cell == "bl" then
          spawnBoundaryCell("bs", x, z)
          spawnBoundaryCell("bcc", x, z)
        elseif cell == "rl" then
          spawnBoundaryCell("rs", x, z)
          spawnBoundaryCell("rcc", x, z)
        else
          spawnBoundaryCell(cell, x, z)
        end
      end
    end
end

function clearDeploymentBoundary()
    local battlefieldObjs = battlefieldZone.getObjects()
    for _, obj in pairs(battlefieldObjs) do
        if obj.getName() == "Deployment Boundary" then
            destroyObject(obj)
        end
    end
end

function activateobjective(name)
  spawnObjs("objective", name)
  objectiveMenu()
end

function resetTimer(setUpType)
    Timer.destroy(setUpType.."ResetTimer")
    Timer.create({
        identifier     = setUpType.."ResetTimer",
        function_name  = setUpType.."Menu",
        function_owner = self,
        delay          = 4,
        repetitions    = 1
    })
end

function noObjectiveTokensMenu()
    clearButton("objective")
    createOptionButton("objective", "checkObjective", "No Tokens", "No relevant Objective tokens needed", {0.7,0,0})
    resetTimer("objective")
end

function noConditionsTokensMenu()
    clearButton("conditions")
    createOptionButton("conditions", "checkConditions", "No Tokens", "No relevant Conditions tokens needed", {0.7,0,0})
    resetTimer("conditions")
end

function noDeploymentTokensMenu()
    clearButton("deployment")
    createOptionButton("deployment", "checkdDeployment", "No Tokens", "No relevant Objective tokens needed", {0.7,0,0})
    resetTimer("objective")
end

function noDeploymentMenu()
    clearButton("deployment")
    createOptionButton("deployment", "checkDeployment", "No Tokens", "No relevant Objective tokens needed", {0.7,0,0})
    resetTimer("deployment")
end

function activatedeployment(name)
    clearDeploymentBoundary()
    local zone = Deck:getDeploymentBoundary(name, _G.selectedScenario)
    if zone and #zone > 0 then
      spawnDeploymentBoundary(zone)
    end
    deactivateDeploymentMenu()
    spawnObjs("deployment", name)
end

function deactivateDeploymentMenu()
    clearButton("deployment")
    createOptionButton("deployment", "deploymentMenu", "Remove Overlay", "Remove Deployment Overlay", {0.7,0,0})
end

function activateconditions(name)
  spawnObjs("condition", name)
  objectiveMenu()
end

function checkObjective()
    checkCard("objective")
end
function checkDeployment()
    checkCard("deployment")
end
function checkConditions()
    checkCard("conditions")
end

function noobjective()
    clearButton("objective")
    createOptionButton("objective", "checkObjective", "Mount Objective", "No Objective selected, mount objective card below", {0.7,0,0})
    resetTimer("objective")
end

function wrongobjective()
    clearButton("objective")
    createOptionButton("objective", "checkObjective", "Wrong Card", "Wrong Card mounted, mount objective card below", {0.7,0,0})
    resetTimer("objective")
end

function nodeployment()
    clearButton("deployment")
    createOptionButton("deployment", "checkDeployment", "Mount Deployment", "No Deployment selected, mount deployment card below", {0.7,0,0})
    resetTimer("deployment")
end

function wrongdeployment()
    clearButton("deployment")
    createOptionButton("deployment", "checkDeployment", "Wrong Card", "Wrong Card mounted, mount deployment card below", {0.7,0,0})
    resetTimer("deployment")
end

function noconditions()
    clearButton("conditions")
    createOptionButton("conditions", "checkConditions", "Mount Conditions", "No Conditions selected, mount conditions card below", {0.7,0,0})
    resetTimer("conditions")
end

function wrongconditions()
    clearButton("conditions")
    createOptionButton("conditions", "checkConditions", "Wrong Card", "Wrong Card mounted, mount conditions card below", {0.7,0,0})
    resetTimer("conditions")
end


function clearButton(optionSelection)

    optionObjs[optionSelection].clearButtons()

    optionButtons[optionSelection].clearButtons()
    optionButtons[optionSelection].setColorTint({0,0,0})
end

function createOptionButton(optionType, optionClickFunction, optionLabel, optionToolTip, tint)
    optionObj = optionObjs[optionType]
    optionButton = optionButtons[optionType]

    _G["setupControllerOptionFunction"..optionType] = function()
        optionButtons[optionType].AssetBundle.playTriggerEffect(0)
        _G[optionClickFunction]()
    end
    optionObj.createButton({
        click_function = "setupControllerOptionFunction"..optionType, function_owner = self, label = optionLabel, position = {-0.5, 0.3, -1.95}, scale = {0.5, 0.5, 0.5}, width = 2500, height = 600, font_size = 300, color = {0.7573, 0.7573, 0.7573, 0.01}, font_color = {0, 0, 0, 100},tooltip = optionToolTip
    })

    optionButton.createButton({
        click_function = "setupControllerOptionFunction"..optionType, function_owner = self, label = "", position = {0, 0.65, 0}, width = 1400, height = 1400, font_size = 1100, color = {1,1,1,0.01},font_color = {1,1,1,100}, tooltip = optionToolTip, alignment = 3
    })

    optionButton.setColorTint(tint)
end
