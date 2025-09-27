local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

-- Debug print to confirm script runs
print("Magic GUI initializing...")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Magic"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Loading Text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0.5, 0, 0.2, 0)
loadingText.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingText.AnchorPoint = Vector2.new(0.5, 0.5)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Magic V1"
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextScaled = true
loadingText.Font = Enum.Font.GothamBold
loadingText.TextTransparency = 1
loadingText.Parent = screenGui

-- Create Click Sound
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://500472891"
clickSound.Volume = 0.5
clickSound.Parent = screenGui

-- Create Snowflake Frame
local snowflakeFrame = Instance.new("Frame")
snowflakeFrame.Size = UDim2.new(1, 0, 1, 0)
snowflakeFrame.BackgroundTransparency = 1
snowflakeFrame.Parent = screenGui
snowflakeFrame.Visible = false

-- Snowflake Creation
local function createSnowflake()
    local snowflake = Instance.new("Frame")
    snowflake.Size = UDim2.new(0, 10, 0, 10)
    snowflake.Position = UDim2.new(math.random(), 0, 0, -10)
    snowflake.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    snowflake.BackgroundTransparency = 0.3
    snowflake.BorderSizePixel = 0
    snowflake.Parent = snowflakeFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.5, 0)
    corner.Parent = snowflake

    local tween = TweenService:Create(snowflake, TweenInfo.new(5 + math.random() * 5, Enum.EasingStyle.Linear), {
        Position = UDim2.new(snowflake.Position.X.Scale, 0, 1, 10)
    })
    tween:Play()
    tween.Completed:Connect(function()
        snowflake:Destroy()
    end)
end

-- Create Notification Frame
local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0, 300, 0, 80)
notificationFrame.Position = UDim2.new(0, 10, 0, 10)
notificationFrame.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
notificationFrame.BorderSizePixel = 0
notificationFrame.Visible = false
notificationFrame.Parent = screenGui

local notifCorner = Instance.new("UICorner")
notifCorner.CornerRadius = UDim.new(0, 8)
notifCorner.Parent = notificationFrame

local notifAvatar = Instance.new("ImageLabel")
notifAvatar.Size = UDim2.new(0, 60, 0, 60)
notifAvatar.Position = UDim2.new(0, 10, 0, 10)
notifAvatar.BackgroundTransparency = 1
notifAvatar.Parent = notificationFrame

local notifText = Instance.new("TextLabel")
notifText.Size = UDim2.new(0, 200, 0, 60)
notifText.Position = UDim2.new(0, 80, 0, 10)
notifText.BackgroundTransparency = 1
notifText.TextColor3 = Color3.fromRGB(255, 255, 255)
notifText.TextSize = 14
notifText.Font = Enum.Font.Gotham
notifText.TextXAlignment = Enum.TextXAlignment.Left
notifText.TextWrapped = true
notifText.Parent = notificationFrame

-- Create Header Label
local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(1, 0, 0, 50)
headerLabel.Position = UDim2.new(0, 0, 0, 0)
headerLabel.BackgroundTransparency = 1
headerLabel.Text = "Magic V1.0\nHit ] To Open/Close GUI"
headerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
headerLabel.TextSize = 20
headerLabel.Font = Enum.Font.GothamBold
headerLabel.TextXAlignment = Enum.TextXAlignment.Center
headerLabel.TextWrapped = true
headerLabel.Visible = false
headerLabel.Parent = screenGui

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui
print("Main frame created")

-- Fade-in Animation for Main GUI
local function fadeInGui()
    mainFrame.BackgroundTransparency = 1
    snowflakeFrame.Visible = mainFrame.Visible
    headerLabel.Visible = mainFrame.Visible
    local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0})
    tween:Play()
end

-- Rounded Corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -10, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Magic"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Tabs Container
local tabsContainer = Instance.new("Frame")
tabsContainer.Size = UDim2.new(1, 0, 0, 40)
tabsContainer.Position = UDim2.new(0, 0, 0, 40)
tabsContainer.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
tabsContainer.BorderSizePixel = 0
tabsContainer.Parent = mainFrame

-- Tab Buttons
local tabs = {"Basic", "Visuals", "Settings", "Overpowered", "Misc"}
local tabFrames = {}
local currentTab = nil

