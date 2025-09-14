-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright (c) 2022-2025 Thomas Floeren

local addon_name, a = ...
autoconfirmequip_database = autoconfirmequip_database or {}

local _
local CreateFrame = _G.CreateFrame
local GetCursorInfo = _G.GetCursorInfo
local tonumber = _G.tonumber
local format = _G.format
local EquipPendingItem = _G.EquipPendingItem
local ipairs = _G.ipairs
local GetItemInfo = _G.GetItemInfo
local strtrim = _G.strtrim
local gmatch = _G.gmatch

local C_ACEQ = '\124cff2196f3'
local C_KW = '\124cnORANGE_FONT_COLOR:'
local C_EMPH = '\124cnYELLOW_FONT_COLOR:'
local MSG_PREFIX = C_ACEQ .. "Auto-Confirm Equip\124r:"

local quality_names = {
	[0] = 'Poor',
	[1] = 'Common',
	[2] = 'Uncommon',
	[3] = 'Rare',
	[4] = 'Epic',
	[5] = 'Legendary',
	[6] = 'Artifact',
	[7] = 'Heirloom',
	[8] = 'WoWToken',
}

local quality_colors = {
	[0] = '\124cnITEM_POOR_COLOR:',
	[1] = '\124cnWHITE_FONT_COLOR:',
	[2] = '\124cnUNCOMMON_GREEN_COLOR:',
	[3] = '\124cnRARE_BLUE_COLOR:',
	[4] = '\124cnITEM_EPIC_COLOR:',
	[5] = '\124cnITEM_LEGENDARY_COLOR:',
	[6] = '\124cnITEM_ARTIFACT_COLOR:',
	[7] = '\124cnHEIRLOOM_BLUE_COLOR:',
	[8] = '\124cnITEM_WOW_TOKEN_COLOR:',
}


local ef = CreateFrame 'frame'
ef:RegisterEvent 'ADDON_LOADED'
ef:RegisterEvent 'EQUIP_BIND_CONFIRM'

ef:SetScript('OnEvent', function(self, event, ...)
	if event == 'ADDON_LOADED' then
		if ... == addon_name then
			ef:UnregisterEvent 'ADDON_LOADED'
			a.db = autoconfirmequip_database
			a.db.qualities_allowed = a.db.qualities_allowed or { 0, 2, 3, 7 }
		end
	else
		local slot = ...
		if (GetCursorInfo()) == 'item' then
			local itemquality = tonumber(format('%3$s', GetItemInfo(format('%3$s', GetCursorInfo()))))
			for _, v in ipairs(a.db.qualities_allowed) do
				if itemquality == v then
					EquipPendingItem(slot)
					return
				end
			end
		end
	end
end)

local function allowed_to_prettystr()
	local str = ''
	for _, v in ipairs(a.db.qualities_allowed) do
		str = format('%s(%s%s\124r)%2$s%4$s\124r, ', str, quality_colors[v], v, quality_names[v])
	end
	return strtrim(str, ' ,')
end

local function all_qualities_to_prettystr()
	local str = ''
	for q = 0, 8 do
		str = format('%s(%s%s\124r)%2$s%4$s\124r - ', str, quality_colors[q], q, quality_names[q])
	end
	return strtrim(str, ' -')
end

local function cleanup(sortedtable)
	local result = {}
	for k, v in ipairs(sortedtable) do
-- 		v= tonumber(v)
		if v >= 0 and v <= 8 and v ~= sortedtable[k + 1] then tinsert(result, v) end
	end
	return result
end

SLASH_AUTOCONFIRMEQUIP1, SLASH_AUTOCONFIRMEQUIP2 = '/aceq', '/autoconfirmequip'

function SlashCmdList.AUTOCONFIRMEQUIP(msg)
	if strfind(msg, '%d') then
		local t = {}
		for d in string.gmatch(msg, '%d') do
			tinsert(t, tonumber(d))
		end
		sort(t)
		t = cleanup(t)
		if #t >=1 then
			a.db.qualities_allowed = t
			print(MSG_PREFIX,
				'Allowed qualities are now:\n' .. allowed_to_prettystr() .. '.'
			)
		else
			print(MSG_PREFIX,
				'No valid quality numbers entered. Could not build a new table, the previous quality table will be used instead.'
			)
		end
	else
		if msg == '' then
			print(MSG_PREFIX,
				'Currently allowed qualities:\n' .. allowed_to_prettystr() .. '.'
				.. '\nTo change this, type ' .. C_KW .. '/aceq\124r followed by the quality number(s) where you don\'t want to see the equip confirmation dialog. \nFor example: ' .. C_KW .. '/aceq 0123\124r allows qualities 0 (gray) through 3 (blue). ' .. C_KW .. '/aceq 2\124r allows only quality 2 (green), ' .. C_KW .. '/aceq 02\124r allows only quality 0 (gray) and quality 2 (green), and so on.'
			)
			print(MSG_PREFIX,
				'Here a list of all qualities:\n' .. all_qualities_to_prettystr() .. '.'
			)
		end
	end
end

-- Quality levels:
-- 0: Poor (gray) -- 1: Common (white) -- 2: Uncommon (green)
-- 3: Rare (blue) -- 4: Epic (purple)  -- 5: Legendary (orange)
-- 6: Artifact    -- 7: Heirloom       -- 8: WoWToken



--[[ Notes =====================================================================

	Inspired by:
	https://www.mmo-champion.com/threads/2000469-Legion-wardrobe-equipping-add-
	on-suggestion#4

============================================================================]]--
