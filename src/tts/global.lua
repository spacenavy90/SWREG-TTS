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
        generic = "f0b81c" 
    },
    otsBack = "https://images.swarmada.wiki/images/offensive-retro-rear.webp",
    missionBack = "https://images.swarmada.wiki/images/objective-rear.webp",
    factionCardBacks = {
        emp_all = "https://images.swarmada.wiki/images/empire-squadron-rear.webp",
        reb_all = "https://images.swarmada.wiki/images/rebel-squadron-rear.webp",
        rep_all = "https://images.swarmada.wiki/images/republic-squadron-rear.webp",
        sep_all = "https://images.swarmada.wiki/images/separatist-squadron-rear.webp",
        generic = "https://images.swarmada.wiki/images/objective-rear.webp"
    },
    spawnHeight = 5,
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
        UI.setAttribute("ToggleImporterBtn", "color", "#f44336")
        UI.setAttribute("ToggleImporterBtn", "text", "Close Menu")
    else
        UI.setAttribute("ArmyImporterPanel", "active", "false")
        UI.setAttribute("ToggleImporterBtn", "color", "#4CAF50")
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
    -- 1. Clear the physical deployment zone
    local spawnZoneGUID = CONFIG.zones[player.color]
    if spawnZoneGUID then
        local spawnZone = getObjectFromGUID(spawnZoneGUID)
        if spawnZone then
            for _, obj in ipairs(spawnZone.getObjects()) do
                if obj.type ~= "Surface" and obj.type ~= "Board" and obj ~= spawnZone then
                    obj.destruct()
                end
            end
        end
    end

    -- 2. Clear the player's hand
    local handObjects = Player[player.color].getHandObjects()
    if handObjects then
        for _, obj in ipairs(handObjects) do
            obj.destruct()
        end
    end

    broadcastToColor("Deployment zone and hand cleared.", player.color, "Green")
end

function onClickImport(player, value, id)
    local jsonString = currentJSONString
    
    if jsonString == nil or jsonString == "" then
        broadcastToColor("Import Error: Please paste a JSON string first.", player.color, "Red")
        return
    end

    local success, armyData = pcall(function() return JSON.decode(jsonString) end)

    if not success or armyData == nil then
        broadcastToColor("Import Error: Invalid JSON format. Please check your web builder output.", player.color, "Red")
        return
    end

    if not armyData.metadata or not armyData.metadata.faction_id then
        broadcastToColor("Import Error: JSON is missing Regiment metadata.", player.color, "Red")
        return
    end

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

    UI.setAttribute("JSONInput", "text", "")
    broadcastToColor("Successfully parsed list for " .. armyData.metadata.faction_name, player.color, "Green")

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
    desc = desc .. "Courage: " .. (unit.courage or "N/A") .. "\n"
    desc = desc .. "Save: " .. (unit.sv or "N/A") .. "\n"
    
    if unit.keywords and #unit.keywords > 0 then
        desc = desc .. "Keywords: " .. table.concat(unit.keywords, ", ")
    end
    return desc
end

function buildOTSDescription(ots)
    local desc = "Category: " .. (ots.category or "Support") .. "\n"
    desc = desc .. "Shape: " .. (ots.shape or "N/A") .. "\n"
    desc = desc .. "Duration: " .. (ots.duration or "Instant") .. "\n\n"
    
    if ots.details then
        desc = desc .. "MECHANICS:\n"
        for k, v in pairs(ots.details) do
            local cleanKey = string.gsub(k, "_", " ")
            cleanKey = string.gsub(cleanKey, "^%l", string.upper)
            desc = desc .. "- " .. cleanKey .. ": " .. tostring(v) .. "\n"
        end
        desc = desc .. "\n"
    end

    if ots.modifier_keywords and #ots.modifier_keywords > 0 then
        desc = desc .. "Keywords: " .. table.concat(ots.modifier_keywords, ", ") .. "\n\n"
    end

    desc = desc .. "ABILITY:\n" .. (ots.ability_text or "No text provided.")
    return desc
end

function buildMissionDescription(msn)
    local desc = "Category: " .. (msn.category or "Scenario") .. "\n\n"
    desc = desc .. "SETUP:\n" .. (msn.setup or "Standard setup.") .. "\n\n"
    desc = desc .. "SCORING:\n" .. (msn.scoring or "Standard scoring.") .. "\n\n"
    desc = desc .. "VICTORY:\n" .. (msn.victory or "Most VPs wins.") .. "\n\n"
    desc = desc .. "SPECIAL RULES:\n" .. (msn.special_rules or "None.")
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
courageValue = %d
isShaken = false
buttonsVisible = false
hideTime = 0

