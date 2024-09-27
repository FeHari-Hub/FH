--[[
    DuccHub v1.0 by duccveloper

    Why DuccHub v1.0? Where DuccHub v0.1?
    - Because I accidentally deleted the old version of DuccHub, so I had to remake it. PAIN!

    What is DuccHub?
    - DuccHub is a hub for all of universal roblox scripts, so you can easily access them all.

    How do I use DuccHub?
    - Just click execute from your executor, and it will automatically load all of the scripts.

    DuccHub v1.0 changelog:
    - Recoded all
    - More neat script

    Credits:
    - duccveloper - Scripting
    - deeeity@github - UI Library
    - Some other dude - Misc scripts
]]
local version = '1.0 (Pre-release)'

-- Load UI Library
local UI_LIB = loadstring(game:HttpGet('https://pastebin.com/raw/8JXetz8L'))()

-- Variables
local images = {
    ['home_icon'] = 11632424326,
    ['star_icon'] = 11647714813,
    ['run_icon'] = 11632434473,
    ['teleport_icon'] = 11647702726,
    ['info_icon'] = 11472832266,
    ['tick_icon'] = 11624388037,
    ['cross_icon'] = 11624382926,
    ['warning_icon'] = 11624382860,
    ['bell_icon'] = 11624378537
}


-- Services
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService('UserInputService')

-- Misc variables
local shifttorun = false
local walkspeed = LocalPlayer.Character.Humanoid.WalkSpeed
local runspeed = walkspeed * 2
local jetpack = false
local infiniteJump = false
local target_tp_part = nil

-- Functions
function date(str)
    local data = {}
    local y,m,d,h,i,s,t=str:match"(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+).(%d+)Z"
    data.year=y data.month=m data.day=d data.hour=h data.min=i data.sec=s data.milli=t
    return data
end

function checkuserinfo(username)
    local userid = "idk"
local success, err = pcall(function()
    userid = Players:GetUserIdFromNameAsync(username)
end)
if userid == "idk" then
    _UI_T4_S1_error:Set("User not found!")
    _UI_T4_S1_error:Visible(true)
    wait(2)
    _UI_T4_S1_error:Visible(false)
    _UI_T4_S1_error:Set("")
else
        local request = 'https://users.roproxy.com/v1/users/' .. userid
        local response = game:HttpGet(request)
        local data = game:GetService('HttpService'):JSONDecode(response)
        -- Start fetching data
        local description = data.description
        local created = data.created
        local isbanned = data.isBanned
        local id = data.id
        local username = data.name
        local displayname = data.displayName
        
        -- Fetch user avatar and headshot url
        local request =
            'https://thumbnails.roblox.com/v1/users/avatar?userIds=' .. id .. '&size=48x48&format=Png&isCircular=false'
        local request2 =
            'https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=' ..
            id .. '&size=48x48&format=Png&isCircular=false'
        local response = game:HttpGet(request)
        local response2 = game:HttpGet(request2)
        local data = game:GetService('HttpService'):JSONDecode(response)
        local data2 = game:GetService('HttpService'):JSONDecode(response2)
        avatarurl = data.data[1].imageUrl
        headshoturl = data2.data[1].imageUrl

        if isbanned == true then
            _UI_T4_S1_ban:Visible(true)
        else
            _UI_T4_S1_ban:Visible(false)
        end
        -- Set
        _UI_T4_S2:Set('About ' .. displayname)
        _UI_T4_S2_username:Set('Username: ' .. username)
        _UI_T4_S2_displayname:Set('Display name: ' .. displayname)
        _UI_T4_S2_userid:Set('User ID: ' .. id)
        _UI_T4_S2_created:Set('Created: ' .. date(created).day .. '/' .. date(created).month .. '/' .. date(created).year)
        _UI_T4_S3_avatar:SetImage(Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size48x48), "Avatar of " .. displayname, false)
        _UI_T4_S3_headshot:SetImage(Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48), "Headshot of " .. displayname, false)
    end
end


UIS.InputBegan:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.LeftShift then
            if shifttorun then
                LocalPlayer.Character.Humanoid.WalkSpeed = runspeed
            end
        end
    end
)

UIS.InputEnded:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.LeftShift then
            if shifttorun then
                LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
            end
        end
    end
)

UIS.InputBegan:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            if jetpack then
                LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState('Jumping')
            end
        end
    end
)

UIS.InputBegan:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.Space and jetpack then
            while UIS:IsKeyDown(Enum.KeyCode.Space) do
                wait()
                LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState('Jumping')
            end
        end
    end
)

UIS.InputBegan:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.Space and infiniteJump then
            LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState('Jumping')
        end
    end
)

function notify(title, text, icon)
    UI_LIB:Notify(
        {
            Title = title,
            Content = text,
            Duration = 1.5,
            Image = icon
        }
    )
end

function GetInstance(str)
    local pattern = 'Workspace%..'
    local pattern2 = '^Workspace'
    if string.match(str, pattern) and string.match(str, pattern2) then
        return true
    else
        notify('Error', 'Pattern invalid!', images['cross_icon'])
        return false
    end
