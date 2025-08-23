rangeKey = "token"

----#include !/TokenWithRangeRuler
----#include !/RangeRulers
----#include !/data/RangeRulerLinks
function getRangeRulerLinks()
    local rangeRulers  = {}
        -- 27mm
        rangeRulers.small = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393064/133FD5E0FD2801C320C6F4D271E9860A9383A2D2/"
        -- 50mm
        rangeRulers.medium = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393102/9F0A824003577BA4AE2CE1AE03ADA4DD7796EBC9/"
        -- 70mm
        rangeRulers.large = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393137/2B21FA95AD74281B47EC248CB78D5648099E2735/"
        -- 100mm
        rangeRulers.huge = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393174/580A8DFC2CD970253A93C93197EDE29E2A0D98FA/"
        -- 120mm
        rangeRulers.laat = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393255/C32C9978B04C009EAD0EDE3DBCA8A508EF4B7EAE/"
        -- 150mm
        rangeRulers.epic = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393312/B4A26CDF7294AFCBB84D9836593037610519BE2B/"
        -- 100mm oblong
        rangeRulers.long = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393212/C1D52E052A6F31D212B4E91A3961A29FFCC47DBA/"
        -- 100mm x 200mm oblong
        rangeRulers.snail = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867709463/C4B55BF3BC0F3682F9D024D5C2519BC0166CBADB/"
        -- bomb cart
        rangeRulers.bombCart = "https://steamusercontent-a.akamaihd.net/ugc/1838032857803650871/DB525612CDAF46A18A49B82C57A744E9A1F09D79/"
        -- smoke token
        rangeRulers.smokeToken = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056387710/E5CB0DCCC147802B3E276B5922237171E0D53185/"
        -- charge, objective, condition
        rangeRulers.token = "https://steamusercontent-a.akamaihd.net/ugc/1841415725493967222/CCEB0E06A39A2CB77FF9BCFEF8992F17B6E81C09/"
        -- graffiti token, same as objective but range 2
        rangeRulers.tokenRangeTwo = "https://steamusercontent-a.akamaihd.net/ugc/1841415725493967724/6AB27B28FEAA00EDDBBA9FCCB6BDED249836596A/"
        -- poi token (2" token w/ 3" range)
        rangeRulers.poi = "https://steamusercontent-a.akamaihd.net/ugc/2482129948495938224/AE12E3C12026D934AFE5A96D511D39D385411CEA/"
    return rangeRulers
end
----#include !/data/RangeRulerLinks

function showRangeOnHoveredModel(hoverObject)
  clearRangeRulers()
  if hoverObject then
    if hoverObject.interactable then
      if selectedUnitObj == hoverObject then
        selectedUnitObj = nil
        return
      else
        spawnRangeRuler(hoverObject)
        selectedUnitObj = hoverObject
      end
    end
  else
    selectedUnitObj = nil
  end
end

-- Refactor this to work with the refactored spawnRangeRuler()
function clearRangeRulers()
  if rangeRuler ~= nil then
    destroyObject(rangeRuler)
    rangeRuler = nil
  end

  noRulers = true
end


function spawnRangeRuler(rangeSourceObject, projectorBundleOverride)
  if rangeSourceObject == nil then 
    return 
  end

  local rulerBundleToSpawn = ""

  if projectorBundleOverride ~= nil then
    rulerBundleToSpawn = projectorBundleOverride
  else
    -- Get unit data from leader if leader hovered
    local unitData = rangeSourceObject.getTable("unitData")

    -- If leader not hovered, get leader GUID from mini data to get unit data
    if not unitData then
      local unitLeader = getObjectFromGUID(rangeSourceObject.getVar("leaderGUID"))
      if not unitLeader then
        return 
      end
      unitData = unitLeader.getTable("unitData")
      if not unitData then
        return 
      end
    end

    local baseSize = unitData.baseSize
    local rulerBundleTable = getRangeRulerLinks()
    rulerBundleToSpawn = rulerBundleTable[baseSize] 
  end

  basePos = rangeSourceObject.getPosition()
  baseRot = rangeSourceObject.getRotation()

  rangeRuler = spawnObject({
    type = "Custom_AssetBundle",
    position = {basePos.x, basePos.y + 20, basePos.z},
    rotation = {90, baseRot.y, 0},
    scale = {0,0,0} -- 0 scale will hide TTS default box and won't impact projector
  })

  rangeRuler.setCustomObject({
    type = 0,
    assetbundle = rulerBundleToSpawn
  })

  rangeRuler.setLock(true)
  rangeRuler.setName("Range Ruler")
  luaScript = "targetGUID = '"..rangeSourceObject.getGUID().."'\n function onFixedUpdate()\nif targetGUID ~= nil then\n targetObj = getObjectFromGUID(targetGUID)\n local targetPosition = targetObj.getPosition()\n self.setPosition({targetPosition.x, targetPosition.y + 20, targetPosition.z})\n self.setRotation({0,targetObj.getRotation().y,0})\n end\n end"
  rangeRuler.setLuaScript(luaScript)

  noRulers = false
end

----#include !/RangeRulers

-- each token must define 'rangeKey' with key listed below

-- Token keys in RangeRulers Table
-- smokeToken = 18.8mm diameter (range 1)
-- token = 25.1mm diameter (range 1)
-- poi = 50.8mm diameter (range 0.5 aka 3in)

function onLoad()
  rangeOn = false
  createButton({0, 0, 0})
  createButton({0, 0, 180})
end

function createButton(rotation)
  self.createButton({
    click_function = "toggleRangeRuler",
    function_owner = self,
    label = "R",
    tooltip = "Spawn Range Ruler",
    position = {0, 0.1, 0.7},
    rotation = rotation,
    scale = {0.5, 0.5, 0.5},
    width = 400,
    height = 300,
    font_size = 200,
    color = {0, 0, 0, 1},
    font_color = {0.1212, 0.8127, 0, 1}
  })
end

function onDestroy()
  clearRangeRuler()
end

function toggleRangeRuler()
  clearRangeRuler()
  rangeOn = not rangeOn
  if rangeOn then
    spawnTokenRangeRuler()
  end
end

function clearRangeRuler()
  if rangeRuler then
    destroyObject(rangeRuler)
    rangeRuler = nil
  end
end

function spawnTokenRangeRuler()
  local rangeRulerTable = getRangeRulerLinks()
  local tokenRulerBundle = rangeRulerTable[rangeKey]
  spawnRangeRuler(self, tokenRulerBundle)
end

----#include !/TokenWithRangeRuler
