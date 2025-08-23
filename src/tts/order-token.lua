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
----#include !/data/MovementLinks
function getMovementLinks()
    local movements = {}
        --27 mm
        movements.small = 
            {
                "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204398/3BF983176395A82824EF4EE3FB5846C1CB0D94C1/",
                "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204455/0328A5B6A65A6CCC03783F90F2F9ADBADBE51F16/",
                "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204508/3B461A9ED5C8FD15A9CE994B2EF4A23D1FE620B8/"
            }
        --50 mm
        movements.medium = 
            {
                "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204556/87F73A7126B6689E33C649AFF7EB066088058675/",
                "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204612/C9441D6D7226BC856FD32B1393EBCFEEF4BE06BC/",
                "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204654/31AE6A35319E67A7FA5F3FA095924FDB83EFE9BD/"
            }
        --70mm
        movements.large = 
        {
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204703/498144067F964315AB9FFE0BE79524FA0BD82A78/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204750/FD705459AEB3C1E5C0A7EA8F2822CB2956EC1D48/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204808/B32F1BE12E4BA2E650E2A7C752BA456A8F833416/"
        }
        --100mm
        movements.huge = 
        {
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204854/B728B49E1E03ECC40F2318700652525ECE1B1961/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204904/5249FC634B658DF12ADC4D2ED7C952DAF4097F2C/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204949/BC9B663C90D3BFEFE8E9BF351A8B44E5B34954CE/"
        }
        --120mm
        movements.laat = 
        {
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004204999/3D0E5B5EFA5A4D016847502CA7D7EA651D8118D2/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205042/114008A17C31BE35A59FA82DDB4D746026D34599/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205092/FA8D1FEA3F65886CEBD36F5FDC2C8C55455CECE0/"
        }
        --150mm
        movements.epic =
        {
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205159/3D78003849E8563AB0ECAE3E3188B038425D44AE/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205214/5C61176C31C6785328C6C1E5D2C9C87CA803858A/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205245/ACAA917CA1F56999CCCDDC60266DB3D78C131866/"
        }
        --100mm x 175mm oblong (gav, aa5)
        movements.long = 
        {
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205310/A960CABCFD4E95BF5174136D4C1FB456C67C5477/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205355/D4CACF1FDABB078937B0ABD3D6CF73EB3A3E6C82/",
            "https://steamusercontent-a.akamaihd.net/ugc/1687149777004205405/5AB008BF976CF4FE3BDDB8939D5BD0A5324D617B/"
        }
        --100mm x 200mm oblong (snail)
        movements.snail = 
        {
            "https://steamusercontent-a.akamaihd.net/ugc/1924743543116064734/122782FB31D01159AF6C8D9026C56C7D8A43FBD0/",
            "https://steamusercontent-a.akamaihd.net/ugc/1924743543116064779/7F5AA0014CA66891FABEDA407BCB7043DEAF85ED/",
            "https://steamusercontent-a.akamaihd.net/ugc/1924743543116064825/1198CC05646024F0A4BDD3048C9237BA78350274/"
        }
    return movements
end

----#include !/data/MovementLinks
----#include !/Cohesion
----#include !/data/CohesionLinks
function getCohesionLinks()
    local cohesions = {}
        --27 mm
        cohesions.small = "https://steamusercontent-a.akamaihd.net/ugc/2482129948496305632/EBBE2560D4336E6C96317EDDA787E225CF0E5B48/"
        --50 mm
        cohesions.medium = "https://steamusercontent-a.akamaihd.net/ugc/2482129948496305877/719896A3F975D8C914D47DC22507816A512C4839/"
        --70 mm
        cohesions.large = "https://steamusercontent-a.akamaihd.net/ugc/2482129948496305957/A977453A781738EA5AF2935A4562670012881080/"
    return cohesions
end

----#include !/data/CohesionLinks

function showCohesionOnHoveredModel(hoverObject)
   if hoverObject then
      if hoverObject.interactable then
         if selectedUnitObj == hoverObject then
            clearCohesionRuler()
            selectedUnitObj = nil
            return
         end
      end
   end
   clearCohesionRuler()
   spawnCohesionRuler(hoverObject)
end

function spawnCohesionRuler(cohesionSourceObject)
    if not cohesionSourceObject then
        return
    end
    if cohesionRuler ~= nil then
        clearCohesionRuler()
    end

    local newUnitData = cohesionSourceObject.getTable("unitData")
    if not newUnitData then 
      return 
    end

    local cohesionBundlesTable = getCohesionLinks()
    local baseSize = newUnitData.baseSize
    local cohesionBundleToSpawn = cohesionBundlesTable[baseSize]

    if cohesionBundleToSpawn == nil then return end

    local basePos = cohesionSourceObject.getPosition()
    local baseRot = cohesionSourceObject.getRotation()

    cohesionRuler = spawnObject({
        type="Custom_AssetBundle",
        position = {basePos.x, basePos.y + 20, basePos.z},
        rotation = {0, baseRot.y, 0},
        scale = {0,0,0} -- 0 scale will hide TTS default box and won't impact projector
    })

    cohesionRuler.setCustomObject({
        type = 0,
        assetbundle = cohesionBundleToSpawn
    })

    cohesionRuler.setLock(true)
    cohesionRuler.use_gravity = false
    cohesionRuler.setName("Cohesion Ruler")
end

function clearCohesionRuler()
    if cohesionRuler ~= nil then
        cohesionRuler.destruct()
        cohesionRuler = nil
    end
end
----#include !/Cohesion


-- Model Token

