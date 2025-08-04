local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Полет
local BodyGyro = Instance.new("BodyGyro")
local BodyVelocity = Instance.new("BodyVelocity")

BodyGyro.Parent = Character.PrimaryPart
BodyGyro.maxTorque = Vector3.new(4000, 4000, 4000)
BodyGyro.P = 9e4
BodyGyro.D = 1000

BodyVelocity.Parent = Character.PrimaryPart
BodyVelocity.velocity = Vector3.new(0, 0, 0)
BodyVelocity.maxForce = Vector3.new(4000, 4000, 4000)

local function update()
    if Humanoid.PlatformStand then
        BodyVelocity.velocity = Vector3.new(0, 0, 0)
    else
        BodyVelocity.velocity = Vector3.new(0, 50, 0)
    end
end

game:GetService("RunService").Stepped:Connect(update)

-- Wallhack
local function wallhack()
    for _, part in pairs(workspace:GetChildren()) do
        if part:IsA("BasePart") and part.CanCollide then
            part.Transparency = 0.5
        end
    end
end

wallhack()

-- Добавляем надпись на экран
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
TextLabel.Parent = ScreenGui
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Text = "creator — qqwentyx"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.TextWrapped = true
