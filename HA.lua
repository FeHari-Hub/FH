warn("Haridade - LOS ⚡ // Injected")
print("Haridade - LOS ⚡ // Executed by "..identifyexecutor())

local PlayerService = game:GetService("Players").LocalPlayer

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Haridade | Legends Of Speed ⚡",
	LoadingTitle = "Haridade Script",
	LoadingSubtitle = "Feito Por HA_FeHari",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Haridade - LOS ⚡"
	},
        Discord = {
        	Enabled = false,
        	Invite = "", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
})

Rayfield:Notify({
    Title = "Haridade - LOS ⚡",
    Content = "Sucesso! Script Carregado!",
    Duration = 6.5,
    Image = 97581810621748,
    Actions = { -- Notification Buttons
        Ignore = {
            Name = "Ok!",
            Callback = function()
                print("O usuários tocou em Ok!")
            end
		},
	},
})

local Tab = Window:CreateTab("Início", 112625488111718) -- Title, Image
local Section = Tab:CreateSection("Importante!")
local Label = Tab:CreateLabel("Para Melhor Funcionamento, Recomendamos Os Seguintes Executores:")
local Section = Tab:CreateSection("INFO")
local Label = Tab:CreateLabel("Fluxus Executor (recomendado)")
local Label = Tab:CreateLabel("Delta Executor")
local Label = Tab:CreateLabel("Codex Executor")

local Tab = Window:CreateTab("Teleportar", 109334924659404) -- Title, Image
Section:Set("Executores | Roblox :")
local Dropdown = Tab:CreateDropdown({
    Name = "Selecionar Cidade Para Teleportar",
    Options = {"Main City", "Snow City", "Magma City", "Legends Highway"},
    CurrentOption = "Main City",
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file
    Callback = function(Value)
        SelectCity(Value)
    end,
})
local Button = Tab:CreateButton({
	Name = "💎 Lunar Hub by LunaR_nicK",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarHub/Source.lua"))()
	-- The function that takes place when the button is pressed
	end,
})

local Button = Tab:CreateButton({
	Name = "💎 Quadra by xkid (limited games)",
	Callback = function()
		-- TYPE OR DIE : xkid#1299
-- If you liked the script please like it on scriptblox :)
loadstring(game:HttpGet("https://raw.githubusercontent.com/notxkid/typeordiescript/main/main.lua"))()-- The function that takes place when the button is pressed
	end,
})

local Button = Tab:CreateButton({
	Name = "Ez hub by Cottient (limited games)",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()-- The function that takes place when the button is pressed
	end,
})

local Label = Tab:CreateLabel("❌ Script may not work")

local Label = Tab:CreateLabel("This section is still developing!")

local Tab = Window:CreateTab("Script for games", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
	Name = "DOORS: Custom guiding light,jumpscares etc. by StupidProArsenal",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/StupidProAArsenal/main/main/deer%20customs',true))()-- The function that takes place when the button is pressed
	end,
})

local Button = Tab:CreateButton({
	Name = "FLY RACE: Versus Airline by ROBLOXYGENESIS",
	Callback = function()
		loadstring(game:HttpGet("https://versus-airlines.cf/V3/Loader.lua"))()-- The function that takes place when the button is pressed
	end,
})

local Button = Tab:CreateButton({
	Name = "PSX: Project WB by ROBLOXGENESIS",
	Callback = function()
		getgenv().key = "projectWBIsAwesomemrcrapcrappypattt"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Main.lua"))()
---key from https://discord.gg/u7JNWQcgsU-- The function that takes place when the button is pressed
	end,
})

local Button = Tab:CreateButton({
	Name = "DIG TO CHINA: script by TangleMangle (Poster,not owner)",
	Callback = function()
		local player = game.Players.LocalPlayer.Character
while wait(2) do
 player.HumanoidRootPart.CFrame = game.Workspace.ChinaDetector.CFrame
   local teleportservice = game:GetService("TeleportService")
teleportservice:Teleport(game.PlaceId)
 end-- The function that takes place when the button is pressed
	end,
})