function onLoad()
    self.setVar("tts_height", targetWorldHeight)
    self.createButton({ click_function="subWound", function_owner=self, label="-", position={0, 0, 0}, width=0, height=0, font_size=0, color={1,0.2,0.2}, font_color={1,1,1} })
    self.createButton({ click_function="doNothing", function_owner=self, label=tostring(currentWounds).."/"..tostring(maxWounds), position={0, 0, 0}, width=0, height=0, font_size=0, font_color={1,1,1}, color={0,0,0,0.85} })
    self.createButton({ click_function="addWound", function_owner=self, label="+", position={0, 0, 0}, width=0, height=0, font_size=0, color={0.2,0.8,0.2}, font_color={1,1,1} })
    self.createButton({ click_function="toggleShakenLocal", function_owner=self, label="Shaken", position={0, 0, 0}, width=0, height=0, font_size=0, color={0.5,0.5,0.5}, font_color={1,1,1} })
    self.createButton({ click_function="doNothing", function_owner=self, label="C: "..tostring(courageValue), position={0, 0, 0}, width=0, height=0, font_size=0, font_color={1,1,1}, color={0,0,0,0} })
end

function showButtons()
    buttonsVisible = true
    local yOffset = targetWorldHeight / self.getScale().y
    self.editButton({index=0, position={-0.65, yOffset, 0}, width=250, height=250, font_size=150})
    self.editButton({index=1, position={0, yOffset, 0}, width=400, height=250, font_size=120})
    self.editButton({index=2, position={0.65, yOffset, 0}, width=250, height=250, font_size=150})
    self.editButton({index=3, position={0, yOffset, 0.5}, width=600, height=200, font_size=100})
    self.editButton({index=4, position={0, yOffset, -0.5}, width=400, height=200, font_size=100})
end

