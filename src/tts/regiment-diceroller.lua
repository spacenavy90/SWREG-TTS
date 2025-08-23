-- Minimal die roller for Regiment: spawn D8 (attack) and D6 (defend) from static infinite bags
-- Uses TTS roll() (physics) and reports simple counts (no face/result mapping)

colorSide = "blue"
colorSide = "red"

-- GUIDs for the infinite bags (provided)
LOCAL_D8_BAG = "dba426"  -- attack (D8)
LOCAL_D6_BAG = "9428b4"  -- defend (D6)

-- Script injected into spawned dice so they notify this roller when destroyed/dropped
SCRIPT = "function onDestroy() dieRollerInfo = Global.getTable('dieRollerInfo') dieRoller = getObjectFromGUID(dieRollerInfo."..colorSide.."DieRollerGUID) dieRoller.call('waitToUpdate') end function onDrop() dieRollerInfo = Global.getTable('dieRollerInfo') dieRoller = getObjectFromGUID(dieRollerInfo."..colorSide.."DieRollerGUID) dieRoller.call('waitToUpdate') end"

function onLoad(save_state)
  self.interactable = false
  dieRollerInfo = Global.getTable("dieRollerInfo")
  dieRollerZone = getObjectFromGUID(dieRollerInfo.dieRollerZone[colorSide])

  mode = nil -- "attack" or "defend"
  partialRoll = nil
  isRolling = false

  dieObjs = {}
  dieGuidCache = {}

  -- Removed createDieTimer to prevent endless printDieValues spam
end

-- spawn functions exposed for buttons
function spawnAttackDie()
  mode = "attack"
  spawnDieFromBag("D8")
end

function spawnDefenseDie()
  mode = "defend"
  spawnDieFromBag("D6")
end

-- take one die from the appropriate static bag and place it in the roller ring
function spawnDieFromBag(dieType)
  if dieRollerInfo == nil then dieRollerInfo = Global.getTable("dieRollerInfo") end
  if dieObjs == nil then dieObjs = {} end

  -- Clear dice if switching types
  local shouldClear = false
  if #dieObjs > 0 then
    local firstDie = dieObjs[1]
    if firstDie and firstDie.getName and firstDie.getName() ~= dieType then
      shouldClear = true
    end
  end
  if shouldClear then
    clearDie()
  end

  local dieCount = #dieObjs
  if dieCount >= 25 then return end
  dieCount = dieCount + 1

  local rot = self.getRotation()
  local pos = self.getPosition()
  local c = dieRollerInfo.diePos[dieCount].c
  local q = dieRollerInfo.diePos[dieCount].q
  local a = c * math.cos(math.rad(q + rot.y))
  local b = c * math.sin(math.rad(q + rot.y))
  pos.x = pos.x + a
  pos.z = pos.z - b
  pos.y = 3

  local bagGUID = nil
  if dieType == "D8" then
    bagGUID = LOCAL_D8_BAG
  else
    bagGUID = LOCAL_D6_BAG
  end

  local dieBag = getObjectFromGUID(bagGUID)
  if not dieBag then
    print("Die bag not found: " .. tostring(bagGUID))
    return
  end

  local diceRot = {326.26, 1.20, 89.99}
  local newDie = dieBag.takeObject({ position = pos, rotation = diceRot })
  if newDie then
    newDie.setPosition(pos)
    newDie.setLuaScript(SCRIPT)
    -- tag die type and a simple color (attack=white, defend=red)
    if dieType == "D8" then
      newDie.setVar("dieType", "attack")
      newDie.setVar("dieColor", "white")
    else
      newDie.setVar("dieType", "defend")
      newDie.setVar("dieColor", "red")
    end
    table.insert(dieObjs, newDie)
    dieGuidCache[newDie.getGUID()] = newDie
    Wait.frames(updateDieCountDisplay)
  end
end

