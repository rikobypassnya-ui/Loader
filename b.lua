local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Bersihkan UI Lama
if game.CoreGui:FindFirstChild("SilentPoopV4") then
    game.CoreGui.SilentPoopV4:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SilentPoopV4"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.CoreGui

-- ==========================================
-- SISTEM NOTIFIKASI MODERN
-- ==========================================
local function SendNotification(title, text)
    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 250, 0, 70)
    notifFrame.Position = UDim2.new(1, 20, 1, -100)
    notifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    notifFrame.BorderSizePixel = 0
    notifFrame.Parent = screenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 10)
    notifCorner.Parent = notifFrame
    
    local notifStroke = Instance.new("UIStroke")
    notifStroke.Color = Color3.fromRGB(100, 100, 255)
    notifStroke.Thickness = 2
    notifStroke.Parent = notifFrame
    
    local tLabel = Instance.new("TextLabel")
    tLabel.Text = title
    tLabel.Size = UDim2.new(1, -20, 0, 30)
    tLabel.Position = UDim2.new(0, 10, 0, 5)
    tLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    tLabel.Font = Enum.Font.FredokaOne
    tLabel.TextSize = 16
    tLabel.TextXAlignment = Enum.TextXAlignment.Left
    tLabel.BackgroundTransparency = 1
    tLabel.Parent = notifFrame
    
    local dLabel = Instance.new("TextLabel")
    dLabel.Text = text
    dLabel.Size = UDim2.new(1, -20, 0, 30)
    dLabel.Position = UDim2.new(0, 10, 0, 30)
    dLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    dLabel.Font = Enum.Font.Ubuntu
    dLabel.TextSize = 13
    dLabel.TextXAlignment = Enum.TextXAlignment.Left
    dLabel.BackgroundTransparency = 1
    dLabel.Parent = notifFrame

    -- Animasi Masuk
    notifFrame:TweenPosition(UDim2.new(1, -270, 1, -100), "Out", "Quart", 0.5, true)
    
    task.wait(4) -- Durasi notif
    
    -- Animasi Keluar
    notifFrame:TweenPosition(UDim2.new(1, 20, 1, -100), "In", "Quart", 0.5, true, function()
        notifFrame:Destroy()
    end)
end

-- Panggil Notifikasi saat script dijalankan
SendNotification("Защита..", "Этот скрипт защищен ..")

-- ==========================================
-- MAIN UI (UKURAN SEMULA)
-- ==========================================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 330, 0, 440)
mainFrame.Position = UDim2.new(0.5, -165, 0.5, -220)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 55)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Poop and Grow Brainrot"
titleLabel.Size = UDim2.new(0.6, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 45, 0, 0)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.FredokaOne
titleLabel.TextSize = 17
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = titleBar

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 28, 0, 28)
icon.Position = UDim2.new(0, 12, 0.5, -14)
icon.Image = "rbxassetid://6031087084"
icon.BackgroundTransparency = 1
icon.Parent = titleBar

-- Control Buttons
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 12)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.FredokaOne
closeBtn.Parent = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -75, 0, 12)
minBtn.Text = "-"
minBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
minBtn.TextColor3 = Color3.new(1,1,1)
minBtn.Font = Enum.Font.FredokaOne
minBtn.Parent = titleBar

for _, b in pairs({closeBtn, minBtn}) do Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8) end

-- Body Canvas
local canvas = Instance.new("Frame")
canvas.Name = "Canvas"
canvas.Size = UDim2.new(1, 0, 1, -55)
canvas.Position = UDim2.new(0, 0, 0, 55)
canvas.BackgroundTransparency = 1
canvas.Parent = mainFrame

-- Profile
local profile = Instance.new("Frame")
profile.Size = UDim2.new(1, -24, 0, 60)
profile.Position = UDim2.new(0, 12, 0, 12)
profile.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
profile.Parent = canvas
Instance.new("UICorner", profile)

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0, 40, 0, 40)
avatar.Position = UDim2.new(0, 10, 0.5, -20)
avatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
avatar.BackgroundTransparency = 1
avatar.Parent = profile
Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)

local name = Instance.new("TextLabel")
name.Text = LocalPlayer.DisplayName
name.Size = UDim2.new(1, -65, 1, 0)
name.Position = UDim2.new(0, 60, 0, 0)
name.TextColor3 = Color3.new(1,1,1)
name.Font = Enum.Font.Ubuntu
name.TextSize = 15
name.TextXAlignment = Enum.TextXAlignment.Left
name.BackgroundTransparency = 1
name.Parent = profile