function hideButtons()
    buttonsVisible = false
    for i=0,4 do self.editButton({index=i, position={0, 0, 0}, width=0, height=0, font_size=0}) end
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
    
    local startX = originPos.x - (scale.x / 2) + 2
    local rightEdgeX = originPos.x + (scale.x / 2) - 2
    local currentPos = {x = startX, y = originPos.y + 2, z = originPos.z}
    local unitSpacing = 4

    local tintPalette = {
        {r=1, g=1, b=1}, {r=1, g=0.2, b=0.2}, {r=0.2, g=0.2, b=1},
        {r=0.1, g=0.54, b=0.1}, {r=1, g=1, b=0.2}, {r=0.8, g=0.2, b=0.8},
        {r=1, g=0.5, b=0}, {r=0.2, g=0.8, b=0.8}, {r=0.5, g=0.2, b=0}
    }
    local unitInstanceCounts = {}
    
    -- 1. Spawn Combat Units
    if armyData.units then
        for _, unit in ipairs(armyData.units) do
            local description = buildUnitDescription(unit)
            if not unitInstanceCounts[unit.id] then unitInstanceCounts[unit.id] = 0 end

            for q = 1, unit.quantity do
                unitInstanceCounts[unit.id] = unitInstanceCounts[unit.id] + 1
                local currentUnitId = unit.id .. "_" .. q
                local unitTint = tintPalette[((unitInstanceCounts[unit.id] - 1) % #tintPalette) + 1]

                for b = 1, unit.unit_size do
                    if unit.tts_model and unit.tts_model ~= "" then
                        local spawnedModel = spawnObject({
                            type = "Custom_Model",
                            position = {x = currentPos.x, y = currentPos.y, z = currentPos.z - (b * 1.5)},
                            rotation = {x = 0, y = 0, z = 0}
                        })
                        spawnedModel.setName(unit.name .. " [" .. unit.cost .. " pts]")
                        spawnedModel.setDescription(description)
                        spawnedModel.setColorTint(unitTint)
                        spawnedModel.setCustomObject({
                            mesh = unit.tts_model,
                            diffuse = unit.tts_texture or "",
                            collider = unit.tts_collider or "",
                            type = 1, material = 1 
                        })
                        spawnedModel.setLuaScript(string.format(BASE_SCRIPT_TEMPLATE, currentUnitId, unit.wnd or 1, unit.wnd or 1, unit.tts_height or 2.0, unit.courage or 0))
                    end
                end

                -- Spawn Initiative Token
                local bagGUID = CONFIG.factionBags[armyData.metadata.faction_id] or CONFIG.factionBags.generic
                local tokenBag = getObjectFromGUID(bagGUID)
                if tokenBag then
                    local token = tokenBag.takeObject({ position = {x = currentPos.x, y = currentPos.y + 0.5, z = currentPos.z + 4}, smooth = false })
                    if bagGUID == CONFIG.factionBags.generic then token.setColorTint(Color.fromString(playerColor)) end
                end

                currentPos.x = currentPos.x + unitSpacing
                if currentPos.x > rightEdgeX - 6 then 
                    currentPos.x = startX
                    currentPos.z = currentPos.z - 4
                end
            end
        end
    end

    -- 2. Leader Row (Top Right)
    local layoutZ = originPos.z + (scale.z / 2) - 2
    local layoutX = originPos.x + (scale.x / 2) - 2

    if armyData.leader and armyData.leader.id then
        local leader = armyData.leader
        local leaderDesc = "Ability: " .. (leader.ability or "None")
        if leader.restriction_text and leader.restriction_text ~= "" then leaderDesc = leaderDesc .. "\nRestriction: " .. leader.restriction_text end

        if leader.tts_model and leader.tts_model ~= "" then
            local leaderObj = spawnObject({ type = "Custom_Model", position = {layoutX, originPos.y + 2, layoutZ}, rotation = {0,180,0} })
            leaderObj.setName(leader.name .. " [" .. (leader.cost or 0) .. " pts]")
            leaderObj.setDescription(leaderDesc)
            leaderObj.setCustomObject({ mesh = leader.tts_model, diffuse = leader.tts_texture or "", type = 1, material = 1 })
            layoutX = layoutX - 4
        elseif leader.tts_image and leader.tts_image ~= "" then
            local leaderObj = spawnObject({ type = "Custom_Tile", position = {layoutX, originPos.y + 2, layoutZ}, rotation = {0,180,0} })
            leaderObj.setName(leader.name .. " [" .. (leader.cost or 0) .. " pts]")
            leaderObj.setDescription(leaderDesc)
            leaderObj.setCustomObject({ image = leader.tts_image, type = 0, thickness = 0.1, material = 1 })
            layoutX = layoutX - 4
        end

        if leader.tts_card_front and leader.tts_card_front ~= "" then
            local ldrCard = spawnObject({ type = "CardCustom", position = {layoutX, originPos.y + 2, layoutZ}, rotation = {0,180,0}, scale = {1.25, 1.0, 1.25} })
            ldrCard.setName(leader.name .. " Card")
            ldrCard.setDescription(leaderDesc)
            ldrCard.setCustomObject({ face = leader.tts_card_front, back = CONFIG.factionCardBacks[armyData.metadata.faction_id] or CONFIG.factionCardBacks.generic })
            layoutX = layoutX - 4
        end
    end

    -- 3. Mission Row (Resetting X, Shifting Z Down)
    layoutX = originPos.x + (scale.x / 2) - 2 
    layoutZ = layoutZ - 6                    

    if armyData.missions then
        for _, msn in ipairs(armyData.missions) do
            if msn.tts_card_front and msn.tts_card_front ~= "" then
                local msnObj = spawnObject({ 
                    type = "CardCustom", 
                    position = {layoutX, originPos.y + 2, layoutZ}, 
                    rotation = {0,180,180}, -- Facedown
                    scale = {1.65, 1.0, 1.65} 
                })
                msnObj.setName(msn.name)
                msnObj.setDescription(buildMissionDescription(msn))
                msnObj.setCustomObject({ face = msn.tts_card_front, back = CONFIG.missionBack })
                layoutX = layoutX - 4
            end
        end
    end

    -- 4. OTS (Deal to Hand)
    if armyData.ots then
        local otsPos = {x = originPos.x - 5, y = originPos.y + 3, z = originPos.z - 10}
        for _, ots in ipairs(armyData.ots) do
            for q = 1, (ots.quantity or 1) do
                if ots.tts_card_front and ots.tts_card_front ~= "" then
                    local otsObj = spawnObject({ type = "CardCustom", position = otsPos, rotation = {0,180,0}, scale = {1.25, 1.0, 1.25} })
                    otsObj.setName(ots.name .. " [" .. (ots.cost or 0) .. " pts]")
                    otsObj.setDescription(buildOTSDescription(ots))
                    otsObj.setCustomObject({ face = ots.tts_card_front, back = CONFIG.otsBack })
                    Wait.frames(function() if otsObj then otsObj.deal(1, playerColor) end end, 2)
                end
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
            obj.call("setWounds", params.newWounds)
        end
    end
end