-- roll dice in the roller zone (uses TTS built-in roll())
-- if a player color is supplied and they have selected dice, re-roll only those
function rollDie(callbackParams)
  if isRolling then return end
  isRolling = true
  partialRoll = nil

  local toRoll = {}
  local color = nil
  if callbackParams and type(callbackParams) == "table" then color = callbackParams[1] end
  if color and Player[color] then
    local selected = Player[color].getSelectedObjects()
    if selected and #selected > 0 then
      for _, s in pairs(selected) do
        if s.getValue then table.insert(toRoll, s) end
      end
      partialRoll = toRoll
    end
  end

  if #toRoll == 0 then
    local zoneObjs = dieRollerZone.getObjects()
    for _, obj in pairs(zoneObjs) do
      if obj ~= self and obj.getValue then table.insert(toRoll, obj) end
    end
  end

  if #toRoll == 0 then isRolling = false return end

  for _, d in pairs(toRoll) do
    if d and d.roll then d.roll() end
  end

  Wait.time(function()
    isRolling = false
    printDieValues()
  end, 2.0) -- wait for rolls to complete
end

-- print only counts (no face detection)
function printDieValues()
  local d6Vals = {}
  local d8Vals = {}
  local d6Count = 0
  local d8Count = 0
  local zoneObjs = dieRollerZone.getObjects()
  for _, obj in pairs(zoneObjs) do
    if obj and obj.getName and obj.getValue then
      local name = obj.getName()
      local val = obj.getValue()
      if name == "D6" then
        d6Count = d6Count + 1
        table.insert(d6Vals, val)
      elseif name == "D8" then
        d8Count = d8Count + 1
        table.insert(d8Vals, val)
      end
    end
  end

  local msg = ""
  if d8Count > 0 then
    table.sort(d8Vals)
    msg = string.upper(colorSide) .. " PLAYER: " .. tostring(d8Count) .. "d8 Dice Results: " .. table.concat(d8Vals, ", ")
  elseif d6Count > 0 then
    table.sort(d6Vals)
    msg = string.upper(colorSide) .. " PLAYER: " .. tostring(d6Count) .. "d6 Dice Results: " .. table.concat(d6Vals, ", ")
  else
    msg = string.upper(colorSide) .. " has no dice in the roller zone."
  end
  broadcastToAll(msg)

  -- update button displays (D8 = attack, D6 = defense)
  updateButtonDisplay(dieRollerInfo.buttonInfo[colorSide.."Player"].whiteAttackButtonGUID, d8Count)
  updateButtonDisplay(dieRollerInfo.buttonInfo[colorSide.."Player"].whiteDefenseButtonGUID, d6Count)
end

function updateDieCountDisplay(params)
  -- rebuild lists from zone
  dieObjs = {}
  dieGuidCache = {}
  local d6Count = 0
  local d8Count = 0

  if dieRollerZone == nil then return end
  local zoneObjs = dieRollerZone.getObjects()
  for _, newObj in pairs(zoneObjs) do
    if newObj ~= self and newObj ~= nil then
      local name = newObj.getName and newObj.getName() or nil
      if name == "D6" then
        d6Count = d6Count + 1
      elseif name == "D8" then
        d8Count = d8Count + 1
      end
      table.insert(dieObjs, newObj)
      dieGuidCache[newObj.getGUID()] = newObj
    end
  end
  -- update button displays (D8 = attack, D6 = defense)
  updateButtonDisplay(dieRollerInfo.buttonInfo[colorSide.."Player"].whiteAttackButtonGUID, d8Count)
  updateButtonDisplay(dieRollerInfo.buttonInfo[colorSide.."Player"].whiteDefenseButtonGUID, d6Count)
end

function updateButtonDisplay(buttonGUID, count)
  local buttonObj = getObjectFromGUID(buttonGUID)
  if not buttonObj then return end
  local data = buttonObj.getTable("data") or {}
  if count and count ~= 0 then
    data.label = tostring(count)
  else
    data.label = ""
  end
  buttonObj.clearButtons()
  buttonObj.createButton(data)
end

function clearDie()
  local zoneObjs = dieRollerZone.getObjects()
  for _, obj in pairs(zoneObjs) do
    if obj ~= self then destroyObject(obj) end
  end
  dieObjs = {}
  dieGuidCache = {}
end


function waitToUpdate()
  local timerCounter = Global.getVar("timerCounter") or 0
  timerCounter = timerCounter + 1
  Global.setVar("timerCounter", timerCounter)
  Timer.create({ identifier = "DieRoller"..timerCounter, function_name = "updateDieCountDisplay", function_owner = self, delay = 0.1 })
end

function onCollisionEnter(collision_info)
  updateDieCountDisplay()
end

function onload()
  onLoad()
end