function onload()
  -- LOAD VALUES
  _G.battlefieldZone = getObjectFromGUID(Global.getVar("battlefieldZoneGUID"))
  _G.templateInfo = Global.getTable("templateInfo")
  _G.highlightTints = Global.getTable("highlightTints")

  -- set info
  _G.selectedUnit = nil
  _G.activated = false

  -- setUp
  if _G.unitData ~= nil then
    local dieRollerInfo = Global.getTable("dieRollerInfo")
    _G.isAToken = true
    _G.dieRoller = getObjectFromGUID(dieRollerInfo[_G.unitData.colorSide.."DieRollerGUID"])
    setTemplateVariables()
    initialize()
  end
end

--
function setTemplateVariables()
    unitData.aStart = templateInfo.aStart[unitData.baseSize][unitData.selectedSpeed]
    unitData.templateMesh = templateInfo.templateMesh[unitData.selectedSpeed]
    unitData.templateBallCollider = templateInfo.templateBallCollider
    unitData.tint = templateInfo.tint[unitData.selectedSpeed]
    unitData.buttonPosition = templateInfo.buttonPosition[unitData.selectedSpeed]
    unitData.buttonColor = templateInfo.buttonColor[unitData.selectedSpeed]
    unitData.fontColor = templateInfo.fontColor[unitData.selectedSpeed]
end
------------------------------------------------- MATH FIND PROXIMITY------------------------------------------------------------
function findProximity(targetObj, object)
    local objectPos = object.getPosition()
    local targetPos = targetObj.getPosition()

    local xDistance = math.abs(targetPos.x - objectPos.x)
    local zDistance = math.abs(targetPos.z - objectPos.z)
    local distance = xDistance^2 + zDistance^2
    return math.sqrt(distance)
end




------------------------------------------------- getSelectedUnit() ------------------------------------------------------------
function getEligibleUnit()
    eligibleUnits = nil
    eligibleUnits = {}
    eligibleUnitsNumber = 0
    selectedUnitObj = nil

    local allUnits = nil
    local allUnits = battlefieldZone.getObjects()

    if allUnits ~= nil then
        local closestDistance = 9999999999999

        -- check all units
        for i, unit in pairs(allUnits) do
            -- check eligibility

            local miniData = unit.getTable("unitData")
            local isAMini = unit.getVar("isAMini")
            if miniData and miniData.commandType then
                if isAMini == true and unitData.commandType == miniData.commandType and unit.getVar("colorSide") == unitData.colorSide then
                    -- add to eligible units
                    eligibleUnitsNumber = eligibleUnitsNumber + 1
                    eligibleUnits[eligibleUnitsNumber] = unit

                    -- find distance
                    local distance = findProximity(self, unit)


                    if distance < closestDistance then
                        selectedUnitObj = unit
                        selectedUnitNumber = eligibleUnitsNumber
                        closestDistance = distance
                    end
                end
            end

        end
        -- if success
        if selectedUnitObj then
            getSelectedUnitObjVariables()
            setTemplateVariables()
        end
    end
end

function highlightUnit(selectedMiniGUIDs, highlightColor)
  for _, guidEntry in ipairs(selectedMiniGUIDs) do
    obj = getObjectFromGUID(guidEntry)
    if obj then
      obj.highlightOn(highlightColor)
    end
  end
end

function unhighlightUnit(selectedMiniGUIDs)
    if selectedMiniGUIDs then
        for k, guidEntry in pairs(selectedMiniGUIDs) do
            obj = getObjectFromGUID(guidEntry)
            if obj then
                obj.highlightOff()
            end
        end
    end
end

function highlightCard(selectedUnitCard)
    if selectedUnitCard then
        selectedUnitCard.highlightOn({0,1,0})
    end
end

function forceUnhighlight()
    local allObjs = getAllObjects()
    for _, obj in pairs(allObjs) do
        obj.highlightOff()
    end
end


function unHighlightCard(selectedUnitCard)
    if selectedUnitCard then
        selectedUnitCard.highlightOff()
    end
end

function getSelectedUnitObjVariables()
    if selectedUnitObj then
        newUnitData = selectedUnitObj.getTable("unitData")
        unitData.baseSize = newUnitData.baseSize
        unitData.selectedSpeed = newUnitData.selectedSpeed
    end
end

------------------------------------------------- STANDBY ------------------------------------------------------------
function initialize()

    activated = false
    --getEligibleUnit()

    createStandbyButtons()

end

function createStandbyButtons()
    if selectedUnitObj then
        self.createButton({
            click_function = "activate",
            function_owner = self,
            label = "ACT", position = {0, 0.05, 0.4}, width = 350, height = 250, font_size = 120, color = {0.03, 0.6, 0.03, 1}, font_color = {1, 1, 1, 1},
            tooltip = "Activate nearest " .. unitData.commandType .. " unit",
            color = {0.03, 0.6, 0.03}
        })
    else

        self.createButton({
            click_function = "standby",
            function_owner = self,
            label = "",
            position = {0, 0.05, 0.4}, width = 350, height = 250,
            font_size = 150,
            tooltip = "No unit of this type left on board",
            color = {0.6, 0.03, 0.03},
            font_color = {1, 1, 1}
        })
    end
end

function standby()
    activated = false
    self.clearButtons()
    clearTemplates()
    forceUnhighlight()

    getEligibleUnit()

    createStandbyButtons()
