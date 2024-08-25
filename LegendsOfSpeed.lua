loadstring(game:HttpGet("https://raw.githubusercontent.com/FeHari/HaridadeScript/main/Connector.lua"))()

local KAITO = Instance.new("ScreenGui")
local K = Instance.new("TextButton")

KAITO.Name = "KAITO"
KAITO.Parent = game.CoreGui
KAITO.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

K.Name = "K"
K.Parent = KAITO
K.BackgroundColor3 = Color3.fromRGB(129, 0, 0)
K.Position = UDim2.new(0.128011018, 0, 0.100728154, 0)
K.Size = UDim2.new(0, 70, 0, 58)
K.Font = Enum.Font.Bodoni
K.Text = "K"
K.TextColor3 = Color3.fromRGB(255, 255, 255)
K.TextSize = 72.000
K.MouseButton1Click:Connect(function()
game.CoreGui:FindFirstChild("ui").Enabled = not game.CoreGui:FindFirstChild("ui").Enabled
wait(1)
end)


local function FBZDL_fake_script() -- K.LocalScript 
	local script = Instance.new('LocalScript', K)

	script.Parent.Active = true
	script.Parent.Selectable = true
	script.Parent.Draggable = true
end
coroutine.wrap(FBZDL_fake_script)()
