-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Konfigurasi
local Config = {
    Key = "xF5gLpQ8Jm2eR9tY1a",
    Url = "https://pastebin.com/MRvfK7Jw",
    MaxAttempts = 3,
    CurrentAttempts = 0
}

-- Membuat ScreenGui (Wadah Utama)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TitleLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local KeyInput = Instance.new("TextBox")
local UICorner_Input = Instance.new("UICorner")
local VerifyButton = Instance.new("TextButton")
local UICorner_Verify = Instance.new("UICorner")
local GetKeyButton = Instance.new("TextButton")
local UICorner_GetKey = Instance.new("UICorner")
local StatusLabel = Instance.new("TextLabel")

-- Setup ScreenGui
ScreenGui.Name = "SecureKeyUI"
-- Cek lingkungan eksekusi untuk penempatan GUI yang tepat
if game:GetService("CoreGui") then
    ScreenGui.Parent = game:GetService("CoreGui")
else
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
ScreenGui.ResetOnSpawn = false

-- Setup MainFrame (Background)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100) -- Tengah Layar
MainFrame.Size = UDim2.new(0, 300, 0, 220)
MainFrame.ClipsDescendants = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Setup Title
TitleLabel.Name = "Title"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1.000
TitleLabel.Position = UDim2.new(0, 15, 0, 10)
TitleLabel.Size = UDim2.new(0, 200, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Обойдена защита *"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16.000
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Setup Close Button (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -35, 0, 10)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 16.000

-- Setup Input Key Box
KeyInput.Name = "KeyInput"
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
KeyInput.Position = UDim2.new(0.5, -130, 0, 60)
KeyInput.Size = UDim2.new(0, 260, 0, 40)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Enter Key Here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14.000
KeyInput.ClearTextOnFocus = false

UICorner_Input.CornerRadius = UDim.new(0, 6)
UICorner_Input.Parent = KeyInput

-- Setup Verify Button
VerifyButton.Name = "VerifyButton"
VerifyButton.Parent = MainFrame
VerifyButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110) -- Hijau
VerifyButton.Position = UDim2.new(0.5, -130, 0, 110)
VerifyButton.Size = UDim2.new(0, 125, 0, 35)
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.Text = "LOGIN"
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.TextSize = 14.000

UICorner_Verify.CornerRadius = UDim.new(0, 6)
UICorner_Verify.Parent = VerifyButton

-- Setup Get Key Button
GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Parent = MainFrame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200) -- Biru
GetKeyButton.Position = UDim2.new(0.5, 5, 0, 110)
GetKeyButton.Size = UDim2.new(0, 125, 0, 35)
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.Text = "GET KEY"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextSize = 14.000

UICorner_GetKey.CornerRadius = UDim.new(0, 6)
UICorner_GetKey.Parent = GetKeyButton

-- Setup Status Label
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.BackgroundTransparency = 1.000
StatusLabel.Position = UDim2.new(0, 0, 0, 160)
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Waiting for input..."
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.TextSize = 12.000

-------------------------------------------------------------------------
-- FUNGSI DRAGGABLE (MOBILE & PC FRIENDLY)
-------------------------------------------------------------------------
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-------------------------------------------------------------------------
-- ANIMASI & LOGIKA
-------------------------------------------------------------------------

local function animateButton(btn)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        local originalSize = btn.Size
        TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset - 5, originalSize.Y.Scale, originalSize.Y.Offset - 5)}):Play()
        wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.1), {Size = originalSize}):Play()
    end)
end

animateButton(VerifyButton)
animateButton(GetKeyButton)

-- Tombol X
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Tombol Get Key
GetKeyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(Config.Url)
        StatusLabel.Text = "Link copied to clipboard!"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        StatusLabel.Text = "Copy failed (Executor issue)"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Logika Utama
VerifyButton.MouseButton1Click:Connect(function()
    local inputKey = KeyInput.Text
    inputKey = inputKey:gsub("^%s*(.-)%s*$", "%1") -- Hapus spasi

    if inputKey == Config.Key then
        -- KEY BENAR
        StatusLabel.Text = "Access Granted! Loading..."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        
        -- Animasi Keluar
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
        wait(0.6)
        ScreenGui:Destroy()
        
        ----------------------------------------------------
        -- EKSEKUSI SCRIPT ANDA DI SINI
        ----------------------------------------------------
        loadstring(game:HttpGet("https://pastebin.com/raw/HxcBEfkf"))()
        
    else
        -- KEY SALAH
        Config.CurrentAttempts = Config.CurrentAttempts + 1
        local sisa = Config.MaxAttempts - Config.CurrentAttempts
        
        StatusLabel.Text = "Wrong Key! Attempts left: " .. sisa
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        KeyInput.Text = ""
        
        -- Animasi Shake
        local originalPos = MainFrame.Position
        for i = 1, 5 do
            MainFrame.Position = originalPos + UDim2.new(0, math.random(-5,5), 0, 0)
            wait(0.05)
        end
        MainFrame.Position = originalPos
        
        -- Logika KICK
        if Config.CurrentAttempts >= Config.MaxAttempts then
            LocalPlayer:Kick("Security: Failed to enter correct key 3 times.")
        end
    end
end)
