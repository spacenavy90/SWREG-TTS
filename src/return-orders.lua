-- Standalone script to return command (order) tokens to their trays
function onload(save_state)
	self.interactable = false
	battlefieldZone = getObjectFromGUID(Global.getVar("battlefieldZoneGUID"))
	commandTokenTrayData = Global.getTable("commandTokenTrayData")
	assetButton = getObjectFromGUID("8fbbf2")
	assetButton.createButton({
		click_function = "returnOrderTokens", function_owner = self, label = "", position = {0, 0.65, 0}, scale = {1, 1, 0.7}, width = 1500, height = 2000, font_size = 400, color = {0.7573, 0.7573, 0.7573, 0.01}, font_color = {0, 0, 0, 100}, tooltip = "Return all Command Tokens to the respective trays"
	})
	assetButton.setColorTint({0,0,0.7})
end

function returnOrderTokens()
	assetButton.AssetBundle.playTriggerEffect(0)
	local allObjects = battlefieldZone.getObjects()
	local commandNumber = 1
	if allObjects then
		for i, obj in pairs(allObjects) do
			if obj.getVar("isAToken") == true then
				local unitData = obj.getTable("unitData")
				local commandTray = getObjectFromGUID(commandTokenTrayData[unitData.colorSide][unitData.commandType])
				local pos = commandTray.getPosition()
				pos.y = pos.y + 0.5 +(0.2 * commandNumber)
				local rot = commandTray.getRotation()
				obj.setPositionSmooth(pos, false, false)
				obj.setRotationSmooth(rot, false, false)
				commandNumber = commandNumber + 1
			end
		end
	end
end
