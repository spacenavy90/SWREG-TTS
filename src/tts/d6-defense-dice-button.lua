--Runs on load, creates button and makes sure the lockout is off
function onload()
    self.interactable = true
    data = {click_function = "buttonPress", function_owner = self, label = "",
    position = {0, 0.65, 0}, width = 1400, height = 1400, font_size = 1100, color = {1,1,1,0.01},
    font_color = {0.7692, 0, 0, 100}, tooltip = "Spawn D6 Defense Dice", alignment = 3}

    self.createButton(data)
    dieRollerInfo = Global.getTable("dieRollerInfo")
    
    dieRoller = getObjectFromGUID(dieRollerInfo.blueDieRollerGUID)
    dieRoller = getObjectFromGUID(dieRollerInfo.redDieRollerGUID)
end


function buttonPress()
    self.AssetBundle.playTriggerEffect(0)
    dieRoller.call("spawnDefenseDie")
end