end
------------------------------------------------- ACTIVATE ------------------------------------------------------------
function activate()
  getEligibleUnit()
  if selectedUnitObj then
    moveDirection = "forward"
    activated = true
    self.clearButtons()
    getSelectedUnitObjVariables()
    setTemplateVariables()

    selectedUnitObj.call("setStartPos")

    highlightUnit(selectedUnitObj.getTable("miniGUIDs"),{0,1,0})
    highlightCard(getObjectFromGUID(selectedUnitObj.getVar("cardGUID")))

    resetButtons()
  else
    standby()
  end
end
------------------------------------------------- ResetButtons------------------------------------------------------------
function resetButtons()
    self.clearButtons()
    if selectedUnitObj then

        self.createButton({
            click_function = "nextUnit",
            function_owner = self,
            label = "NEXT",
            position = {0, 0.2, -1.2},
            width = 550,
            height = 350,
            font_size = 150,
            tooltip = "Toggle between " .. selectedUnitObj.getName() .. " Units",
            font_color = {0,0,0},
            color = {1, 0.9946, 0, 1}
        })

        self.createButton({
            click_function = "initMove",
            function_owner = self,
            label = "  MOVE",
            position = {1.7, 0.2, 0.4},
            width = 750,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {0.9167, 0.9167, 0.9167, 1},
            tooltip = "Spawn movement templates. Unit leader spawns cohesion rulers when moved"
        })

        self.createButton({
            click_function = "aim",
            function_owner = self,
            label = "A",
            position = {-2, 0.2, -0.4},
            width = 370,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {0, 0.8705, 0.0941, 1},
            tooltip = "Take an Aim token",
            alignment = 2
        })

        self.createButton({
            click_function = "attack",
            function_owner = self,
            label = "  ATTACK",
            position = {1.6, 0.2, 1.2},
            width = 850,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {1, 0, 0, 1},
            tooltip = "Draw Attack Die or Spawn Range Rulers"
        })

        self.createButton({
            click_function = "dodge",
            function_owner = self,
            label = "D",
            position = {-1.1, 0.2, -0.4},
            width = 370,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {0, 0.8705, 0.0941, 1},
            tooltip = "Take a Dodge token"
        })

        self.createButton({
            click_function = "overwatch",
            function_owner = self,
            label = "ST",
            position = {-2, 0.2, 0.4},
            width = 370,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {0.65, 0.65, 0.65, 1},
            tooltip = "Take a Standby token"
        })

        self.createButton({
            click_function = "surge",
            function_owner = self,
            label = "SU",
            position = {-1.1, 0.2, 0.4},
            width = 370,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {0, 0.8705, 0.0941, 1},
            tooltip = "Take a Surge token"
        })

        self.createButton({
            click_function = "initDeploy",
            function_owner = self,
            label = "DEPLOY",
            position = {-1.6, 0.2, 1.2},
            width = 850,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {0, 0.8705, 0.0941, 1},
            tooltip = "Start a Deploy Move"
        })

        self.createButton({
            click_function = "resetActivation",
            function_owner = self,
            label = "X            ",
            position = {-1.6, 0.2, -1.2},
            width = 850,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {1, 0.9135, 0, 1},
            tooltip = "Cancel",
        })

        self.createButton({
            click_function = "endActivation",
            function_owner = self,
            label = "END",
            position = {0, 0.2, 1.2},
            width = 550,
            height = 350,
            font_size = 150,
            color = {0.7, 0.03, 0.03, 1},
            font_color = {1, 1, 1, 1},
            tooltip = "End your Activation",
        })

        self.createButton({
            click_function = "toggleCohesionRuler",
            function_owner = self,
            label = "COHESION", position = {1.6, 0.2, -1.2}, width = 850, height = 350, font_size = 150, color = {0, 0, 0, 1}, font_color = {0.4709, 0.9759, 0.9162, 1},
            tooltip = "Spawn Cohesion Rulers"
        })

        self.createButton({
            click_function = "targetingMode",
            function_owner = self,
            label = "  RANGE",
            position = {1.7, 0.2, -0.4},
            width = 750,
            height = 350,
            font_size = 150,
            color = {0, 0, 0, 1},
            font_color = {0.4709, 0.9759, 0.9162, 1},
            tooltip = "Spawn Range Rulers"
        })
    end
end

function toggleCohesionRuler()
    if not rulerOn then
        selectedUnitObj.call("spawnCohesionRuler", selectedUnitObj)
        rulerOn = true
    else
        selectedUnitObj.call("clearCohesionRuler")
        rulerOn = false
    end

end

------------------------------------------------- NEXTUNIT ------------------------------------------------------------
function nextUnit()
    local out = false
    local originalUnitNumber = selectedUnitNumber
    while out == false do
        -- ++ selection
        selectedUnitNumber = selectedUnitNumber + 1
        -- loop selection
        if selectedUnitNumber > eligibleUnitsNumber then
            selectedUnitNumber = 1
        end
        -- check if back to originalUnitNumber
        if selectedUnitNumber == originalUnitNumber then
            out = true
            if selectedUnitObj == nil then
                standby()
            end
        else
            -- examine nil status
            if eligibleUnits[selectedUnitNumber] then
                clearTint()
                stopUnit()
                stopAttack()
                selectedUnitObj = eligibleUnits[selectedUnitNumber]

                selectedUnitObj.call("setStartPos")
                highlightUnit(selectedUnitObj.getTable("miniGUIDs"),{0,1,0})
                highlightCard(getObjectFromGUID(selectedUnitObj.getVar("cardGUID")))
                getSelectedUnitObjVariables()
                setTemplateVariables()
                out = true
            end
        end


    end

end