local function createTabButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 120, 1, 0)
    button.Position = UDim2.new(0, position * 120, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    button.Font = Enum.Font.Gotham
    button.BorderSizePixel = 0
    button.Parent = tabsContainer

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = button

    -- Hover Animation
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            Size = UDim2.new(0, 125, 1, 5),
            BackgroundColor3 = Color3.fromRGB(255, 200, 210)
        }):Play()
    end)
    button.MouseLeave:Connect(function()
        if currentTab ~= tabFrames[button] then
            TweenService:Create(button, TweenInfo.new(0.2), {
                Size = UDim2.new(0, 120, 1, 0),
                BackgroundColor3 = Color3.fromRGB(180, 180, 180)
            }):Play()
        end
    end)

    -- Tab Frame
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, 0, 1, -80)
    tabFrame.Position = UDim2.new(0, 0, 0, 80)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
    tabFrame.Parent = mainFrame

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -10, 1, -10)
    scrollFrame.Position = UDim2.new(0, 5, 0, 5)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.ScrollBarThickness = 4
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.Parent = tabFrame

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Padding = UDim.new(0, 10)
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.Parent = scrollFrame
    uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 20)
    end)

    button.MouseButton1Click:Connect(function()
        clickSound:Play()
        if currentTab then
            currentTab.Visible = false
            tabFrames[currentTab].BackgroundColor3 = Color3.fromRGB(180, 180, 180)
            tabFrames[currentTab].TextColor3 = Color3.fromRGB(255, 255, 255)
            TweenService:Create(tabFrames[currentTab], TweenInfo.new(0.2), {
                Size = UDim2.new(0, 120, 1, 0)
            }):Play()
        end
        tabFrame.Visible = true
        button.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        currentTab = tabFrame
        print("Switched to tab: " .. name)
    end)

    tabFrames[tabFrame] = button
    return tabFrame
end

-- Create Tabs
local tabContent = {}
for i, tabName in ipairs(tabs) do
    tabContent[tabName] = createTabButton(tabName, i - 1)
end

-- Dropdown and Slider Creation
local function createDropdown(title, parent, items, callback)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Size = UDim2.new(1, -20, 0, 30)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    dropdownFrame.Parent = parent
    dropdownFrame.LayoutOrder = 1000 -- Set high to ensure it appears at the bottom

    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 5)
    dropdownCorner.Parent = dropdownFrame

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Size = UDim2.new(1, 0, 1, 0)
    dropdownButton.BackgroundTransparency = 1
    dropdownButton.Text = title .. ": Select"
    dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownButton.TextSize = 14
    dropdownButton.Font = Enum.Font.Gotham
    dropdownButton.Parent = dropdownFrame

    -- Hover Animation
    dropdownButton.MouseEnter:Connect(function()
        TweenService:Create(dropdownFrame, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 200, 210)
        }):Play()
    end)
    dropdownButton.MouseLeave:Connect(function()
        TweenService:Create(dropdownFrame, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(180, 180, 180)
        }):Play()
    end)

    local dropdownList = Instance.new("Frame")
    dropdownList.Size = UDim2.new(1, 0, 0, #items * 30)
    dropdownList.Position = UDim2.new(0, 0, 1, 5)
    dropdownList.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    dropdownList.Visible = false
    dropdownList.Parent = dropdownFrame

    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 5)
    listCorner.Parent = dropdownList

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = dropdownList

    local function populateItems()
        for i, item in ipairs(items) do
            local itemButton = Instance.new("TextButton")
            itemButton.Size = UDim2.new(1, 0, 0, 30)
            itemButton.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
            itemButton.Text = item
            itemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            itemButton.TextSize = 14
            itemButton.Font = Enum.Font.Gotham
            itemButton.Parent = dropdownList

            itemButton.MouseEnter:Connect(function()
                TweenService:Create(itemButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(255, 200, 210)
                }):Play()
            end)
            itemButton.MouseLeave:Connect(function()
                TweenService:Create(itemButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(170, 170, 170)
                }):Play()
            end)

            itemButton.MouseButton1Click:Connect(function()
                clickSound:Play()
                dropdownButton.Text = title .. ": " .. item
                dropdownList.Visible = false
                callback(item)
            end)
        end
    end
    populateItems()

    dropdownButton.MouseButton1Click:Connect(function()
        clickSound:Play()
        dropdownList.Visible = not dropdownList.Visible
        parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y + (dropdownList.Visible and dropdownList.Size.Y.Offset + 20 or 20))
    end)

    parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y + 20)

    return dropdownButton, dropdownList, title
