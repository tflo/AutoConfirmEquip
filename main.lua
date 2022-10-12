-- Optional Config Begin -------------------------------------------------------

local maxQuality = 2 -- Max quality allowed to equip without confirmation

-- Optional Config End ---------------------------------------------------------

-- Quality levels:
-- 0: Poor (gray) -- 1: Common (white) -- 2: Uncommon (green)
-- 3: Rare (blue) -- 4: Epic (purple)  -- 5: Legendary (orange)
-- 6: Artifact    -- 7: Heirloom       -- 8: WoWToken

--------------------------------------------------------------------------------

local f = CreateFrame 'frame'
f:RegisterEvent 'EQUIP_BIND_CONFIRM'
f:SetScript('OnEvent', function(self, event, slot)
	if (GetCursorInfo()) == 'item' then
		if tonumber(format('%3$s', GetItemInfo(format('%3$s', GetCursorInfo())))) <= maxQuality then
			EquipPendingItem(slot)
		end
	end
end)


--[[ Notes =====================================================================

	Inspired by:
	https://www.mmo-champion.com/threads/2000469-Legion-wardrobe-equipping-add-
	on-suggestion#4

============================================================================]]--

--[[ License ===================================================================

	Copyright © 2022 Thomas Floeren

	This file is part of AutoConfirmEquip.

	AutoConfirmEquip is free software: you can redistribute it and/or modify it
	under the terms of the GNU General Public License as published by the Free
	Software Foundation, either version 3 of the License, or (at your option)
	any later version.

	AutoConfirmEquip is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
	or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
	more details.

	You should have received a copy of the GNU General Public License along with
	AutoConfirmEquip. If not, see <https://www.gnu.org/licenses/>.

============================================================================]]--