function clearTint()
    unhighlightEnemies()

    if selectedUnitObj then
        unhighlightUnit(selectedUnitObj.getTable("miniGUIDs"))
        unHighlightCard(getObjectFromGUID(selectedUnitObj.getVar("cardGUID")))
    end
end
------------------------------------------------- MOVE UNIT ------------------------------------------------------------
function initMove()
    initPos = selectedUnitObj.getPosition()
    initRot = selectedUnitObj.getRotation()
    selectedUnitObj.call("setStartPos")
    moveUnit(false)
end

function initDeploy()
    initPos = selectedUnitObj.getPosition()
    initRot = selectedUnitObj.getRotation()
    selectedUnitObj.call("setStartPos")   
    moveUnit(true)
end


function moveUnit(isDeploy)
    local startOffset = 0.0
    if isDeploy and isDeploy == true then
        local baseSize = unitData.baseSize
        startOffset = templateInfo.deployMod[baseSize]
    end
    stopAttack()
    resetButtons()
    clearTemplates()
    selectedUnitObj.setVar("moveState", true)
    self.editButton({
        index = 1,
        click_function = "stopUnit",
        label = "  DONE",
        color = {0.7, 0.03, 0.03},
        font_color = {1, 1, 1}
    })
    lockUnitsExcept(selectedUnitObj, "MoveInProgress")

    ------------------------------------------- PLACEMENT MATH -------------------------------------------
    basePos = selectedUnitObj.getPosition()
    basePos.y = basePos.y + 0.05
    baseRot = selectedUnitObj.getRotation()

    if moveDirection == "backward" then
        baseRot.y = baseRot.y + 180

    elseif moveDirection == "left" then
        baseRot.y = baseRot.y - 90
    elseif moveDirection == "right" then
        baseRot.y = baseRot.y + 90
    end

    local q = math.rad(baseRot.y)
    local a = (unitData.aStart + startOffset) * math.cos(q)
    local b = (unitData.aStart + startOffset) * math.sin(q)

    ------------------------------------------- SPAWN TEMPLATES -------------------------------------------

    local modelTemplateA = getObjectFromGUID(templateInfo.modelTemplateAGUID)

    templateA = spawnObject({
        type = "Custom_AssetBundle",
        position = {basePos.x - b, basePos.y, basePos.z - a},
        rotation = {0, baseRot.y + 180, 0},        
        scale = {1,1,1}
    })
    templateA.setCustomObject({
        type = 0,
        assetbundle = templateInfo.moveTemplate[unitData.selectedSpeed].longBundle,
        assetbundle_secondary = templateInfo.moveTemplate[unitData.selectedSpeed].sharedBundle,
        material = 1,
    })

    templateA.mass = 0.0

    local templateLuaScriptA = "unitInfo = {}\nunitInfo.baseSize = '"..unitData.baseSize.."'\nunitInfo.selectedSpeed = "..unitData.selectedSpeed.."\n"..modelTemplateA.getLuaScript()

    templateA.setLuaScript(templateLuaScriptA)
    templateA.sticky = false
    templateA.setName("Movement Template (A)")
    templateA.setColorTint(templateInfo.moveTemplate[unitData.selectedSpeed].colorTint)

    local modelTemplateB = getObjectFromGUID(templateInfo.modelTemplateBGUID)

    templateB = spawnObject({
        type = "Custom_AssetBundle",
        position = {basePos.x - b, basePos.y, basePos.z - a},
        rotation = {0, baseRot.y, 0},
        --make the second bit a tiny bit taller to stop zfighting at the joint
        scale = {1,1.1,1}
    })
    templateB.setCustomObject({
        type = 0,
        assetbundle = templateInfo.moveTemplate[unitData.selectedSpeed].shortBundle,
        assetbundle_secondary = templateInfo.moveTemplate[unitData.selectedSpeed].sharedBundle,
        material = 1
    })

    templateB.mass = 0.0

    local templateLuaScriptB = "unitInfo = {}\nunitInfo.baseSize = '"..unitData.baseSize.."'\nunitInfo.selectedSpeed = "..unitData.selectedSpeed.."\n"..modelTemplateB.getLuaScript()

    templateB.setLuaScript(templateLuaScriptB)
    templateB.sticky = false
    templateB.setName("Movement Template (B)")
    templateB.setColorTint(templateInfo.moveTemplate[unitData.selectedSpeed].colorTint)

    -- SET VALUES

    templateA.setTable("basePos", basePos)
    templateA.setTable("baseRot", baseRot)
    templateA.setVar("templateB", templateB)

    local fixedMove = false
    if isDeploy then
        fixedMove = true
    else
        fixedMove = unitData.baseSize ~= "small"
    end
    templateA.setLock(fixedMove)

    templateB.setTable("basePos", basePos)
    templateB.setTable("baseRot", baseRot)
    templateB.setVar("templateA", templateA)
    templateB.setLock(false)

    templateA.setVar("isDeploy", isDeploy)

    local maxMoveBundles = getMovementLinks()
    local baseSizeMoveBundles = maxMoveBundles[unitData.baseSize]
    local maxMoveTemplateBundleToSpawn = baseSizeMoveBundles[unitData.selectedSpeed]

    if isDeploy == false then
        --max movement ring projector
        if maxMoveTemplateBundleToSpawn ~= nil then
            maxMoveTemplate = spawnObject({
                type = "Custom_AssetBundle",
                position = {basePos.x, basePos.y + 20, basePos.z},
                rotation = {0, basePos.y, 0},
                scale = {0,0,0} -- 0 scale will hide TTS default box and won't impact projector
            })

            maxMoveTemplate.setCustomObject({
                type = 0,
                assetbundle = maxMoveTemplateBundleToSpawn
            })

            maxMoveTemplate.setLock(true)
            maxMoveTemplate.use_gravity = false
            maxMoveTemplate.setName("Maximum Move")
        end
    end
    ------------------------------------------- SPAWN BUTTON -------------------------------------------


    local data = {click_function = "INSERT_FUNCTION", function_owner = self, label = "1", position = {3, 0.2, -0.4}, width = 300, height = 350, font_size = 200, tooltip = "1"}

    self.createButton({
        click_function = "changeSpeed1",
        function_owner = self,
        label = "1", position = {3, 0.2, -0.4}, width = 300, height = 350, font_size = 200,
        tooltip = "Move Speed 1",
        color = {1, 1, 1},
        font_color = {0, 0, 0}
    })

    self.createButton({
        click_function = "changeSpeed2",
        function_owner = self,
        label = "2", position = {3, 0.2, 0.4}, width = 300, height = 350, font_size = 200, color = {0, 0, 0, 1}, font_color = {1, 1, 1, 1},
        tooltip = "Move Speed 2"
    })
    self.createButton({
        click_function = "changeSpeed3",
        function_owner = self,
        label = "3",
        position = {3, 0.2, 1.2}, width = 300, height = 350, font_size = 200, color = {0.8103, 0.0857, 0.0857, 1}, font_color = {1, 1, 1, 1},
        tooltip = "Move Speed 3"
    })
    if fixedMove then

        if true then -- TODO: Is it worth enforcing this? "unitData.strafeMove" 

              self.createButton({
                  click_function = "moveForward",
                  function_owner = self,
                  label = "F",
                  position = {3, 0.200000002980232, -1.2}, width = 300, height = 350, font_size = 200,
                  tooltip = "Move Forwards",
                  color = {1, 1, 0},
                  font_color = {0, 0, 0}
              })
              self.createButton({
                  click_function = "moveBackwards",
                  function_owner = self,
                  label = "B",
                  position = {3.8, 0.2, -1.2}, width = 300, height = 350, font_size = 200,
                  tooltip = "Move Backwards",
                  color = {1, 1, 0},
                  font_color = {0, 0, 0}
              })
              self.createButton({
                  click_function = "moveLeft",
                  function_owner = self,
                  label = "L",
                  position = {4.6, 0.2, -1.2}, width = 300, height = 350, font_size = 200,
                  tooltip = "Strafe Left",
                  color = {1, 1, 0},
                  font_color = {0, 0, 0}
              })
              self.createButton({
                  click_function = "moveRight",
                  function_owner = self,
                  label = "R",
                  position = {5.4, 0.2, -1.2}, width = 300, height = 350, font_size = 200,
                  tooltip = "Strafe Right",
                  color = {1, 1, 0},
                  font_color = {0, 0, 0}
              })

        else
              self.createButton({
                  click_function = "moveBackwards",
                  function_owner = self,
                  label = "B",
                  position = {3, 0.200000002980232, -1.2}, width = 300, height = 350, font_size = 200,
                  tooltip = "Move Backwards",
                  color = {1, 1, 0},
                  font_color = {0, 0, 0}
              })

              if moveDirection == "backward" then
                  self.editButton({
                      index = 13,
                      click_function = "moveForward",
                      label = "F",
                      tooltip = "Move Forwards"
                  })
              end
        end



    end

    self.createButton({
        click_function = "moveFull",
        function_owner = self,
        label = "FULL",
        position = {4.2, 0.2, 1.2}, width = 700, height = 350, font_size = 200, color = {0, 0, 0, 1}, font_color = {0.0551, 0.9312, 0, 1},
        tooltip = "Execute Full Move"
    })


    self.createButton({
        click_function = "moveStart",
        function_owner = self,
        label = "START",
        position = {4.2, 0.2, 0.4}, width = 700, height = 350, font_size = 200, color = {0, 0, 0, 1}, font_color = {0, 0.9294, 0.8752, 1},
        tooltip = "Move back to start position"
    })