end

local function updateDropdown(dropdownButton, dropdownList, title, items, callback)
    for _, child in ipairs(dropdownList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    dropdownList.Size = UDim2.new(1, 0, 0, #items * 30)

    for i, item in ipairs(items) do
        local itemButton = Instance.new("TextButton")
        itemButton.Size = UDim2.new(1, 0, 0, 30)
        itemButton.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
        itemButton.Text = item
        itemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemButton.TextSize = 14
        itemButton.Font = Enum.Font.Gotham
        itemButton.Parent = dropdownList

        itemButton.MouseEnter:Connect(function()
            TweenService:Create(itemButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(255, 200, 210)
            }):Play()
        end)
        itemButton.MouseLeave:Connect(function()
            TweenService:Create(itemButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(170, 170, 170)
            }):Play()
        end)

        itemButton.MouseButton1Click:Connect(function()
            clickSound:Play()
            dropdownButton.Text = title .. ": " .. item
            dropdownList.Visible = false
            callback(item)
        end)
    end
end

local function createSlider(title, parent, min, max, default, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -20, 0, 50)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    sliderFrame.Parent = parent

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 5)
    sliderCorner.Parent = sliderFrame

    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Size = UDim2.new(1, -10, 0, 20)
    sliderLabel.Position = UDim2.new(0, 5, 0, 5)
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Text = title .. ": " .. default
    sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderLabel.TextSize = 14
    sliderLabel.Font = Enum.Font.Gotham
    sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    sliderLabel.Parent = sliderFrame

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, -10, 0, 10)
    sliderBar.Position = UDim2.new(0, 5, 0, 30)
    sliderBar.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
    sliderBar.Parent = sliderFrame

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 5)
    barCorner.Parent = sliderBar

    local sliderKnob = Instance.new("Frame")
    sliderKnob.Size = UDim2.new(0, 20, 0, 20)
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderKnob.Position = UDim2.new((default - min) / (max - min), -10, 0, 25)
    sliderKnob.Parent = sliderFrame

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(0, 10)
    knobCorner.Parent = sliderKnob

    local dragging = false
    sliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    sliderKnob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            sliderKnob.Position = UDim2.new(relativeX, -10, 0, 25)
            local value = math.floor(min + (max - min) * relativeX)
            sliderLabel.Text = title .. ": " .. value
            callback(value)
        end
    end)

    parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y + 20)
end

local function createToggle(title, parent, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -20, 0, 30)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    toggleFrame.Parent = parent

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 5)
    toggleCorner.Parent = toggleFrame

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(0.8, 0, 1, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = title
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.TextSize = 14
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggleFrame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 40, 0, 20)
    toggleButton.Position = UDim2.new(1, -50, 0, 5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
    toggleButton.Text = "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 14
    toggleButton.Font = Enum.Font.Gotham
    toggleButton.Parent = toggleFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = toggleButton

    local isToggled = false
    toggleButton.MouseEnter:Connect(function()
        TweenService:Create(toggleButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 200, 210)
        }):Play()
    end)
    toggleButton.MouseLeave:Connect(function()
        TweenService:Create(toggleButton, TweenInfo.new(0.2), {
            BackgroundColor3 = isToggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(255, 182, 193)
        }):Play()
    end)

    toggleButton.MouseButton1Click:Connect(function()
        clickSound:Play()
        isToggled = not isToggled
        toggleButton.Text = isToggled and "ON" or "OFF"
        toggleButton.BackgroundColor3 = isToggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(255, 182, 193)
        callback(isToggled)
    end)

    parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y + 20)
end

local function createTextBox(title, parent, callback)
    local textBoxFrame = Instance.new("Frame")
    textBoxFrame.Size = UDim2.new(1, -20, 0, 30)
    textBoxFrame.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    textBoxFrame.Parent = parent

    local textBoxCorner = Instance.new("UICorner")
    textBoxCorner.CornerRadius = UDim.new(0, 5)
    textBoxCorner.Parent = textBoxFrame

    local textBoxLabel = Instance.new("TextLabel")
    textBoxLabel.Size = UDim2.new(0.4, 0, 1, 0)
    textBoxLabel.BackgroundTransparency = 1
    textBoxLabel.Text = title
    textBoxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBoxLabel.TextSize = 14
    textBoxLabel.Font = Enum.Font.Gotham
    textBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
    textBoxLabel.Parent = textBoxFrame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.6, 0, 1, 0)
    textBox.Position = UDim2.new(0.4, 0, 0, 0)
    textBox.BackgroundTransparency = 1
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.TextSize = 14
    textBox.Font = Enum.Font.Gotham
    textBox.Parent = textBoxFrame

    textBox.FocusLost:Connect(function()
        callback(textBox.Text)
    end)

    parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y + 20)