local Label = Tab:CreateLabel("All scripts are from scriptblox.com")
local Label = Tab:CreateLabel("Some might are patched or don't work.")
local Label = Tab:CreateLabel("We work to add more!")
local Tab = Window:CreateTab("Player", 6961018899) -- Title, Image
local Label = Tab:CreateLabel("Executor: "..identifyexecutor())
local Button = Tab:CreateButton({
	Name = "Request full player data to console",
	Callback = function()
		print("SmartHub // Printing all info")-- The function that takes place when the button is pressed
		-- Username : 

print("UserName : "..game.Players.LocalPlayer.Name)

-- Display Name : 

print("Display Name : "..game.Players.LocalPlayer.DisplayName)

-- UserId : 

print("UserId : "..game.Players.LocalPlayer.UserId)

-- Profil Link : 

print("Profil Link : ".."roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile")

-- Country : 

print("Country : "..game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer))

-- Language : 

print("Language : "..game.Players.LocalPlayer.LocaleId)

-- Account Age In Days : 

print("Days Old : "..game.Players.LocalPlayer.AccountAge)

-- Account Age Years : 

print("Years Old : "..math.floor(game.Players.LocalPlayer.AccountAge/365*100)/(100))

-- Executor : 

print("Executor : "..identifyexecutor())

-- IsPremium : 

player = game.Players.LocalPlayer
if player.MembershipType == Enum.MembershipType.Premium then
    print("Premium : true")
        else
    print("Premium : False")
end

-- Friends Count :

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://friends.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId.."/friends/count"
})
.Body)
print("Friends Count : "..response.count)

-- Get Description :

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://users.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId
})
.Body)
print("Description : ".."'"..response.description.."'")

-- Following count :

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://friends.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId.."/followings/count"
})
.Body)
print("Followings Count  : "..response.count)

-- Followers Count :

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://friends.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId.."/followers/count"
})
.Body)
print("Followers : "..response.count)

-- Account Creation Date :

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://users.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId
})
.Body)
print("Account Creation Date : "..response.created)

-- Has Verified Badge :

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://users.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId
})
.Body)
print("Verified Badge : "..tostring(response.hasVerifiedBadge))

-- Device :

local UserInputService = game:GetService("UserInputService")
local dev = 'Device'

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	print(dev.." : Mobile")
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	print(dev.." : Computer")
elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	print(dev.." : Computer With TouchScreen")
end

-- Ping : 

print("Ping : "..game.Players.LocalPlayer:GetNetworkPing() * (1000).." ms")

-- Ip :

local req = http_request or request or (syn and syn.request) 
print("Ip : "..req({ Url = "https://api.ipify.org/", Method = "Get" }).Body)

-- Total Games Visits

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://www.roblox.com/users/profile/playergames-json?userId="..game.Players.LocalPlayer.UserId..""
}).Body)

local count = 0

for _, v in ipairs(response.Games) do
  count = count + v.Plays
end

print("Total Visits : "..count)
	end,
})

local Input = Tab:CreateInput({
	Name = "Test Connection (prints text to console)",
	PlaceholderText = "Hello world!",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		print("SmartHub // Executor Test text: "..Text)-- The function that takes place when the input is changed
    		-- The variable (Text) is a string for the value in the text box
	end,
})

local Section = Tab:CreateSection("Player Modifications")
Label:Set("Releasing soon, for now use LunarHub")

local Button = Tab:CreateButton({
	Name = "Destory Interface",
	Callback = function()
		Rayfield:Destroy() -- The function that takes place when the button is pressed
	end,
})

local function SelectCity(City)
    if City == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9682.98828, 74.8522873, 3099.03394, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
    elseif City == "Snow City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9676.13867, 74.8522873, 3782.69385, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif City == "Magma City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11054.9688, 232.791656, 4898.62842, -0.0872479677, 0.000158954252, -0.996186614, -0.00054083002, 0.999999821, 0.00020692969, 0.996186495, 0.000556821818, -0.0872478485)
    elseif City == "Legends Highway" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13098.8711, 232.791656, 5907.62793, -0.0872479677, 0.000158954252, -0.996186614, -0.00054083002, 0.999999821, 0.00020692969, 0.996186495, 0.000556821818, -0.0872478485)
    end
end		
				

						

				
