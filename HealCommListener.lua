local HealCommUsers = {}

SLASH_HEALCOMMLISTENER1 = "/hcl"
SLASH_HEALCOMMLISTENER2 = "/HCL"
SlashCmdList["HEALCOMMLISTENER"] = function(msg)
	print("HealCommListener: Players need to cast spells while in your group or raid in order to appear in the list.")
	print("/hclreset for flushing the list.")
	print("/hclsave for saving the list to a file.")
	print("Listing players in the HealComm user list:")
	for i,_ in pairs(HealCommUsers) do print(i) end
end

SLASH_HEALCOMMLISTENERRESET1 = "/hclreset"
SLASH_HEALCOMMLISTENERRESET2 = "/HCLRESET"
SlashCmdList["HEALCOMMLISTENERRESET"] = function(msg)
	print("HealCommListener: Players in the list have been flushed. You can also /reload to do this.")
	HealCommUsers = {}
end

SLASH_HEALCOMMLISTENERSAVE1 = "/hclsave"
SLASH_HEALCOMMLISTENERSAVE2 = "/HCLSAVE"
SlashCmdList["HEALCOMMLISTENERSAVE"] = function(msg)
	print("HealCommListener: Players in the list will saved to HealCommListener.lua in your WTF Account and character variables ON LOGOUT!")
	HCUSERLIST = HealCommUsers
end

local HealCommListener = CreateFrame("Frame")
HealCommListener:RegisterEvent("CHAT_MSG_ADDON")
HealCommListener:SetScript("OnEvent", function()
	if arg1 == "HealComm" then
		if HealCommUsers[arg4] == nil then
			HealCommUsers[arg4] = true
		end	
	end
end)