end

-- Fly Functionality (BodyVelocity-based)
local flyBodyGyro = nil
local flyBodyVelocity = nil
local flyConnection = nil
local function toggleFly(enabled)
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    if enabled then
        flyBodyGyro = Instance.new("BodyGyro")
        flyBodyGyro.P = 9e4
        flyBodyGyro.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
        flyBodyGyro.CFrame = rootPart.CFrame
        flyBodyGyro.Parent = rootPart

        flyBodyVelocity = Instance.new("BodyVelocity")
        flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyBodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        flyBodyVelocity.Parent = rootPart

        flyConnection = RunService.RenderStepped:Connect(function()
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
            if flyBodyGyro and flyBodyVelocity then
                flyBodyGyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                local move = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    move = move + workspace.CurrentCamera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    move = move - workspace.CurrentCamera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    move = move + workspace.CurrentCamera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    move = move - workspace.CurrentCamera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    move = move + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    move = move - Vector3.new(0, 1, 0)
                end
                if move.Magnitude > 0 then
                    flyBodyVelocity.Velocity = move.Unit * _G.FlySpeed
                else
                    flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        if flyBodyGyro then
            flyBodyGyro:Destroy()
            flyBodyGyro = nil
        end
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end

-- Noclip Functionality
local noclipConnection = nil
local function toggleNoclip(enabled)
    local character = LocalPlayer.Character
    if not character then return end

    if enabled then
        noclipConnection = RunService.Stepped:Connect(function()
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- ESP Functionality
local espConnections = {}
local espHighlights = {}
local espBillboards = {}
local espDistanceLabels = {}
local espPlayerAddedConnection = nil
local espUpdateConnection = nil
local function createESP(player, espType)
    if player == LocalPlayer or not player.Character then return end

    local character = player.Character
    local head = character:FindFirstChild("Head")
    if not head then return end

    if espType == "Chams" then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = character
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.FillColor = Color3.fromRGB(255, 182, 193)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.Parent = character
        espHighlights[player] = highlight

        local connection = player.CharacterAdded:Connect(function(newChar)
            highlight.Adornee = newChar
        end)
        espConnections[player] = connection
    elseif espType == "Name" or espType == "Name + Distance" then
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 100, 0, espType == "Name + Distance" and 60 or 30)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.DisplayName or player.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 182, 193)
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Parent = billboard

        if espType == "Name + Distance" then
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.Text = "Distance: Calculating..."
            distanceLabel.TextColor3 = Color3.fromRGB(255, 182, 193)
            distanceLabel.TextSize = 14
            distanceLabel.Font = Enum.Font.GothamBold
            distanceLabel.Parent = billboard
            espDistanceLabels[player] = distanceLabel
        end

        espBillboards[player] = billboard

        local connection = player.CharacterAdded:Connect(function(newChar)
            local newHead = newChar:WaitForChild("Head")
            billboard.Parent = newHead
        end)
        espConnections[player] = connection
    end
end

local function updateESP_distances()
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    for player, label in pairs(espDistanceLabels) do
        local theirRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if theirRoot then
            local distance = (myRoot.Position - theirRoot.Position).Magnitude
            label.Text = "Distance: " .. math.floor(distance) .. " studs"
        else
            label.Text = "Distance: N/A"
        end
    end
end

