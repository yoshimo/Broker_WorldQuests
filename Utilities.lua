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

function BWQ:FormatTimeLeftString(minutes)
	local timeLeftStr = ""
	if minutes <= 0 then return "" end

	local days = math.floor(minutes / 1440)
	local hours = math.floor((minutes % 1440) / 60)
	local mins = minutes % 60
  
	if days > 0 then
		timeLeftStr = string.format("%dd %dh", days, hours)
	elseif hours > 0 then
		timeLeftStr = string.format("%dh %dm", hours, mins)
	else
		timeLeftStr = string.format("%dm", mins)
	end

	if 		minutes <= 120 then timeLeftStr = string.format("|cffD96932%s|r", timeLeftStr)
	elseif 	minutes <= 240 then timeLeftStr = string.format("|cffDBA43B%s|r", timeLeftStr)
	elseif 	minutes <= 480 then timeLeftStr = string.format("|cffE6D253%s|r", timeLeftStr)
	elseif 	minutes <= 960 then timeLeftStr = string.format("|cffE6DA8E%s|r", timeLeftStr)
	end

	return timeLeftStr
end