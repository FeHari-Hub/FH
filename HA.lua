--// Variables \\--
getgenv().Autofarm = false
getgenv().OpenEgg = false
getgenv().AutoRebirth = false
getgenv().HoopFarm = false
getgenv().FarmActive = false -- Novo toggle para ativar o farm

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

local ChrHead = Chr.Head
local Humanoid = Chr.Humanoid
local Root = Chr.HumanoidRootPart

--// Tables \\--
local AreaToFarm = "Main City" -- Default to Main City
local OrbToFarm = "Yellow Orb" -- Default to Yellow Orb
local FarmSpeed = "x100" -- Default to x100
local Crystals = {}

--// Functions \\--
local function CityFarm()
    spawn(function()
        while task.wait() do
            if not Autofarm or not FarmActive or not MainCity then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["City"]:GetDescendants() do
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
            if not Autofarm or not FarmActive or not Snow then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["Snow City"]:GetDescendants() do
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
            if not Autofarm or not FarmActive or not Magma then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["Magma City"]:GetDescendants() do
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
            if not Autofarm or not FarmActive or not LegendsHighway then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["Legends Highway"]:GetDescendants() do
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

for i, v in next, game:GetService("Workspace").mapCrystalsFolder:GetChildren() do
    table.insert(Crystals, v.Name)
end

local function ToggleFarm(Value)
    FarmActive = Value
    if FarmActive then
        spawn(function()
            while FarmActive do
                pcall(function()
                    if AreaToFarm == "Main City" then
                        CityFarm()
                    elseif AreaToFarm == "Snow City" then
                        SnowFarm()
                    elseif AreaToFarm == "Magma City" then
                        MagmaFarm()
                    elseif AreaToFarm == "Legends Highway" then
                        LegendsHighwayFarm()
                    end
                end)
                task.wait()
            end
        end)
    end
end

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

--// Haridade Script \\--
local HaridadeLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHari/HaridadeScript/main/LegendsOfSpeed.lua')))()
local Window = HaridadeLib:MakeWindow({Name = "Haridade | Legends Of Speed ⚡", HidePremium = false, SaveConfig = true, ConfigFolder = "HaridadeTest"})

local FarmTab = Window:MakeTab({
    Name = "Início",
    Icon = "rbxassetid://112625488111718",
    PremiumOnly = false
})

local FarmTab = FarmTab:AddSection({
    Name = "Otimizações"
})

FarmTab:AddToggle({
    Name = "Reduzir Gráficos Ao Máximo",
    Default = false,
    Callback = function(value)
        isReducingGraphics = value
        if isReducingGraphics then
            while isReducingGraphics do
                optimizeFpsPing()
                task.wait()
            end
        end
    end    
})

local FarmTab = Window:MakeTab({
    Name = "Teleportar",
    Icon = "rbxassetid://109334924659404",
    PremiumOnly = false
})

local Section = FarmTab:AddSection({
    Name = "Áreas Para Teleportar"
})

FarmTab:AddDropdown({
    Name = "Selecionar Cidade Para Teleportar",
    Default = nil,
    Options = {"Main City", "Snow City", "Magma City", "Legends Highway"},
    Callback = function(Value)
        SelectCity(Value)
    end    
})

local FarmTab = Window:MakeTab({
    Name = "Farmar",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = FarmTab:AddSection({
    Name = "Farmar Automático"
})

FarmTab:AddDropdown({
    Name = "Áreas Para Farmar",
    Default = nil,
    Options = {"Main City", "Snow City", "Magma City", "Legends Highway"},
    Callback = function(Value)
        AreaToFarm = Value
        getgenv().MainCity = (AreaToFarm == "Main City")
        getgenv().Snow = (AreaToFarm == "Snow City")
        getgenv().Magma = (AreaToFarm == "Magma City")
        getgenv().LegendsHighway = (AreaToFarm == "Legends Highway")
    end    
})

FarmTab:AddDropdown({
    Name = "Selecione a Orb",
    Default = nil,
    Options = {"Yellow Orb", "Orange Orb", "Blue Orb", "Red Orb", "Gemas"},
    Callback = function(Value)
        OrbToFarm = Value
    end    
})

FarmTab:AddDropdown({
    Name = "Selecione a Velocidade",
    Default = nil,
    Options = {"x50", "x75", "x100", "x125", "x150", "x175", "x200", "x250", "x300"},
    Callback = function(Value)
        FarmSpeed = Value
    end    
})

FarmTab:AddToggle({
    Name = "Ativar Farm",
    Default = false,
    Callback = function(Value)
        ToggleFarm(Value)
    end    
})

FarmTab:AddToggle({
    Name = "Diminuir o Ping (não faz milagre)",
    Default = false,
    Callback = function(Value)
        getgenv().Hoop = Value
        while Hoop do
            HoopFarm()
            task.wait()
        end
    end    
})

FarmTab:AddToggle({
    Name = "Farmar Orbs (BETA)",
    Default = false,
    Callback = function(Value)
        Autofarm = Value
        if Value then
            if AreaToFarm == "Main City" then
                CityFarm()
            elseif AreaToFarm == "Snow City" then
                SnowFarm()
            elseif AreaToFarm == "Magma City" then
                MagmaFarm()
            elseif AreaToFarm == "Legends Highway" then
                LegendsHighwayFarm()
            end
        end 
    end
})

FarmTab:AddSection({
    Name = "Farmar Aros"
})

FarmTab:AddToggle({
    Name = "Aros V1",
    Default = false,
    Callback = function(Value)
        getgenv().Hoop = Value
        while Hoop do
            HoopFarm()
            task.wait()
        end
    end    
})

FarmTab:AddToggle({
    Name = "Aros V2",
    Default = false,
    Callback = function(Value)
        getgenv().HoopV2 = Value
        while HoopV2 do
            HoopFarmV2()
            task.wait()
        end
    end    
})

local FarmTab = Window:MakeTab({
    Name = "Renascimento",
    Icon = "rbxassetid://121663556703347",
    PremiumOnly = false
})

FarmTab:AddSection({
    Name = "Auto Renascimento"
})

FarmTab:AddToggle({
    Name = "Auto Renascimento (ative apenas se for renascer AFK)",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRebirth = Value
        while AutoRebirth do
            Rebirth()
            task.wait()
        end
    end    
})

local FarmTab = Window:MakeTab({
    Name = "Auto Corridas",
    Icon = "rbxassetid://72430981170529",
    PremiumOnly = false
})

FarmTab:AddSection({
    Name = "Corridas Automáticas"
})

FarmTab:AddToggle({
    Name = "Auto Corridas",
    Default = false,
    Callback = function(Value)
        ToggleAutoRaces(Value)
    end    
})

FarmTab:AddToggle({
    Name = "Bloquear Corridas (apenas você entra)",
    Default = false,
    Callback = function(Value)
        ToggleAutoRacesSolo(Value)
    end    
})

local FarmTab = Window:MakeTab({
    Name = "Comprar Pets",
    Icon = "rbxassetid://95145057413711",
    PremiumOnly = false
})

FarmTab:AddSection({
    Name = "Comprar Pets Automáticamente"
})

local Crystal1

FarmTab:AddDropdown({
    Name = "Escolha O Cristal",
    Default = nil,
    Options = Crystals,
    Callback = function(Value)
        Crystal1 = Value
    end    
})

FarmTab:AddToggle({
    Name = "Comprar Pets Automáticamente (necessita de gemas)",
    Default = false,
    Callback = function(Value)
        getgenv().OpenEgg = Value
        while getgenv().OpenEgg do
            if Crystal1 then
                Egg(Crystal1)  
            end
            task.wait()
        end
    end    
})

HaridadeLib:MakeNotification({
    Name = "Haridade Community",
    Content = "discord.gg/uydz6pZWMk",
    Image = "rbxassetid://101951842185056",
    Time = 20
})

HaridadeLib:MakeNotification({
    Name = "BYPASS ANTI-DETECTAÇÃO",
    Content = "ByPass Ativo... ✅",
    Image = "rbxassetid://71506531582407",
    Time = 20
})

HaridadeLib:Init()