local function toggleESP(enabled, espType)
    if espPlayerAddedConnection then
        espPlayerAddedConnection:Disconnect()
        espPlayerAddedConnection = nil
    end
    if espUpdateConnection then
        espUpdateConnection:Disconnect()
        espUpdateConnection = nil
    end
    for _, connection in pairs(espConnections) do
        connection:Disconnect()
    end
    for _, highlight in pairs(espHighlights) do
        highlight:Destroy()
    end
    for _, billboard in pairs(espBillboards) do
        billboard:Destroy()
    end
    espConnections = {}
    espHighlights = {}
    espBillboards = {}
    espDistanceLabels = {}

    if enabled and espType ~= "None" then
        for _, player in pairs(Players:GetPlayers()) do
            createESP(player, espType)
        end
        espPlayerAddedConnection = Players.PlayerAdded:Connect(function(player)
            createESP(player, espType)
        end)
        if espType == "Name + Distance" then
            espUpdateConnection = RunService.Heartbeat:Connect(updateESP_distances)
        end
    end
end

-- Fling Functionality
local hiddenfling = false
local function fling()
    local lp = Players.LocalPlayer
    local c, hrp, vel, movel = nil, nil, nil, 0.1

    while hiddenfling do
        RunService.Heartbeat:Wait()
        c = lp.Character
        hrp = c and c:FindFirstChild("HumanoidRootPart")

        if hrp then
            vel = hrp.Velocity
            hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
            RunService.RenderStepped:Wait()
            hrp.Velocity = vel
            RunService.Stepped:Wait()
            hrp.Velocity = vel + Vector3.new(0, movel, 0)
            movel = -movel
        else
            break
        end
    end
end

local function targetFling(targetPlayer)
    local lp = Players.LocalPlayer
    local character = lp.Character
    local targetChar = targetPlayer.Character
    if not character or not targetChar then return end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
    if not rootPart or not targetRoot then return end

    local originalPos = rootPart.CFrame
    local startTime = tick()
    local flingConnection

    flingConnection = RunService.Heartbeat:Connect(function()
        if tick() - startTime >= 3 then
            rootPart.CFrame = originalPos
            flingConnection:Disconnect()
            return
        end
        if targetRoot and rootPart then
            rootPart.CFrame = targetRoot.CFrame
        end
    end)
end

-- Aimbot Functionality
local aimbotEnabled = false
local aimbotConnection = nil
local aimbotKey = Enum.KeyCode.F  -- Bind to F key
local function toggleAimbot(enabled)
    aimbotEnabled = enabled
    if enabled then
        aimbotConnection = RunService.RenderStepped:Connect(function()
            local closestPlayer, closestDistance = nil, math.huge
            local mousePos = UserInputService:GetMouseLocation()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head
                    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
            if closestPlayer and closestDistance < 50 then  -- Adjust sensitivity
                local targetHead = closestPlayer.Character.Head
                local direction = (targetHead.Position - Camera.CFrame.Position).Unit
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + direction)
            end
        end)
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
            aimbotConnection = nil
        end
    end
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == aimbotKey then
        toggleAimbot(not aimbotEnabled)
    end
end)

-- Notification System
local function showNotification(player)
    if not _G.NotificationsEnabled then return end
    
    local displayName = player.DisplayName or player.Name
    local userId = player.UserId
    notifAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=60&h=60"
    notifText.Text = displayName .. " has joined the game!"
    
    notificationFrame.Visible = true
    wait(5)
    local tween = TweenService:Create(notificationFrame, TweenInfo.new(0.5), {Position = UDim2.new(0, -310, 0, 10)})
    tween:Play()
    tween.Completed:Wait()
    notificationFrame.Visible = false
    notificationFrame.Position = UDim2.new(0, 10, 0, 10)
end

-- Global Variables
_G.FlySpeed = 50
_G.SpeedBoost = 16
_G.JumpBoost = 50
_G.NotificationsEnabled = false
_G.ESPEnabled = false
_G.ESPType = "None"
_G.FlingAllEnabled = false
_G.ChatSpamMessage = ""
_G.ChatSpamDelay = 1
_G.ChatSpamEnabled = false
_G.SpeedBoostEnabled = false
_G.JumpBoostEnabled = false
_G.NoFogEnabled = false
_G.TimeOfDay = 12
_G.Brightness = 1
_G.FullBrightEnabled = false

-- Function to get player names
local function getPlayerNames()
    local names = {"None"}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(names, player.Name)
        end
    end
    return names
end

-- Apply cheats on character added
LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    if _G.SpeedBoostEnabled then
        humanoid.WalkSpeed = _G.SpeedBoost
    else
        humanoid.WalkSpeed = 16
    end
    if _G.JumpBoostEnabled then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = _G.JumpBoost
    else
        humanoid.UseJumpPower = true
        humanoid.JumpPower = 50
    end
