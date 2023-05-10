-- tracking aimbot script made by YellowGreg and Mmsvon
-- https://github.com/YellowGreg/
-- https://github.com/StevenK-293/

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = game.Workspace.CurrentCamera

-- Change these settings to your liking
local FOV = 30
local Smoothness = 10
local TeamCheck = true

-- Modify these colors to your liking
local FriendlyColor = Color3.fromRGB(0, 255, 0) -- Green
local EnemyColor = Color3.fromRGB(255, 0, 0) -- Red

-- Checks if a player is on the same team as the local player
local function isTeammate(player)
    return TeamCheck and player.TeamColor == LocalPlayer.TeamColor
end

-- Returns the closest player to the crosshair within the specified FOV
local function getClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if not isTeammate(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Humanoid.Health > 0 then
            local distance = (Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position) - Vector3.new(Mouse.X, Mouse.Y, 0)).magnitude
            if distance < closestDistance and distance <= FOV then
                closestPlayer = player
                closestDistance = distance
            end
        end
    end

    return closestPlayer
end

-- Draws a box around the player's head to indicate target
local function drawBox(player)
    local character = player.Character
    if character and character:FindFirstChild("Head") then
        local head = character.Head
        local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
        if onScreen then
            local distance = (headPos - Vector3.new(Mouse.X, Mouse.Y, 0)).magnitude
            if distance <= FOV then
                local size = math.clamp(2000 / distance, 2, 10)
                local color = isTeammate(player) and FriendlyColor or EnemyColor
                local box = Drawing.new("Square")
                box.Visible = true
                box.Thickness = 2
                box.Color = color
                box.Filled = false
                box.Size = Vector2.new(size, size)
                box.Position = Vector2.new(headPos.X - size / 2, headPos.Y - size / 2)
                box.Transparency = 0.7
                box.ZIndex = 2
                box.Parent = Drawing
            end
        end
    end
end

-- Aimbot loop
while true do
    local target = getClosestPlayer()
    if target then
        local targetPosition = Camera:WorldToViewportPoint(target.Character.Head.Position)
        local mousePosition = Vector2.new(Mouse.X, Mouse.Y)
        local distance = (targetPosition - mousePosition).magnitude

        if distance <= FOV then
            local smoothnessFactor = math.clamp(distance / FOV * Smoothness, 0, 1)
            local newMousePosition = mousePosition + (targetPosition - mousePosition) * smoothnessFactor
            Mouse.MoveTo(newMousePosition.X, newMousePosition.Y)
            drawBox(target)
        end
    end

    wait()
end
