-- Blade Ball Auto Parry Menu

local autoParryEnabled = false

local function parry()
    local char = game.Players.LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

-- Simple UI
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "AutoParryMenu"

ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 200, 0, 50)
ToggleButton.Position = UDim2.new(0.5, -100, 0.1, 0)
ToggleButton.Text = "Auto Parry: OFF"
ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24

ToggleButton.MouseButton1Click:Connect(function()
    autoParryEnabled = not autoParryEnabled
    ToggleButton.Text = "Auto Parry: " .. (autoParryEnabled and "ON" or "OFF")
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if autoParryEnabled then
        parry()
    end
end)