-- Scroll Area
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -110)
scroll.Position = UDim2.new(0, 10, 0, 80)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 500)
scroll.Parent = canvas

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = scroll

-- RGB Credit (Bottom)
local creditLabel = Instance.new("TextLabel")
creditLabel.Text = "Made By @SilentExecute"
creditLabel.Size = UDim2.new(1, 0, 0, 25)
creditLabel.Position = UDim2.new(0, 0, 1, -30)
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.FredokaOne
creditLabel.TextSize = 14
creditLabel.Parent = canvas

task.spawn(function()
    while task.wait() do
        creditLabel.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
end)

-- Button Factory
local function createBtn(txt, color, func)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.95, 0, 0, 38)
    b.BackgroundColor3 = color
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.FredokaOne
    b.TextSize = 14
    b.Parent = scroll
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(func)
end

-- Integrasi Action
createBtn("Manual Poop", Color3.fromRGB(211, 84, 0), function()
    ReplicatedStorage:WaitForChild("startPooping"):FireServer()
end)

createBtn("Auto Poop", Color3.fromRGB(41, 128, 185), function()
    ReplicatedStorage:WaitForChild("startAutoPooping"):FireServer()
end)

createBtn("Finish Poop", Color3.fromRGB(39, 174, 96), function()
    ReplicatedStorage:WaitForChild("finishPooping"):FireServer(9999999999999999999999)
end)

createBtn("Skip Poop", Color3.fromRGB(142, 68, 173), function()
    ReplicatedStorage:WaitForChild("skipPooping"):FireServer()
end)

createBtn("Sell Brainrot", Color3.fromRGB(192, 57, 43), function()
    task.spawn(function() ReplicatedStorage:WaitForChild("sellAllBrainrots"):InvokeServer() end)
end)

createBtn("Spin Event", Color3.fromRGB(243, 156, 18), function()
    ReplicatedStorage:WaitForChild("SpinEvent"):FireServer()
end)

-- Dropdown
local dropHolder = Instance.new("Frame")
dropHolder.Size = UDim2.new(0.95, 0, 0, 38)
dropHolder.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
dropHolder.ClipsDescendants = true
dropHolder.Parent = scroll
Instance.new("UICorner", dropHolder).CornerRadius = UDim.new(0, 8)

local dropBtn = Instance.new("TextButton")
dropBtn.Size = UDim2.new(1, 0, 0, 38)
dropBtn.Text = "UPGRADES ▼"
dropBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
dropBtn.TextColor3 = Color3.new(1,1,1)
dropBtn.Font = Enum.Font.FredokaOne
dropBtn.Parent = dropHolder

local dropList = Instance.new("Frame")
dropList.Size = UDim2.new(1, 0, 0, 110)
dropList.Position = UDim2.new(0, 0, 0, 38)
dropList.BackgroundTransparency = 1
dropList.Parent = dropHolder
Instance.new("UIListLayout", dropList)

local function addUp(txt, args)
    local ub = Instance.new("TextButton")
    ub.Size = UDim2.new(1, 0, 0, 35)
    ub.BackgroundTransparency = 1
    ub.Text = "Upgrade " .. txt
    ub.TextColor3 = Color3.fromRGB(200, 200, 200)
    ub.Font = Enum.Font.Ubuntu
    ub.TextSize = 13
    ub.Parent = dropList
    ub.MouseButton1Click:Connect(function()
        ReplicatedStorage:WaitForChild("upgradeEvent"):FireServer(unpack(args))
    end)
end

addUp("Luck", {"luck", "money"})
addUp("Strength", {"strength", "money"})
addUp("Mutation Luck", {"mutationluck", "money"})

local open = false
dropBtn.MouseButton1Click:Connect(function()
    open = not open
    TweenService:Create(dropHolder, TweenInfo.new(0.3), {Size = open and UDim2.new(0.95, 0, 0, 145) or UDim2.new(0.95, 0, 0, 38)}):Play()
end)

-- Minimize & Drag
local isMin = false
minBtn.MouseButton1Click:Connect(function()
    isMin = not isMin
    local targetSize = isMin and UDim2.new(0, 330, 0, 55) or UDim2.new(0, 330, 0, 440)
    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    canvas.Visible = not isMin
    minBtn.Text = isMin and "+" or "-"
end)

closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

local dragging, dragInput, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true dragStart = input.Position startPos = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