end




function notGetInstance(String)
    local Table = string.split(String, ".")
    local Service = game:GetService(Table[1])

    local ObjectSoFar = Service
    for Index, Value in pairs(Table) do
        if Index ~= 1 then
            local Object = ObjectSoFar:FindFirstChild(Value)
            if Object then
                ObjectSoFar = Object
            else
                return nil
            end
        end
    end

    return (ObjectSoFar ~= Service and ObjectSoFar) or nil
end


-- UI
local _UI_Window =
    UI_LIB:CreateWindow(
        {
            Name = 'DuccHub v1.0',
            LoadingTitle = 'Rayfield Interface Suite',
            LoadingSubtitle = 'by Sirius',
            ConfigurationSaving = {
                Enabled = false,
                FolderName = nil,
                FileName = 'Big Hub'
            },
            Discord = {
                Enabled = false,
                Invite = 'sirius',
                RememberJoins = true
            },
            KeySystem = false,
            KeySettings = {
                Title = 'Sirius Hub',
                Subtitle = 'Key System',
                Note = 'Join the discord (discord.gg/sirius)',
                FileName = 'SiriusKey',
                SaveKey = true,
                GrabKeyFromSite = false,
                Key = 'Hello'
            }
        }
    )

-- Tabs

-- Home
local _UI_T1 = _UI_Window:CreateTab('Home', images['home_icon'])
local _UI_T1S1 = _UI_T1:CreateSection('Welcome')
local _UI_T1S1_WelcomeLabel = _UI_T1:CreateImage({
    ImageType = "Left",
    Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48),
    Caption = 'Hi, ' .. LocalPlayer.DisplayName .. '!',
})
_UI_T1S1_Leaked = _UI_T1:CreateLabel("quacccc... let's not leak my hard work")
local _UI_T1_S2 = _UI_T1:CreateSection('Danger Zone')
local _UI_T1_S2_DestroyUI =
    _UI_T1:CreateButton(
        {
            Name = 'Destroy UI',
            Callback = function()
                UI_LIB:Destroy()
            end
        }
    )

-- Movement
local _UI_T2 = _UI_Window:CreateTab('Movement', images['run_icon'])
local _UI_T2_S1 = _UI_T2:CreateSection('Main')
local _UI_T2_S1_WalkSpeed =
    _UI_T2:CreateInput(
        {
            Name = 'WalkSpeed',
            PlaceholderText = 'Default: 16',
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
                if Text == '' then
                    LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    notify('WalkSpeed', 'WalkSpeed has been reset to 16', images['tick_icon'])
                else
                    tonumber(Text)
                    if type(Text) == 'number' then
                        LocalPlayer.Character.Humanoid.WalkSpeed = Text
                        notify('WalkSpeed', 'WalkSpeed has been set to ' .. Text, images['tick_icon'])
                    else
                        notify('Error', 'WalkSpeed must be a number!', images['cross_icon'])
                    end
                end
            end
        }
    )
local _UI_T2_S1_JumpPower =
    _UI_T2:CreateInput(
        {
            Name = 'JumpPower',
            PlaceholderText = 'Default: 50',
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
                if Text == '' then
                    LocalPlayer.Character.Humanoid.JumpPower = 50
                    notify('JumpPower', 'JumpPower has been reset to 50', images['tick_icon'])
                else
                    tonumber(Text)
                    if type(Text) == 'number' then
                        LocalPlayer.Character.Humanoid.JumpPower = Text
                        notify('JumpPower', 'JumpPower has been set to ' .. Text, images['tick_icon'])
                    else
                        notify('Error', 'JumpPower must be a number!', images['cross_icon'])
                    end
                end
            end
        }
    )

local _UI_T2_S2 = _UI_T2:CreateSection('Shift to Run')
local _UI_T2_S2_runSpeed =
    _UI_T2:CreateInput(
        {
            Name = 'RunSpeed',
            PlaceholderText = 'Default: 32',
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
                -- check if text = number
                if Text == '' then
                    runspeed = 32
                    notify('RunSpeed', 'RunSpeed has been reset to 32', images['tick_icon'])
                else
                    tonumber(Text)
                    if not Text == nil then
                        runspeed = Text
                        notify('RunSpeed', 'RunSpeed has been set to ' .. Text, images['tick_icon'])
                    else
                        notify('Error', 'RunSpeed must be a number!', images['cross_icon'])
                    end
                end
            end
        }
    )
local _UI_T2_S2_shiftToRun =
    _UI_T2:CreateToggle(
        {
            Name = 'Shift to Run',
            Callback = function(Value)
                shifttorun = Value
            end
        }
    )

local _UI_T2_S3 = _UI_T2:CreateSection('Jump')
local _UI_T2_S3_infiniteJump =
    _UI_T2:CreateToggle(
        {
            Name = 'Infinite Jump',
            Callback = function(Value)
                infiniteJump = Value
            end
        }
    )
local _UI_T2_S3_jetpack =
    _UI_T2:CreateToggle(
        {
            Name = 'Jetpack',
            Callback = function(Value)
                jetpack = Value
            end
        }
    )