end
------------------------------------------------- MOVE BACK------------------------------------------------------------

function moveFull()
    if templateB then
        local startPos = templateB.getPosition()
        local startRot = templateB.getRotation()
        local endOffset = unitData.baseSize == "small" and templateInfo.deployMod.small or 0.0
        local endPos = translatePos(startPos, startRot, unitData.aStart + endOffset, 0)
        endPos.y = endPos.y + 2

        local endRot = startRot
        if moveDirection == "backward" then
            endRot.y = endRot.y + 180
        elseif moveDirection == "left" then
            endRot.y = endRot.y + 90
        elseif moveDirection == "right" then
            endRot.y = endRot.y - 90
        end

        selectedUnitObj.setPositionSmooth(endPos, false, false)
        selectedUnitObj.setRotationSmooth(startRot, false, false)
        Wait.frames(function()
          selectedUnitObj.call("checkVelocity")
        end)
    end
end


function moveStart()
    local endPos = initPos
    endPos.y = initPos.y + 2
    selectedUnitObj.setPositionSmooth(endPos, false, false)
    selectedUnitObj.setRotationSmooth(initRot, false, false)
    Wait.frames(function()
        selectedUnitObj.call("checkVelocity")
    end)
end

function moveBackwards()
    self.editButton({
        index = 11,
        click_function = "moveForward",
        label = "F",
        tooltip = "Move Forwards"
    })
    moveDirection = "backward"
    moveUnit()
