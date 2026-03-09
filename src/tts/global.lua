-- Global.lua
-- ==========================================
-- CONFIGURATION
-- ==========================================
local CONFIG = {
    zones = {
        Red = "523d2e",
        Blue = "60f39f"
    },
    factionBags = {
        emp_all = "14b7bd",
        reb_all = "74755a",
        rep_all = "ee97d9",
        sep_all = "ee97d9",
        generic = "f0b81c" -- Used for minor factions
    },
    spawnHeight = 5, -- How high above the zone to drop the units
    shakenBag = "a25e12"
}

-- ==========================================
-- UI TOGGLE LOGIC
-- ==========================================
local isMenuOpen = false

function toggleImporterMenu(player, value, id)
    isMenuOpen = not isMenuOpen
    
    if isMenuOpen then
        UI.setAttribute("ArmyImporterPanel", "active", "true")
        UI.setAttribute("ToggleImporterBtn", "color", "#f44336") -- Changes to red when open
        UI.setAttribute("ToggleImporterBtn", "text", "Close Menu")
    else
        UI.setAttribute("ArmyImporterPanel", "active", "false")
        UI.setAttribute("ToggleImporterBtn", "color", "#4CAF50") -- Changes back to green
        UI.setAttribute("ToggleImporterBtn", "text", "List Import")
    end
end

-- ==========================================
-- CORE IMPORTER LOGIC
-- ==========================================
local currentJSONString = ""

function onJSONInputChanged(player, value, id)
    currentJSONString = value
end

function onClickClearZone(player, value, id)
    local spawnZoneGUID = CONFIG.zones[player.color]
    if spawnZoneGUID then
        local spawnZone = getObjectFromGUID(spawnZoneGUID)
        if spawnZone then
            for _, obj in ipairs(spawnZone.getObjects()) do
                -- Prevent the script from deleting the physical table or the zone itself
                if obj.type ~= "Surface" and obj.type ~= "Board" and obj ~= spawnZone then
                    obj.destruct()
                end
            end
            broadcastToColor("Deployment zone cleared.", player.color, "Green")
        end
    end
end

function onClickImport(player, value, id)
    -- Use the tracking variable instead of UI.getAttribute
    local jsonString = currentJSONString
    
    if jsonString == nil or jsonString == "" then
        broadcastToColor("Import Error: Please paste a JSON string first.", player.color, "Red")
        return
    end

    -- Attempt to decode the JSON
    local success, armyData = pcall(function() return JSON.decode(jsonString) end)

    if not success or armyData == nil then
        broadcastToColor("Import Error: Invalid JSON format. Please check your web builder output.", player.color, "Red")
        return
    end

    -- Validate it is a Regiment list
    if not armyData.metadata or not armyData.metadata.faction_id then
        broadcastToColor("Import Error: JSON is missing Regiment metadata.", player.color, "Red")
        return
    end

    -- Determine Spawn Zone based on Player Color
    local spawnZoneGUID = CONFIG.zones[player.color]
    if spawnZoneGUID == nil or spawnZoneGUID == "" or string.find(spawnZoneGUID, "TODO") then
        broadcastToColor("Import Error: Spawn zone not configured for player color " .. player.color, player.color, "Red")
        return
    end

    local spawnZone = getObjectFromGUID(spawnZoneGUID)
    if spawnZone == nil then
        broadcastToColor("Import Error: Could not find spawn zone object on the table.", player.color, "Red")
        return
    end

    -- Clear the UI input and announce success
    UI.setAttribute("JSONInput", "text", "")
    broadcastToColor("Successfully parsed list for " .. armyData.metadata.faction_name, player.color, "Green")

    -- Trigger the Spawner
    spawnArmy(armyData, spawnZone, player.color)
end

