local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

--WINDOW

local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "SIRIUS", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 })


 -- ANTI-CHEAT BYPASSED

 Rayfield:Notify({
    Title = "Anti-Cheat bypassed",
    Content = "We have bypassed the Anti-Cheat",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })


 --TABS

 local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image

 local GamePlayTab = Window:CreateTab("GamePlay", 4483362458) -- Title, Image

 
 --FUNCTIONS

 local Slider = PlayerTab:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 10000},
	Increment = 10,
	Suffix = "WalkSpeed",
	CurrentValue = 16,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(s)
		game.Players.LocalPlayer.character.Humanoid.WalkSpeed = s
	end,
})

local Slider = PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {0, 5000},
    Increment = 10,
    Suffix = "JumpPower",
    CurrentValue = 10,
    Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(a)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
 })


 local Toggle = GamePlayTab:CreateToggle({
    Name = "Toggle AutoSpeed/XP",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        while wait() do
            local args = {
                [1] = "collectOrb",
                [2] = "Red Orb",
                [3] = "Magma City"
            }
            
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            
            
    end,
 })



 local Toggle = GamePlayTab:CreateToggle({
    Name = "Toggle AutoGem",
    CurrentValue = false,
    Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        while wait() do
            local args = {
                [1] = "collectOrb",
                [2] = "Gem",
                [3] = "Magma City"
            }
            
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            
    end,
 })


