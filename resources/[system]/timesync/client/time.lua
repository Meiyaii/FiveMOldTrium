RegisterNetEvent("ts:timesync")
AddEventHandler("ts:timesync", function(h, m, s)
	NetworkOverrideClockTime(h, m, s)
--	print("event reçu h:" .. h .. " m:" .. m .. " s:" .. s)
end)