end)

-- Populate Basic Tab
local basicTab = tabContent["Basic"]
createToggle("Fly", basicTab.ScrollingFrame, toggleFly)
createSlider("Fly Speed", basicTab.ScrollingFrame, 0, 500, 50, function(value)
    _G.FlySpeed = value
end)
createToggle("Speed Boost", basicTab.ScrollingFrame, function(enabled)
    _G.SpeedBoostEnabled = enabled
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = enabled and _G.SpeedBoost or 16
    end
end)
createSlider("Speed Boost", basicTab.ScrollingFrame, 16, 500, 16, function(value)
    _G.SpeedBoost = value
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)
createToggle("Jump Boost", basicTab.ScrollingFrame, function(enabled)
    _G.JumpBoostEnabled = enabled
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.UseJumpPower = true
        character.Humanoid.JumpPower = enabled and _G.JumpBoost or 50
    end
end)
createSlider("Jump Boost", basicTab.ScrollingFrame, 50, 500, 50, function(value)
    _G.JumpBoost = value
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = value
    end
end)
createToggle("Noclip", basicTab.ScrollingFrame, toggleNoclip)

-- Populate Visuals Tab
local visualsTab = tabContent["Visuals"]
createToggle("ESP", visualsTab.ScrollingFrame, function(enabled)
    _G.ESPEnabled = enabled
    toggleESP(enabled, _G.ESPType or "None")
end)
createDropdown("ESP Type", visualsTab.ScrollingFrame, {"None", "Chams", "Name", "Name + Distance"}, function(value)
    _G.ESPType = value
    toggleESP(_G.ESPEnabled or false, value)
end)

-- Populate Settings Tab
local settingsTab = tabContent["Settings"]
createToggle("Notifications", settingsTab.ScrollingFrame, function(enabled)
    _G.NotificationsEnabled = enabled
end)
createSlider("FOV", settingsTab.ScrollingFrame, 70, 500, 70, function(value)
    Camera.FieldOfView = value
end)
createToggle("No Fog", settingsTab.ScrollingFrame, function(enabled)
    _G.NoFogEnabled = enabled
    if enabled then
        game.Lighting.FogEnd = 100000
    else
        game.Lighting.FogEnd = 1000
    end
end)
createSlider("Time of Day", settingsTab.ScrollingFrame, 0, 24, 12, function(value)
    _G.TimeOfDay = value
    game.Lighting.TimeOfDay = value .. ":00:00"
end)
createSlider("Brightness", settingsTab.ScrollingFrame, 0, 10, 1, function(value)
    _G.Brightness = value
    Lighting.Brightness = value
end)
createToggle("Full Bright", settingsTab.ScrollingFrame, function(enabled)
    _G.FullBrightEnabled = enabled
    if enabled then
        Lighting.GlobalShadows = false
        Lighting.Brightness = 3
        Lighting.FogEnd = 100000
    else
        Lighting.GlobalShadows = true
        Lighting.Brightness = _G.Brightness
        Lighting.FogEnd = _G.NoFogEnabled and 100000 or 1000
    end
end)

-- Populate Overpowered Tab
local overpoweredTab = tabContent["Overpowered"]
createToggle("WalkFling", overpoweredTab.ScrollingFrame, function(enabled)
    hiddenfling = enabled
    if enabled then
        spawn(fling)
    end
end)
createToggle("Fling All", overpoweredTab.ScrollingFrame, function(enabled)
    _G.FlingAllEnabled = enabled
    if enabled then
        spawn(function()
            while _G.FlingAllEnabled do
                local players = Players:GetPlayers()
                table.sort(players, function(a, b)
                    return a.DisplayName < b.DisplayName
                end)
                for _, plr in ipairs(players) do
                    if plr ~= LocalPlayer and _G.FlingAllEnabled then
                        targetFling(plr)
                        wait(3.5)
                    end
                end
                wait(1)
            end
        end)
    end
end)
local function targetFlingCallback(value)
    if value == "None" then return end
    local target = Players:FindFirstChild(value)
    if target then
        targetFling(target)
    end
end
local targetFlingButton, targetFlingList, targetFlingTitle = createDropdown("Target Fling", overpoweredTab.ScrollingFrame, getPlayerNames(), targetFlingCallback)

