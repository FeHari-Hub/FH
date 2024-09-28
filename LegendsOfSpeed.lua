local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Smart Ui | By superaceCZ",
	LoadingTitle = "Smart Technologies",
	LoadingSubtitle = "by superaceCZ",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Non",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Hello"
	}
})

local Tab = Window:CreateTab("Auto-win", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Winning")


local Button = Tab:CreateButton({
	Name = "Auto Play",
	Callback = function()
		local teleportPart = workspace.Lobby.Trampoline.Frame
		repeat
		wait(5)
		game.Players.LocalPlayer.Character:MoveTo(teleportPart.Position)
		until false
		-- The function that takes place when the button is pressed
	end,
})


local Tab = Window:CreateTab("Ultility", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
	Name = "Teleport Away",
	Callback = function()
		local teleportPart = workspace.Lobby.Trampoline.Frame
		game.Players.LocalPlayer.Character:MoveTo(teleportPart.Position)-- The function that takes place when the button is pressed
	end,
})

local Button = Tab:CreateButton({
	Name = "Anti-Water death",
	Callback = function()
		workspace.Map.Classic.Water:Destroy()
		workspace.WaterPart:Destroy()-- The function that takes place when the button is pressed
	end,
})
