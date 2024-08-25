local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/FeHari/HaridadeScript/main/LegendsOfSpeed.lua"))()

local win = lib:Window("Xᴋɴᴏᴡ#0130",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Auto Farm")

tab:Toggle("Auto Hoops",false, function(Exp)
_G.loop = Exp
while _G.loop do wait()  
for i,v in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
    if v.Name == "TouchInterest" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
wait(.3)
end
end
end
end)

tab:Toggle("Auto orb",false, function(abc)
_G.orb = abc
while _G.orb do wait()
for i,v in pairs(game:GetService("Workspace").orbFolder.City:GetDescendants()) do
    if v.Name == "TouchInterest" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
end
end
end
end)

tab:Toggle("Auto Gems",false, function(abc)
    _G.Farm = abc
while _G.Farm do wait()  
for i,v in pairs(game:GetService("Workspace").orbFolder.City:GetDescendants()) do
    if v.Name == "orbParticle" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
wait(.3)
end
end
end
end)

tab:Toggle("Auto Rebirths",false, function(Reb)
_G.Rebirth = Reb
while _G.Rebirth do wait()
game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
end
end)


local misc = win:Tab("Misc")

misc:Bind("NewKeybind",Enum.KeyCode.RightControl, function()
print("Pressed!")
end)


misc:Button("Rebirths", function()
game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
end)

misc:Button("Rejoin", function()
local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

ts:Teleport(game.PlaceId, p)
end)