end

function moveForward()
    self.editButton({
        index = 11,
        click_function = "moveBackwards",
        label = "B",
        tooltip = "Move Backwards"
    })
    moveDirection = "forward"
    moveUnit()
end

function moveLeft()
    moveDirection = "left"
    moveUnit()
end

function moveRight()
    moveDirection = "right"
    moveUnit()
end

------------------------------------------------- stop UNIT ------------------------------------------------------------
function stopUnit()
    -- destroy templates
    selectedUnitObj.call("printMovement")
    selectedUnitObj.call("setStartPos")
    self.clearButtons()
    clearTemplates()
    resetButtons()
    unhighlightEnemies()
    unlockAllUnits("MoveInProgress")
end

------------------------------------------------- Clear templates------------------------------------------------------------
function clearTemplates()
    clearMovementTemplates()
    clearRangeRulers()
    clearCohesionRulers()
end

function clearMovementTemplates()
    if templateA ~= nil then
        destroyObject(templateA)
    end
    if templateB ~= nil then
        destroyObject(templateB)
    end
    if maxMoveTemplate ~= nil then
        destroyObject(maxMoveTemplate)
    end
end

function clearCohesionRulers()
    if selectedUnitObj then
        selectedUnitObj.setVar("moveState", false)
        selectedUnitObj.call("clearCohesionRuler")
    end
end

function clearAttackLine()
    if attackLine then
        for k, attackLineObj in pairs(attackLine) do
            destroyObject(attackLine[k])
        end
        attackLine = nil
    end
end


------------------------------------------------- CHANGESPEED------------------------------------------------------------
function changeSpeed1()
    unitData.selectedSpeed = 1
    setTemplateVariables()
    clearTemplates()
    moveUnit()
end

function changeSpeed2()
    unitData.selectedSpeed = 2
    setTemplateVariables()
    clearTemplates()
    moveUnit()
end

function changeSpeed3()
    unitData.selectedSpeed = 3
    setTemplateVariables()
    clearTemplates()
    moveUnit()
end
------------------------------------------------- AIM------------------------------------------------------------
function aim()
    basePos = selectedUnitObj.getPosition()
    baseRot = selectedUnitObj.getRotation()

    local q = math.rad(baseRot.y)
    local a = 1 * math.cos(q)
    local b = 1 * math.sin(q)

    local tokenPosition = {basePos.x + b, basePos.y + 1, basePos.z + a}
    local tokenRotation = {0, baseRot.y, 0}

    aimBag = getObjectFromGUID(Global.getVar("aimBagGUID"))
    aimBag.takeObject({
        position = tokenPosition,
        rotation = tokenRotation
    })

end

------------------------------------------------- dodge------------------------------------------------------------
function dodge()
    basePos = selectedUnitObj.getPosition()
    baseRot = selectedUnitObj.getRotation()

    local q = math.rad(baseRot.y + 50)
    local a = 1 * math.cos(q)
    local b = 1 * math.sin(q)

    local tokenPosition = {basePos.x + b, basePos.y + 1, basePos.z + a}
    local tokenRotation = {0, baseRot.y - 30, 0}

    aimBag = getObjectFromGUID(Global.getVar("dodgeBagGUID"))
    aimBag.takeObject({
        position = tokenPosition,
        rotation = tokenRotation
    })

end

------------------------------------------------- overwatch------------------------------------------------------------
function overwatch()
    basePos = selectedUnitObj.getPosition()
    baseRot = selectedUnitObj.getRotation()

    local q = math.rad(baseRot.y - 50)
    local a = 1 * math.cos(q)
    local b = 1 * math.sin(q)

    local tokenPosition = {basePos.x + b, basePos.y + 1, basePos.z + a}
    local tokenRotation = {0, baseRot.y, 0}

    aimBag = getObjectFromGUID(Global.getVar("standbyBagGUID"))
    aimBag.takeObject({
        position = tokenPosition,
        rotation = tokenRotation
    })

end

------------------------------------------------- surge------------------------------------------------------------
function surge()
    basePos = selectedUnitObj.getPosition()
    baseRot = selectedUnitObj.getRotation()

    local q = math.rad(baseRot.y - 50)
    local a = 1 * math.cos(q)
    local b = 1 * math.sin(q)

    local tokenPosition = {basePos.x + b, basePos.y + 1, basePos.z + a}
    local tokenRotation = {0, baseRot.y, 0}

    aimBag = getObjectFromGUID(Global.getVar("surgeBagGUID"))
    aimBag.takeObject({
        position = tokenPosition,
        rotation = tokenRotation
    })

end


------------------------------------------------- attack------------------------------------------------------------
function attack()
    clearTemplates()
    resetButtons()
    self.editButton({
        index = 3,
        click_function = "stopAttack",
        function_owner = self,
        label = "     DONE",
        color = {0.7, 0.03, 0.03},
        font_color = {1, 2, 1}
    })
    attackMode()
end

function targetingMode()
    if not enemyHighlighted then
        exitAttackMode()
        highlightEnemies()
        spawnRangeRuler(selectedUnitObj)
        enemyHighlighted = true
        resetRangeButtons()
    else
        exitTargetingMode()
    end
end

function attackMode()
    if not attackModeOn then
        exitTargetingMode()
        highlightEnemies()
        spawnRangeRuler(selectedUnitObj)
        attackModeOn = true
        resetTargetingButtons()
    else
        exitTargetingMode()
    end
end

