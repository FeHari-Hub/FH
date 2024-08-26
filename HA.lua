--// Configurações Globais \\--
getgenv().AntiAFK = false -- Anti-AFK Toggle
getgenv().Autofarm = false
getgenv().OpenEgg = false
getgenv().AutoRebirth = false
getgenv().HoopFarm = false
getgenv().MainCity = false
getgenv().Snow = false
getgenv().Magma = false
getgenv().LegendsHighway = false

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Chr = Player.Character

Player.CharacterAdded:Connect(function()
    Chr = Player.Character
end)

local ChrHead = Chr and Chr:FindFirstChild("Head")
local Humanoid = Chr and Chr:FindFirstChild("Humanoid")
local Root = Chr and Chr:FindFirstChild("HumanoidRootPart")

--// Tables \\--
local AreaToFarm = {}
local Crystals = {}

--// Funções de Farm \\--
local function CityFarm()
    spawn(function()
        while task.wait() do
            if not getgenv().Autofarm or not getgenv().MainCity then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for _, v in pairs(game:GetService("Workspace").orbFolder["City"]:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function SnowFarm()
    spawn(function()
        while task.wait() do
            if not getgenv().Autofarm or not getgenv().Snow then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for _, v in pairs(game:GetService("Workspace").orbFolder["Snow City"]:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function MagmaFarm()
    spawn(function()
        while task.wait() do
            if not getgenv().Autofarm or not getgenv().Magma then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for _, v in pairs(game:GetService("Workspace").orbFolder["Magma City"]:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function LegendsHighwayFarm()
    spawn(function()
        while task.wait() do
            if not getgenv().Autofarm or not getgenv().LegendsHighway then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for _, v in pairs(game:GetService("Workspace").orbFolder["Legends Highway"]:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function HoopFarmV2()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("HumanoidRootPart") then
        local children = workspace.Hoops:GetChildren()
        for _, child in ipairs(children) do
            if child.Name == "Hoop" then
                child.CFrame = Chr.HumanoidRootPart.CFrame
            end    
        end
    end
end

local function HoopFarm()
    if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
        for _, v in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                task.wait()
                firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 1)
            end
        end
    end
end

local function Egg(EggName)
    task.wait()
    local Open = "openCrystal"
    local Name = EggName
    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(Open, Name)
end

local function Rebirth()
    task.wait()
    local ohString1 = "rebirthRequest"
    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(ohString1)
end

for _, v in pairs(game:GetService("Workspace").mapCrystalsFolder:GetChildren()) do
    table.insert(Crystals, v.Name)
end

-- Função para alternar o estado de AutoRaces
local function ToggleAutoRaces(Value)
    getgenv().AutoRaces = Value
    if getgenv().AutoRaces then
        spawn(function()
            while getgenv().AutoRaces do
                pcall(function()
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    task.wait()
                    local part = Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(game:GetService("Workspace").raceMaps:GetDescendants()) do 
                        if v.Name == "Decal" and v.Parent then
                            firetouchinterest(part, v.Parent, 0)
                            wait()
                            firetouchinterest(part, v.Parent, 1)
                        end
                    end
                end)
                task.wait()
            end
        end)
    end
end 

local function ToggleAutoRacesSolo(Value)
    getgenv().AutoRacesSolo = Value
    if getgenv().AutoRacesSolo then
        spawn(function()
            while getgenv().AutoRacesSolo do
                pcall(function()
                    local playerHead = Players.LocalPlayer.Character.Head
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    wait(0.00)
                end)
                task.wait()
            end
        end)
    end
end

-- Função para otimizar FPS e Ping
local function optimizeFpsPing()
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
end

-- Função para selecionar a cidade
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

--// Início do Script de Interface \\--
local HaridadeLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHari/HaridadeScript/main/LegendsOfSpeed.lua')))()
local Window = HaridadeLib:CreateWindow("Legends Of Speed")
local Tabs = {
    Main = Window:CreateTab("Main"),
    Farm = Window:CreateTab("Farm"),
    Settings = Window:CreateTab("Settings")
}

--// Main Tab \\--
local MainTab = Tabs.Main
MainTab:CreateToggle("Anti-AFK", getgenv().AntiAFK, function(value)
    getgenv().AntiAFK = value
    if value then
        spawn(function()
            while getgenv().AntiAFK do
                task.wait(60)
                local virtualUser = game:GetService("VirtualUser")
                virtualUser:ClickButton2(Vector2.new())
            end
        end)
    end
end)

MainTab:CreateButton("Optimize FPS/Ping", function()
    optimizeFpsPing()
end)

--// Farm Tab \\--
local FarmTab = Tabs.Farm
FarmTab:CreateToggle("Farm Main City", getgenv().MainCity, function(value)
    getgenv().MainCity = value
    if value then
        CityFarm()
    end
end)

FarmTab:CreateToggle("Farm Snow City", getgenv().Snow, function(value)
    getgenv().Snow = value
    if value then
        SnowFarm()
    end
end)

FarmTab:CreateToggle("Farm Magma City", getgenv().Magma, function(value)
    getgenv().Magma = value
    if value then
        MagmaFarm()
    end
end)

FarmTab:CreateToggle("Farm Legends Highway", getgenv().LegendsHighway, function(value)
    getgenv().LegendsHighway = value
    if value then
        LegendsHighwayFarm()
    end
end)

FarmTab:CreateToggle("Hoop Farm", getgenv().HoopFarm, function(value)
    getgenv().HoopFarm = value
    if value then
        HoopFarm()
    end
end)

FarmTab:CreateToggle("Hoop Farm V2", getgenv().HoopFarmV2, function(value)
    getgenv().HoopFarmV2 = value
    if value then
        HoopFarmV2()
    end
end)

FarmTab:CreateDropdown("Select Egg", Crystals, function(selected)
    if getgenv().OpenEgg then
        Egg(selected)
    end
end)

FarmTab:CreateToggle("Open Egg", getgenv().OpenEgg, function(value)
    getgenv().OpenEgg = value
end)

FarmTab:CreateToggle("Auto Rebirth", getgenv().AutoRebirth, function(value)
    getgenv().AutoRebirth = value
    if value then
        spawn(function()
            while getgenv().AutoRebirth do
                Rebirth()
                task.wait(300) -- Intervalo para evitar execução contínua sem necessidade
            end
        end)
    end
end)

--// Settings Tab \\--
local SettingsTab = Tabs.Settings
SettingsTab:CreateToggle("Auto Races", getgenv().AutoRaces, function(value)
    ToggleAutoRaces(value)
end)

SettingsTab:CreateToggle("Auto Races Solo", getgenv().AutoRacesSolo, function(value)
    ToggleAutoRacesSolo(value)
end)

SettingsTab:CreateDropdown("Select City", {"Main City", "Snow City", "Magma City", "Legends Highway"}, function(selected)
    SelectCity(selected)
end)
