----#include !/data/BattleDeck
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

local __state = {}

function onSave()
  return JSON.encode(__state)
end

function _onLoadShared(state)
  self.interactable = false
  __state = JSON.decode(state)

  self.createButton({
    click_function = "defineBattlefield",
    function_owner = self,
    label          = "Battle Deck",
    tooltip        = "Define Battlefield",
    position       = {-0.5, 0.3, -1.95},
    scale          = {0.5, 0.5, 0.5},
    width          = 2500,
    height         = 600,
    font_size      = 300,
    color          = {0.7573, 0.7573, 0.7573, 0.01},
    font_color     = {0, 0, 0, 100},
  })

  getObjectFromGUID(__state.guids.button).createButton({
    click_function = "defineBattlefield",
    function_owner = self,
    label          = "",
    tooltip        = "Define Battlefield",
    position       = {0, 0.65, 0},
    width          = 1400,
    height         = 1400,
    font_size      = 1100,
    color          = {1, 1, 1, 0.01},
    font_color     = {1, 1, 1, 100},
    alignment      = 3,           
  })

  _updateInput()
end

function _updateInput()
  local rotation = self.getRotation()
  if self.getPosition().z < 0 then
    rotation.y = rotation.y + 180
  end
  self.clearInputs()
  self.createInput({
    input_function = "_scenarioChanged",
    function_owner = self,
    label          = "Scenario",
    alignment      = 3,
    color          = {204, 204, 204, 0.9},
    position       = {x = 0, y = 0, z = -3},
    rotation       = rotation,
    width          = 1900,
    height         = 350,
    font_size      = 323,
    validation     = 4,
    value          = __state.scenario,
    readonly       = true,
    tooltip        = "Battlefield Deck Type",
  })
  _G.selectedScenario = __state.scenario
end

function getScenario()
  return __state.scenario
end

function setScenario(params)
  local name = params.name
  if not name then
    return
  end
  __state.scenario = stringx.titleCase(name)
  _updateInput()
end

function _scenarioChanged(_, _, input, editing)
  if input and not editing then
    __state.scenario = stringx.titleCase(input)
    _updateInput()
  end
end

function defineBattlefield()
  getObjectFromGUID(__state.guids.button).AssetBundle.playTriggerEffect(0)
  local deck = zonex.firstWhereNot(getObjectFromGUID(__state.guids.zone), "Table")
  if deck then
    local game = getObjectFromGUID(Global.getTable("gameController").objGUID)
    game.call("defineBattlefieldMenu", {
      deck     = deck,
      scenario = __state.scenario,
    })
  else
    broadcastToAll(
      "No Battlefield Deck. Insert Battlefield Deck to Define Battlefield",
      {1,1,1}
    )
  end
end

----#include !/data/BattleDeck

function onLoad(state)
  _onLoadShared(state)
end
