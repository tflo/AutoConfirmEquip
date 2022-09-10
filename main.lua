--[ Config Begin ]--------------------------------------------------------------

local maxQuality = 2 -- Max quality allowed to equip without confirmation

--[ Config End ]----------------------------------------------------------------

-- Quality levels:
-- 0: Poor (gray) -- 1: Common (white) -- 2: Uncommon (green)
-- 3: Rare (blue) -- 4: Epic (purple)  -- 5: Legendary (orange)
-- 6: Artifact    -- 7: Heirloom       -- 8: WoWToken

--------------------------------------------------------------------------------

local f = CreateFrame('frame')
f:RegisterEvent('EQUIP_BIND_CONFIRM')
f:SetScript('OnEvent',
	function(self, event, slot)
		if (GetCursorInfo()) == 'item' then
			if tonumber(format('%3$s', GetItemInfo(format('%3$s',GetCursorInfo())))) <= maxQuality then
				EquipPendingItem(slot)
			end
		end
	end
)


-- Inspired by: https://www.mmo-champion.com/threads/2000469-Legion-wardrobe-equipping-add-on-suggestion#4
