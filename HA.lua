if game.CoreGui:FindFirstChild("Haridade - LOS") then
    game.CoreGui:FindFirstChild("Haridade - LOS"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Haridade - LOS"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
ImageButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ImageButton.Size = UDim2.new(0, 100, 0, 100)
ImageButton.Image = "http://www.roblox.com/asset/?id=111462827396918"

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 9)
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    local menu = game.CoreGui:FindFirstChild("HaridadeLOS")
    if menu then
        menu.Enabled = not menu.Enabled
    end
end)

-- Aqui você pode adicionar mais botões ou abas conforme necessário
