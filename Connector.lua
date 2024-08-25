local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "SpeedHub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "City"
})

Tab:AddToggle({
	Name = "Auto Farm Blue Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmBlue = Value
while AutoFarmBlue do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Blue Orb",
    [3] = "City"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Yellow Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmYellow = Value
while AutoFarmYellow do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = "City"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Orange Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmOrange = Value
while AutoFarmOrange do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Orange Orb",
    [3] = "City"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Red Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmRed = Value
while AutoFarmRed do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "City"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Gem",
	Default = false,
	Callback = function(Value)
		AutoFarmGem = Value
while AutoFarmGem do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = "City"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

local Section = Tab:AddSection({
	Name = "Snowcity"
})

Tab:AddToggle({
	Name = "Auto Farm Blue Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmBlue2 = Value
while AutoFarmBlue2 do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Blue Orb",
    [3] = "Snow city"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Yellow Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmYellow2 = Value
while AutoFarmYellow2 do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Yellow Orb",
    [3] = "Snow city"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Orange Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmOrange2 = Value
while AutoFarmOrange2 do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Orange Orb",
    [3] = "Snow city"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Red Orbs",
	Default = false,
	Callback = function(Value)
		AutoFarmRed2 = Value
while AutoFarmRed2 do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "Snow city"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Gem",
	Default = false,
	Callback = function(Value)
		AutoFarmGem2 = Value
while AutoFarmGem2 do
for i = 1, 100 do
local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = "Snow city"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
end
task.wait()
end
	end    
})