-- Populate Misc Tab
local miscTab = tabContent["Misc"]
local clickTPConnection = nil
createToggle("Click TP", miscTab.ScrollingFrame, function(enabled)
    if enabled then
        local mouse = LocalPlayer:GetMouse()
        clickTPConnection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and not mainFrame.Visible then
                if mouse.Target then
                    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 5, 0))
                    end
                end
            end
        end)
    else
        if clickTPConnection then
            clickTPConnection:Disconnect()
            clickTPConnection = nil
        end
    end
end)
createToggle("Aimbot (F Key)", miscTab.ScrollingFrame, toggleAimbot)
createTextBox("Spam Message", miscTab.ScrollingFrame, function(text)
    _G.ChatSpamMessage = text
end)
createSlider("Spam Delay (s)", miscTab.ScrollingFrame, 1, 10, 1, function(value)
    _G.ChatSpamDelay = value
end)
createToggle("Spam Chat", miscTab.ScrollingFrame, function(enabled)
    _G.ChatSpamEnabled = enabled
    if enabled then
        spawn(function()
            while _G.ChatSpamEnabled do
                if _G.ChatSpamMessage ~= "" then
                    ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(_G.ChatSpamMessage, "All")
                end
                wait(_G.ChatSpamDelay)
            end
        end)
    end
end)
local function tpPlayerCallback(value)
    if value == "None" then return end
    local target = Players:FindFirstChild(value)
    if target and target.Character then
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        if root and targetRoot then
            root.CFrame = targetRoot.CFrame + Vector3.new(0, 0, 3)
        end
    end
end
local tpPlayerButton, tpPlayerList, tpPlayerTitle = createDropdown("TP to Player", miscTab.ScrollingFrame, getPlayerNames(), tpPlayerCallback)

-- Update player dropdowns
local function updatePlayerDropdowns()
    local names = getPlayerNames()
    updateDropdown(targetFlingButton, targetFlingList, targetFlingTitle, names, targetFlingCallback)
    updateDropdown(tpPlayerButton, tpPlayerList, tpPlayerTitle, names, tpPlayerCallback)
    -- Update canvas size for tabs containing dropdowns
    for _, tabName in ipairs({"Visuals", "Overpowered", "Misc"}) do
        local scrollFrame = tabContent[tabName].ScrollingFrame
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, scrollFrame.UIListLayout.AbsoluteContentSize.Y + 20)
    end
end

Players.PlayerAdded:Connect(updatePlayerDropdowns)
Players.PlayerAdded:Connect(showNotification)
Players.PlayerRemoving:Connect(updatePlayerDropdowns)

-- Make GUI Draggable
local dragging
local dragInput
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Toggle GUI Visibility
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightBracket then
        mainFrame.Visible = not mainFrame.Visible
        snowflakeFrame.Visible = mainFrame.Visible
        headerLabel.Visible = mainFrame.Visible
        fadeInGui()
        print("GUI toggled: " .. tostring(mainFrame.Visible))
    end
end)

-- Snowflake Animation Loop
spawn(function()
    while true do
        if snowflakeFrame.Visible then
            createSnowflake()
        end
        wait(0.1) -- Increased spawn rate for more snowflakes
    end
end)

-- Initialize first tab
tabContent["Basic"].Visible = true
tabFrames[tabContent["Basic"]].BackgroundColor3 = Color3.fromRGB(255, 182, 193)
tabFrames[tabContent["Basic"]].TextColor3 = Color3.fromRGB(255, 255, 255)
currentTab = tabContent["Basic"]
print("Basic tab initialized")

-- Cleanup on player leave
LocalPlayer.CharacterRemoving:Connect(function()
    toggleFly(false)
    toggleNoclip(false)
    hiddenfling = false
    _G.FlingAllEnabled = false
    toggleAimbot(false)
    _G.ChatSpamEnabled = false
end)

-- Loading Animation
local fadeInTween = TweenService:Create(loadingText, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {TextTransparency = 0})
local fadeOutTween = TweenService:Create(loadingText, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {TextTransparency = 1})
fadeInTween:Play()
fadeInTween.Completed:Connect(function()
    fadeOutTween:Play()
    fadeOutTween.Completed:Connect(function()
        loadingText:Destroy()
        mainFrame.Visible = true
        fadeInGui()
        print("Loading animation completed, main GUI loaded")
    end)
end)

print("Magic GUI initialization started")