function exitTargetingMode()
    enemyHighlighted = false
    attackModeOn = false
    clearRangeRulers()
    unhighlightEnemies()
    clearAttackLine()
end

function exitAttackMode()
    enemyHighlighted = false
    attackModeOn = false
    clearRangeRulers()
    unhighlightEnemies()
end

function resetRangeButtons()
    enemyLeaders = getEnemyUnits()

    for _, leader in pairs(enemyLeaders) do
        createRangeButton(leader)
    end
end

function resetTargetingButtons()
    enemyLeaders = getEnemyUnits()

    for _, leader in pairs(enemyLeaders) do
        createAttackButton(leader)
        createRangeButton(leader)
    end
end

function attackMenu(attackTargetObj)
    unhighlightEnemies()
    highlightEnemy(attackTargetObj)
    clearRangeRulers()

    -- this used to be configurable per unit type, which meant that we made the
    -- ion/wound/suppression buttons vertically higher to make up for variable
    -- height minis.
    --
    -- it's possible we can use the actual collider height of the mini in the
    -- future in order to tune this.
    local buttonHeight = attackTargetObj.getVar("height") or 2


    _G["addIon"..self.getGUID()] = function() addIon(attackTargetObj) end
    _G["addWound"..self.getGUID()] = function() addWound(attackTargetObj) end
    _G["addSuppression"..self.getGUID()] = function() addSuppression(attackTargetObj) end

    attackTargetObj.createButton({
        click_function = "addIon"..self.getGUID(), function_owner = self, label = "I", position = {-0.9, buttonHeight, 0}, rotation = {0, 180, 0}, scale = {0.5, 0.5, 0.5}, width = 700, height = 700, font_size = 500, color = {0, 0.1711, 1, 1}, tooltip = "I"
    })
    attackTargetObj.createButton({
        click_function = "addWound"..self.getGUID(), function_owner = self, label = "W", position = {0.9, buttonHeight, 0}, rotation = {0, 180, 0}, scale = {0.5, 0.5, 0.5}, width = 700, height = 700, font_size = 500, color = {1, 0, 0, 1}, tooltip = "W"
    })
    attackTargetObj.createButton({
        click_function = "addSuppression"..self.getGUID(), function_owner = self, label = "S", position = {0, buttonHeight, 0}, rotation = {0, 180, 0}, scale = {0.5, 0.5, 0.5}, width = 700, height = 700, font_size = 500, color = {1, 0.8723, 0, 1}, tooltip = "S"
    })

    -- create attack lines
    local enemyMinis = attackTargetObj.getTable("miniGUIDs")

    attackLine = {}
    n = 1

    for k, guidEntry in pairs(enemyMinis) do
        local obj = getObjectFromGUID(guidEntry)

        if obj then
            if obj.getPosition().z <18.1 and obj.getPosition().z > -18.1 and obj.getPosition().x < 44.1 and obj.getPosition().x > -28.1 then
                attackLine[n] = spawnAttackLine(selectedUnitObj, obj)
                n = n + 1
            end
        end
    end

end

function addSuppression(selectedSuppressionObj)
    local suppressionPos = selectedSuppressionObj.getPosition()
    suppressionPos.y = suppressionPos.y + 1
    suppressionBag = getObjectFromGUID(Global.getVar("suppressionBagGUID"))
    suppressionBag.takeObject({
        position = suppressionPos,
        rotation = selectedSuppressionObj.getRotation()
    })
end

function addWound(selectedWoundObj)
    local woundPos = selectedWoundObj.getPosition()
    woundPos.y = woundPos.y + 1
    woundBag = getObjectFromGUID(Global.getVar("woundBagGUID"))

    woundPos = translatePos(woundPos,selectedWoundObj.getRotation(),1, 0)

    woundBag.takeObject({
        position = woundPos,
        rotation = selectedWoundObj.getRotation()
    })
end

function addIon(selectedIonObj)
    local ionPos = selectedIonObj.getPosition()
    ionPos.y = ionPos.y + 1
    ionBag = getObjectFromGUID(Global.getVar("ionBagGUID"))

    ionPos = translatePos(ionPos,selectedIonObj.getRotation(),1, 180)

    ionBag.takeObject({
        position = ionPos,
        rotation = selectedIonObj.getRotation()
    })
end

function spawnAttackLine(aOriginObj,aTargetObj)

        distance = getDistance(aOriginObj,aTargetObj)

        local spawnPos = aOriginObj.getPosition()
        spawnPos.y = spawnPos.y+0.22
        local spawnRot = getAngle(aOriginObj,aTargetObj)
        spawnRot.y = spawnRot.y +180
        spawnRot.x = spawnRot.x
        spawnRot.z = spawnRot.z

        attackLineObj = spawnObject({
            type = "Custom_Model",
            position = spawnPos,
            rotation = spawnRot,
            scale = {1,1,distance}
        })
        attackLineObj.setCustomObject({
            type = 0,
            mesh = templateInfo.attackLineMesh,
            collider = "https://steamusercontent-a.akamaihd.net/ugc/785234780862865411/C2B5E8CA63651BE485909340212736C0A68C2754/",
            material = 1,
        })
        attackLineObj.setLock(true)
        attackLineObj.setColorTint({1,0,0})
        attackLineObj.setName("Range Ruler")

        attackLineObj.setRotation(spawnRot)
        attackLineObj.setPosition(spawnPos)

        Wait.frames(function() attackLineObj.setRotation(spawnRot) attackLineObj.setPosition(spawnPos) end, 10)

        return attackLineObj
end