-- Teleportation
local _UI_T3 = _UI_Window:CreateTab('Teleportation', images['teleport_icon'])
local _UI_T3_S1 = _UI_T3:CreateSection('Selection')
local _UI_T3_S1_selectPart =
    _UI_T3:CreateButton(
        {
            Name = 'Select Part',
            Callback = function()
                local tool = Instance.new('Tool')
                tool.Name = 'Part Selector'
                tool.RequiresHandle = false
                tool.CanBeDropped = false
                tool.Parent = game.Players.LocalPlayer.Backpack
                notify("Part Selector", "Select a part to teleport to", images['info_icon'])
                tool.Equipped:Connect(
                    function(mouse)
                        mouse.Button1Down:connect(
                            function()
                                if mouse.Target and mouse.Target.Parent then
                                    local part = mouse.Target:GetFullName()
                                    target_tp_part = part
                                    _UI_T3_S1_partLabel:Set("Selected part: " .. part)
                                    target_tp_part = notGetInstance(target_tp_part)
                                    tool:Destroy()
                                end
                            end
                        )
                    end
                )
            end
        }
    )

local _UI_T3_S1_partPath =
    _UI_T3:CreateInput(
        {
            Name = 'Part Path',
            PlaceholderText = 'Must starts with "Workspace"!',
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
                if Text == '' then
                    target_tp_part = nil
                    _UI_T3_S1_partLabel:Set("No part selected")
                else
                    if GetInstance(Text) then
                        local valididk = notGetInstance(Text)
                        if valididk == nil then
                            notify('Error', 'Part does not exist!', images['cross_icon'])
                        else
                            target_tp_part = valididk
                            notify('Part Path', 'Part Path has been set to ' .. Text, images['tick_icon'])
                            _UI_T3_S1_partLabel:Set("Selected part: " .. Text)
                        end

                    end
                end
            end,
        }
    )
_UI_T3_S1_partLabel = _UI_T3:CreateLabel('No part selected')
local _UI_T3_S2 = _UI_T3:CreateSection('Teleportation')
local _UI_T3_S2_teleport =
    _UI_T3:CreateButton(
        {
            Name = 'Teleport',
            Callback = function()
                if target_tp_part == nil then
                    notify('Error', 'No part selected!', images['cross_icon'])
                else
                    LocalPlayer.Character:MoveTo(target_tp_part.CFrame.Position + Vector3.new(0, 5, 0))
                    notify('Teleport', 'Teleported to ' .. tostring(target_tp_part), images['tick_icon'])
                end
            end,
        }
    )

-- Player infoo
local _UI_T4 = _UI_Window:CreateTab('Player Info', images['info_icon'])
local _UI_T4_S1 = _UI_T4:CreateSection('Username Input')
local _UI_T4_S1_username =
    _UI_T4:CreateInput(
        {
            Name = 'Username',
            PlaceholderText = 'Default: ' .. LocalPlayer.Name,
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
                if Text == '' then
                    checkuserinfo(LocalPlayer.Name)
                else
                    checkuserinfo(Text)
                end
            end
        }
    )

_UI_T4_S1_error = _UI_T4:CreateLabel('')
_UI_T4_S1_error:Visible(false)
_UI_T4_S1_ban = _UI_T4:CreateLabel('User is banned!')
_UI_T4_S1_ban:Visible(false)

-- Player info
_UI_T4_S2 = _UI_T4:CreateSection('About ' .. LocalPlayer.DisplayName)
_UI_T4_S2_username = _UI_T4:CreateLabel('Username: ' .. LocalPlayer.Name)
_UI_T4_S2_displayname = _UI_T4:CreateLabel('Displayname: ' .. LocalPlayer.DisplayName)
_UI_T4_S2_userid = _UI_T4:CreateLabel('User ID: ' .. LocalPlayer.UserId)
_UI_T4_S2_created = _UI_T4:CreateLabel('Created: ' .. LocalPlayer.AccountAge)

_UI_T4_S3 = _UI_T4:CreateSection('Avatar')
_UI_T4_S3_avatar = _UI_T4:CreateImage({
    ImageType = 'Left',
    Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size48x48),
    Caption = 'Avatar preview'
})
_UI_T4_S3_copyavatarurl =
    _UI_T4:CreateButton(
        {
            Name = 'Copy Avatar URL',
            Callback = function()
                setclipboard(avatarurl)
                notify('Avatar URL', 'Avatar URL copied to clipboard', images['tick_icon'])
            end
        }
    )

_UI_T4_S3_headshot = _UI_T4:CreateImage({
    ImageType = 'Left',
    Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48),
    Caption = 'Headshot preview'
})
_UI_T4_S3_copyheadshoturl =
    _UI_T4:CreateButton(
        {
            Name = 'Copy Headshot URL',
            Callback = function()
                setclipboard(headshoturl)
                notify('Headshot URL', 'Headshot URL copied to clipboard', images['tick_icon'])
            end
        }
    )




checkuserinfo(LocalPlayer.Name)
