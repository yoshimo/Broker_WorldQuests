local _, addon = ...
local CONSTANTS = addon.CONSTANTS
--==========================================================
-- Utility Functions
--==========================================================
function BWQ:AbbreviateNumber(number)
	number = tonumber(number)
	if number >= 1000000 then
		number = number / 1000000
		return string.format((number % 1 == 0) and "%.0f%s" or "%.1f%s", number, "M")
	elseif number >= 10000 then
		return string.format("%.0f%s", number / 1000, "K")
	end
	
	return number
end

function BWQ:FormatTimeLeftString(timeLeft)
	local timeLeftStr = ""
	
	if timeLeft <= 0 then return "" end
	-- if timeLeft >= 60 * 24 then -- at least 1 day
	-- 	timeLeftStr = string.format("%.0fd", timeLeft / 60 / 24)
	-- end
	if timeLeft >= 60 then -- hours
		timeLeftStr = string.format("%.0fh", math.floor(timeLeft / 60))
	end
	timeLeftStr = string.format("%s%s%sm", timeLeftStr, timeLeftStr ~= "" and " " or "", timeLeft % 60) -- always show minutes

	if 		timeLeft <= 120 then timeLeftStr = string.format("|cffD96932%s|r", timeLeftStr)
	elseif 	timeLeft <= 240 then timeLeftStr = string.format("|cffDBA43B%s|r", timeLeftStr)
	elseif 	timeLeft <= 480 then timeLeftStr = string.format("|cffE6D253%s|r", timeLeftStr)
	elseif 	timeLeft <= 960 then timeLeftStr = string.format("|cffE6DA8E%s|r", timeLeftStr)
	end

	return timeLeftStr
end