local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Cleanup UI lama
if game.CoreGui:FindFirstChild("SilentPoopUltra") then
    game.CoreGui.SilentPoopUltra:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SilentPoopUltra"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.CoreGui

-- ==========================================
-- SISTEM NOTIFIKASI MODERN
-- ==========================================
local function SendNotification(title, text)
    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 230, 0, 65)
    notifFrame.Position = UDim2.new(1, 20, 1, -80)
    notifFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    notifFrame.BorderSizePixel = 0
    notifFrame.Parent = screenGui
    
    Instance.new("UICorner", notifFrame).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", notifFrame)
    stroke.Color = Color3.fromRGB(80, 80, 255)
    stroke.Thickness = 1.5
    
    local tLabel = Instance.new("TextLabel")
    tLabel.Text = title
    tLabel.Size = UDim2.new(1, -20, 0, 25)
    tLabel.Position = UDim2.new(0, 10, 0, 8)
    tLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    tLabel.Font = Enum.Font.Code
    tLabel.TextSize = 14
    tLabel.TextXAlignment = Enum.TextXAlignment.Left
    tLabel.BackgroundTransparency = 1
    tLabel.Parent = notifFrame
    
    local dLabel = Instance.new("TextLabel")
    dLabel.Text = text
    dLabel.Size = UDim2.new(1, -20, 0, 20)
    dLabel.Position = UDim2.new(0, 10, 0, 32)
    dLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    dLabel.Font = Enum.Font.Code
    dLabel.TextSize = 12
    dLabel.TextXAlignment = Enum.TextXAlignment.Left
    dLabel.BackgroundTransparency = 1
    dLabel.Parent = notifFrame

    notifFrame:TweenPosition(UDim2.new(1, -250, 1, -80), "Out", "Quart", 0.5, true)
    task.delay(4, function()
        notifFrame:TweenPosition(UDim2.new(1, 20, 1, -80), "In", "Quart", 0.5, true, function()
            notifFrame:Destroy()
        end)
    end)
end

SendNotification("Защита от воров", "Спасибо за использование!")

-- ==========================================
-- MAIN UI (ULTRA SYMMETRIC)
-- ==========================================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 250, 0, 250)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5) -- Tetap di tengah
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(45, 45, 50)
mainStroke.Thickness = 2

-- Title Bar (Centered Layout)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Auto Poop 💩"
titleLabel.Size = UDim2.new(1, -90, 1, 0)
titleLabel.Position = UDim2.new(0, 40, 0, 0)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.Code
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = titleBar

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 24, 0, 24)
icon.Position = UDim2.new(0, 8, 0.5, -12)
icon.Image = "rbxassetid://13479007204"
icon.BackgroundTransparency = 1
icon.Parent = titleBar

-- Control Buttons (Precise Alignment)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -5, 0.5, 0)
closeBtn.AnchorPoint = Vector2.new(1, 0.5)
closeBtn.Text = "×"
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 20
closeBtn.Parent = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -40, 0.5, 0)
minBtn.AnchorPoint = Vector2.new(1, 0.5)
minBtn.Text = "-"
minBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
minBtn.TextColor3 = Color3.new(1, 1, 1)
minBtn.Font = Enum.Font.Code
minBtn.TextSize = 20
minBtn.Parent = titleBar

for _, b in pairs({closeBtn, minBtn}) do Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8) end

-- Body Content
local container = Instance.new("Frame")
container.Size = UDim2.new(1, 0, 1, -40)
container.Position = UDim2.new(0, 0, 0, 40)
container.BackgroundTransparency = 1
container.Parent = mainFrame

local uiList = Instance.new("UIListLayout", container)
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiList.Padding = UDim.new(0, 12)
uiList.SortOrder = Enum.SortOrder.LayoutOrder

-- Spacer Top
Instance.new("Frame", container).Size = UDim2.new(1,0,0,5); container.Frame.BackgroundTransparency = 1

-- Profile (Symmetric)
local profileFrame = Instance.new("Frame")
profileFrame.Size = UDim2.new(0.9, 0, 0, 55)
profileFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
profileFrame.Parent = container
Instance.new("UICorner", profileFrame)