-- ==========================================
-- DESCRIPTION FORMATTERS
-- ==========================================
function buildUnitDescription(unit)
    local desc = ""
    
    desc = desc .. "Min Move: " .. (unit.mv_min and (unit.mv_min .. '"') or "N/A") .. "\n"
    desc = desc .. "Max Move: " .. (unit.mv and (unit.mv .. '"') or "N/A") .. "\n"
    desc = desc .. "Ranged Attack: " .. (unit.atk_ranged and (unit.atk_ranged .. " Dice") or "N/A") .. "\n"
    desc = desc .. "Melee Attack: " .. (unit.atk_melee and (unit.atk_melee .. " Dice") or "N/A") .. "\n"
    desc = desc .. "Short Range: " .. (unit.rng_short and (unit.rng_short .. '"') or "N/A") .. "\n"
    desc = desc .. "Long Range: " .. (unit.rng_long and (unit.rng_long .. '"') or "N/A") .. "\n"
    desc = desc .. "Wounds: " .. (unit.wnd or "N/A") .. "\n"
    desc = desc .. "Save: " .. (unit.sv or "N/A") .. "\n"
    
    if unit.keywords and #unit.keywords > 0 then
        desc = desc .. "Keywords: " .. table.concat(unit.keywords, ", ")
    end
    
    return desc
end

-- ==========================================
-- INJECTION SCRIPT TEMPLATE
-- ==========================================
local BASE_SCRIPT_TEMPLATE = [=[
unitInstanceId = "%s"
maxWounds = %d
currentWounds = %d
targetWorldHeight = %f
isShaken = false
buttonsVisible = false
hideTime = 0

function onLoad()
    self.setVar("tts_height", targetWorldHeight)
    self.createButton({ click_function="subWound", function_owner=self, label="-", position={0, 0, 0}, width=0, height=0, font_size=0, color={1,0.2,0.2}, font_color={1,1,1} })
    self.createButton({ click_function="doNothing", function_owner=self, label=tostring(currentWounds).."/"..tostring(maxWounds), position={0, 0, 0}, width=0, height=0, font_size=0, font_color={1,1,1}, color={0,0,0,0.85} })
    self.createButton({ click_function="addWound", function_owner=self, label="+", position={0, 0, 0}, width=0, height=0, font_size=0, color={0.2,0.8,0.2}, font_color={1,1,1} })
    self.createButton({ click_function="toggleShakenLocal", function_owner=self, label="Shaken", position={0, 0, 0}, width=0, height=0, font_size=0, color={0.5,0.5,0.5}, font_color={1,1,1} })
end

function showButtons()
    buttonsVisible = true
    
    local yOffset = targetWorldHeight / self.getScale().y
    
    self.editButton({index=0, position={-0.65, yOffset, 0}, width=250, height=250, font_size=150})
    self.editButton({index=1, position={0, yOffset, 0}, width=400, height=250, font_size=120})
    self.editButton({index=2, position={0.65, yOffset, 0}, width=250, height=250, font_size=150})
    self.editButton({index=3, position={0, yOffset, 0.5}, width=600, height=200, font_size=100})
end

function hideButtons()
    buttonsVisible = false
    for i=0,3 do self.editButton({index=i, position={0, 0, 0}, width=0, height=0, font_size=0}) end
end

function onHover(player_color)
    hideTime = Time.time + 1.2
    if not buttonsVisible then showButtons() end
end

function onUpdate()
    if buttonsVisible and Time.time > hideTime then hideButtons() end
end

function subWound() hideTime = Time.time + 1.2; Global.call("syncUnitWounds", {unitId = unitInstanceId, newWounds = currentWounds - 1}) end
function addWound() hideTime = Time.time + 1.2; Global.call("syncUnitWounds", {unitId = unitInstanceId, newWounds = currentWounds + 1}) end
function toggleShakenLocal() hideTime = Time.time + 1.2; Global.call("syncShakenStatus", {unitId = unitInstanceId, shaken = not isShaken}) end
function doNothing() end
function setWounds(val) currentWounds = val; self.editButton({index=1, label=tostring(currentWounds).."/"..tostring(maxWounds)}) end
function setShakenState(state) isShaken = state; self.editButton({index=3, color=state and {1,0.9,0.2} or {0.5,0.5,0.5}, font_color=state and {0,0,0} or {1,1,1}}) end
]=]

