local _G = _G
local _achievement = CreateFrame("Frame")
_G.passive_achievements.Kromgrul = _achievement

-- General info
_achievement.name = "Kromgrul"
_achievement.title = "Taking Back the Ring"
_achievement.class = "All"
_achievement.icon_path = "Interface\\Addons\\Hardcore\\Media\\icon_kromgrul.blp"
_achievement.level_cap = 51
_achievement.quest_num = 3822
_achievement.quest_name = "Krom'Grul"
_achievement.zone = "Burning Steppes"
_achievement.kill_target = "Krom'Grul"
_achievement.bl_text = "Burning Steppes Quest"
_achievement.description = HCGeneratePassiveAchievementKillDescription(_achievement.kill_target, _achievement.quest_name, _achievement.zone, _achievement.level_cap, "Horde")
_achievement.restricted_game_versions = {
	["WotLK"] = 1,
}

-- Registers
function _achievement:Register(succeed_function_executor)
	_achievement:RegisterEvent("QUEST_TURNED_IN")
	_achievement.succeed_function_executor = succeed_function_executor 
end

function _achievement:Unregister()
	_achievement:UnregisterEvent("QUEST_TURNED_IN")
end

-- Register Definitions
_achievement:SetScript("OnEvent", function(self, event, ...)
	local arg = { ... }
	HCCommonPassiveAchievementKillCheck(_achievement, event, arg)
end)