local avatarImg = Instance.new("ImageLabel")
avatarImg.Size = UDim2.new(0, 40, 0, 40)
avatarImg.Position = UDim2.new(0, 8, 0.5, -20)
avatarImg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
avatarImg.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
avatarImg.Parent = profileFrame
Instance.new("UICorner", avatarImg).CornerRadius = UDim.new(1, 0)

local nameLabel = Instance.new("TextLabel")
nameLabel.Text = LocalPlayer.DisplayName
nameLabel.Size = UDim2.new(1, -60, 1, 0)
nameLabel.Position = UDim2.new(0, 55, 0, 0)
nameLabel.TextColor3 = Color3.new(1, 1, 1)
nameLabel.Font = Enum.Font.Code
nameLabel.TextSize = 13
nameLabel.TextXAlignment = Enum.TextXAlignment.Left
nameLabel.BackgroundTransparency = 1
nameLabel.Parent = profileFrame

-- Custom Delay Input
local delayFrame = Instance.new("Frame")
delayFrame.Size = UDim2.new(0.9, 0, 0, 40)
delayFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
delayFrame.Parent = container
Instance.new("UICorner", delayFrame)

local delayLabel = Instance.new("TextLabel")
delayLabel.Text = "> DELAY"
delayLabel.Size = UDim2.new(0.4, 0, 1, 0)
delayLabel.Position = UDim2.new(0, 12, 0, 0)
delayLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
delayLabel.Font = Enum.Font.Code
delayLabel.TextSize = 12
delayLabel.TextXAlignment = Enum.TextXAlignment.Left
delayLabel.BackgroundTransparency = 1
delayLabel.Parent = delayFrame

local delayInput = Instance.new("TextBox")
delayInput.Text = "0.1"
delayInput.Size = UDim2.new(0.4, 0, 0.7, 0)
delayInput.Position = UDim2.new(0.95, 0, 0.5, 0)
delayInput.AnchorPoint = Vector2.new(1, 0.5)
delayInput.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
delayInput.TextColor3 = Color3.fromRGB(255, 255, 255)
delayInput.Font = Enum.Font.Code
delayInput.TextSize = 12
delayInput.Parent = delayFrame
Instance.new("UICorner", delayInput)

-- Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9, 0, 0, 42)
toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
toggleBtn.Text = "AUTO: [OFF]"
toggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
toggleBtn.Font = Enum.Font.Code
toggleBtn.TextSize = 14
toggleBtn.Parent = container
Instance.new("UICorner", toggleBtn)

-- Credit (Centered)
local creditLabel = Instance.new("TextLabel")
creditLabel.Text = "@SilentExecute"
creditLabel.Size = UDim2.new(1, 0, 0, 20)
creditLabel.TextColor3 = Color3.fromRGB(100, 100, 110)
creditLabel.Font = Enum.Font.Code
creditLabel.TextSize = 11
creditLabel.BackgroundTransparency = 1
creditLabel.Parent = container

-- ==========================================
-- SCRIPT LOGIC
-- ==========================================
local isRunning = false
local loopDelay = 0.1

toggleBtn.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    loopDelay = tonumber(delayInput.Text) or 0.1
    toggleBtn.Text = isRunning and "AUTO: [ON]" or "AUTO: [OFF]"
    toggleBtn.TextColor3 = isRunning and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(200, 200, 200)
    TweenService:Create(toggleBtn, TweenInfo.new(0.25), {BackgroundColor3 = isRunning and Color3.fromRGB(40, 55, 40) or Color3.fromRGB(35, 35, 45)}):Play()
end)

task.spawn(function()
    while true do
        if isRunning then
            local args = {0, true}
            pcall(function()
                ReplicatedStorage:WaitForChild("PoopEvent"):FireServer(unpack(args))
            end)
            task.wait(loopDelay)
        else
            task.wait(0.5)
        end
    end
end)

-- Minimize & Drag
local isMinimized = false
minBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetY = isMinimized and 40 or 250
    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 250, 0, targetY)}):Play()
    container.Visible = not isMinimized
    minBtn.Text = isMinimized and "+" or "-"
end)

closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-- Drag System (Android & Windows)
local dragToggle, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = true dragStart = input.Position startPos = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = false
    end
end)