function getAngle(originObj, angleTargetObj)
    --local localVector = originObj.positionToLocal(angleTargetObj.getPosition())
    local aTargetPos = angleTargetObj.getPosition()
    local originPos = originObj.getPosition()

    local localVector = {
          x = aTargetPos.x - originPos.x,
          y = aTargetPos.y - originPos.y,
          z = aTargetPos.z - originPos.z}


    local q = math.deg(math.atan2(localVector.x, localVector.z))

    local c = math.sqrt((localVector.x * localVector.x) + (localVector.z * localVector.z))

    local q2 = math.deg(math.atan2(localVector.y, c))

    -- set rotation and rotation
    return {x=q2,y=q,z=0}
end

function createAttackButton(leaderObj)
    local buttonHeight = leaderObj.getVar("height") or 2

    _G["attackMenu"..leaderObj.getGUID()] = function() attackMenu(leaderObj) end

    local data = {click_function = "attackMenu"..leaderObj.getGUID(), function_owner = self, label = "ATTACK", position = {0, buttonHeight, -0.9}, rotation = {0, 180, 0}, scale = {0.5, 0.5, 0.5}, width = 1800, height = 700, font_size = 400, color = {1, 0, 0, 1}, font_color = {0, 0, 0, 1}}

    leaderObj.createButton(data)
end

function isMiniOnTable(mini, allUnits)
    for _, check in pairs(allUnits) do
      if check == mini then
        return true
      end
    end
    return false
  end

function createRangeButton(leaderObj)
    local selectedUnitObjUnitName = selectedUnitObj.getVar("unitName")
    local allUnitsOnTable = battlefieldZone.getObjects()
    local enemyBaseSize = leaderObj.getVar("baseSize")
    local enemyMinis = leaderObj.getTable("miniGUIDs")
    local lowestDistance = 99
    for k, guidEntry in pairs(enemyMinis) do
        local obj = getObjectFromGUID(guidEntry)

        if obj and isMiniOnTable(obj, allUnitsOnTable) then
            distance = getDistance(selectedUnitObj, obj)
            if distance < lowestDistance then
                lowestDistance = distance
            end
        end
    end

    lowestDistance = lowestDistance - templateInfo.baseRadius[enemyBaseSize]/2 - templateInfo.baseRadius[enemyBaseSize]/2

    finalRange = math.ceil(lowestDistance/6)
    if finalRange > 4 then
        finalRange = ">4"
    end

    local buttonHeight = leaderObj.getVar("height") or 2
    local data = {click_function = "dud", function_owner = self, label = finalRange, position = {0, buttonHeight, 0}, rotation = {0, 180, 0}, scale = {0.5, 0.5, 0.5}, width = 900, height = 700, font_size = 500, color = {1, 1, 0, 1}, font_color = {0, 0, 0, 1}}

    leaderObj.createButton(data)
end

function dud()
end

function highlightEnemies()
  for _, leader in ipairs(getEnemyUnits()) do
    highlightEnemy(leader)
  end
end

function highlightEnemy(leader)
  local enemyID = leader.getVar("unitID")
  local enemyMinis = leader.getTable("miniGUIDs")
  highlightUnit(enemyMinis, highlightTints[enemyID])
end

function unhighlightEnemies()
  for _, leader in ipairs(getEnemyUnits()) do
    local enemyID = leader.getVar("unitID")
    local enemyMinis = leader.getTable("miniGUIDs")
    unhighlightUnit(enemyMinis)
    leader.call("resetUnitButtons")
  end
end

function getEnemyUnits()
  local miniObjs = {}
  local allUnits = battlefieldZone.getObjects()

  for _, obj in pairs(allUnits) do
    if obj.getVar("isAMini") == true and obj.getVar("colorSide") ~= unitData.colorSide then
      table.insert(miniObjs, obj)
    end
  end

  return miniObjs
end


function stopAttack()
    exitTargetingMode()
    stopUnit()
end


------------------------------------------------- end UNIT ------------------------------------------------------------

function endActivation()
    resetActivation()
    self.flip()
end

function resetActivation()
    stopUnit()
    stopAttack()
    standby()
end

function getDistance(originObj, targetObj)
  local originPos = originObj.getPosition()
  local targetPos = targetObj.getPosition()

  -- set the y-value for each position to 0 to ignore height differences
  originPos:set(nil, 0, nil)
  targetPos:set(nil, 0, nil)
  
  return Vector.distance(originPos, targetPos)
end


function allUnitLeaders()
   local unitLeaders = nil
   unitLeaders = {}
   local leaderCount = 1
   local allUnits = nil
   local allUnits = battlefieldZone.getObjects()

   if allUnits ~= nil then
      for i, unit in pairs(allUnits) do
         local miniData = unit.getTable("unitData")
         local isAMini = unit.getVar("isAMini")
         if miniData and miniData.commandType then
            if isAMini == true then
               unitLeaders[leaderCount] = unit
               leaderCount = leaderCount + 1
            end
         end
      end
   end
   return unitLeaders
end

function lockUnitsExcept(exceptionUnit, lockName)
   local unitLeaders = allUnitLeaders()

   if unitLeaders ~= nil then
      for i, unit in pairs(unitLeaders) do
         if unit ~= exceptionUnit then
            unit.call("tryAddLock", lockName)
         end
      end
   end
end

function unlockAllUnits(lockName)
   local unitLeaders = allUnitLeaders()

   if unitLeaders ~= nil then
      for i, unit in pairs(unitLeaders) do
         unit.call("tryRemoveLock", lockName)
      end
   end
end