-- ==========================================
-- CORE SPAWNER
-- ==========================================
function spawnArmy(armyData, spawnZone, playerColor)
    local originPos = spawnZone.getPosition()
    local scale = spawnZone.getScale()
    
    -- Calculate grid limits based on the zone's width
    local startX = originPos.x - (scale.x / 2) + 2
    local rightEdgeX = originPos.x + (scale.x / 2) - 2
    
    local currentPos = {x = startX, y = originPos.y + 2, z = originPos.z}
    local unitSpacing = 4
    
    local tintPalette = {
        {r=1, g=1, b=1},       -- 1st: White (Default)
        {r=1, g=0.2, b=0.2},   -- 2nd: Red
        {r=0.2, g=0.2, b=1},   -- 3rd: Blue
        {r=0.1, g=0.54, b=0.1},   -- 4th: Green
        {r=1, g=1, b=0.2},     -- 5th: Yellow
        {r=0.8, g=0.2, b=0.8},  -- 6th: Purple
        {r=1, g=0.5, b=0},     -- 7th: Orange
        {r=0.2, g=0.8, b=0.8},  -- 8th: Cyan
        {r=0.5, g=0.2, b=0}     -- 9th: Brown
    }
    
    local unitInstanceCounts = {}

    -- Spawn Combat Units
    if armyData.units then
        for _, unit in ipairs(armyData.units) do
            local description = buildUnitDescription(unit)
            
            if not unitInstanceCounts[unit.id] then
                unitInstanceCounts[unit.id] = 0
            end

            for q = 1, unit.quantity do
                unitInstanceCounts[unit.id] = unitInstanceCounts[unit.id] + 1
                
                local currentUnitId = unit.id .. "_" .. q
                local tintIndex = ((unitInstanceCounts[unit.id] - 1) % #tintPalette) + 1
                local unitTint = tintPalette[tintIndex]

                for b = 1, unit.unit_size do
                    local spawnParams = {
                        type = "Custom_Model",
                        -- Spawns bases side-by-side in a column instead of a vertical tower
                        position = {x = currentPos.x, y = currentPos.y, z = currentPos.z - (b * 1.5)},
                        rotation = {x = 0, y = 0, z = 0}
                    }
                    
                    local spawnedModel = spawnObject(spawnParams)
                    
                    local costString = ""
                    if unit.cost then costString = " [" .. unit.cost .. " pts]" end
                    spawnedModel.setName(unit.name .. costString)
                    spawnedModel.setDescription(description)
                    spawnedModel.setColorTint(unitTint)
                    
                    spawnedModel.setCustomObject({
                        mesh = unit.tts_model or "",
                        diffuse = unit.tts_texture or "",
                        collider = unit.tts_collider or "",
                        type = 1, 
                        material = 1 
                    })

                    local wndStat = unit.wnd or 1
                    local uiHeight = unit.tts_height or 2.0 
                    
                    local injectedScript = string.format(BASE_SCRIPT_TEMPLATE, currentUnitId, wndStat, wndStat, uiHeight)
                    spawnedModel.setLuaScript(injectedScript)
                end
                
                -- Faction Token Logic
                local bagGUID = CONFIG.factionBags[armyData.metadata.faction_id]
                local isGeneric = false
                
                if bagGUID == nil then
                    bagGUID = CONFIG.factionBags.generic
                    isGeneric = true
                end
                
                local tokenBag = getObjectFromGUID(bagGUID)
                if tokenBag then
                    local tokenPos = {x = currentPos.x, y = currentPos.y + 0.5, z = currentPos.z + 4}
                    local token = tokenBag.takeObject({
                        position = tokenPos,
                        smooth = false
                    })
                    
                    if isGeneric then
                        token.setColorTint(Color.fromString(playerColor))
                    end
                else
                    broadcastToColor("Warning: Faction bag not found.", playerColor, "Red")
                end
                
                currentPos.x = currentPos.x + unitSpacing
                
                -- Wrap to a new row if we hit the edge of the spawn zone
                if currentPos.x > rightEdgeX then
                    currentPos.x = startX
                    currentPos.z = currentPos.z - 4
                end
            end
        end
    end

    -- Spawn Support Assets (Leader and OTS) behind the main army
    local supportPos = {x = originPos.x, y = originPos.y + 2, z = originPos.z - 4}

    if armyData.leader and armyData.leader.id then
        local leaderDesc = "Ability: " .. (armyData.leader.ability or "None")
        local leaderObj = spawnObject({
            type = "Custom_Tile",
            position = {x = supportPos.x, y = supportPos.y, z = supportPos.z},
            rotation = {x = 0, y = 0, z = 0}
        })
        
        local leaderCost = ""
        if armyData.leader.cost then leaderCost = " [" .. armyData.leader.cost .. " pts]" end
        leaderObj.setName(armyData.leader.name .. leaderCost)
        leaderObj.setDescription(leaderDesc)
        
        leaderObj.setCustomObject({
            image = armyData.leader.tts_image or "",
            type = 0, 
            thickness = 0.1
        })
        
        supportPos.x = supportPos.x + unitSpacing
    end

    if armyData.ots then
        for _, ots in ipairs(armyData.ots) do
            for q = 1, (ots.quantity or 1) do
                local otsDesc = ""
                otsDesc = otsDesc .. "Availability: " .. (ots.availability or "N/A") .. "\n"
                otsDesc = otsDesc .. "Template: " .. (ots.template or "N/A") .. "\n"
                otsDesc = otsDesc .. "Attack Dice: " .. (ots.attack_dice or "N/A") .. "\n"
                if ots.keywords and #ots.keywords > 0 then
                    otsDesc = otsDesc .. "Keywords: " .. table.concat(ots.keywords, ", ")
                end

                local otsObj = spawnObject({
                    type = "CardCustom",
                    position = {x = supportPos.x, y = supportPos.y, z = supportPos.z},
                    rotation = {x = 0, y = 0, z = 0}
                })
                
                local otsCost = ""
                if ots.cost then otsCost = " [" .. ots.cost .. " pts]" end
                otsObj.setName(ots.name .. otsCost)
                otsObj.setDescription(otsDesc)
                
                otsObj.setCustomObject({
                    face = ots.tts_card_front or "",
                    back = ots.tts_card_front or "",
                    width = 2,
                    height = 3
                })
                
                supportPos.x = supportPos.x + unitSpacing
            end
        end
    end
end

function syncShakenStatus(params)
    local shakenBag = getObjectFromGUID(CONFIG.shakenBag)
    if not shakenBag then return end

    for _, obj in ipairs(getAllObjects()) do
        if obj.getVar("unitInstanceId") == params.unitId then
            obj.call("setShakenState", params.shaken)
            
            if params.shaken then
                local customHeight = obj.getVar("tts_height") or 2.0
                local spawnPos = obj.getPosition()
                spawnPos.y = spawnPos.y + customHeight
                
                local token = shakenBag.takeObject({
                    position = spawnPos,
                    smooth = false
                })
                
                token.setColorTint(Color(1, 1, 1, 0.5)) 
                token.setVar("isShakenTokenFor", params.unitId)
                token.jointTo(obj, {type = "Fixed", collision = false}) 
            else
                for _, t in ipairs(getAllObjects()) do 
                    if t.getVar("isShakenTokenFor") == params.unitId then 
                        t.destruct() 
                    end 
                end
            end
        end
    end
end

function syncUnitWounds(params)
    local allObjects = getAllObjects()
    for _, obj in ipairs(allObjects) do
        if obj.getVar("unitInstanceId") == params.unitId then
            -- Call the local base script to update the wound values and label
            obj.call("setWounds", params.newWounds)
        end
    end
end