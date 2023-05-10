local settings = {
    HeadSize = 20,
    Transparency = 0.7,
    BrickColor = BrickColor.new("Really blue"),
    Material = Enum.Material.Neon,
    CanCollide = false,
    -- add more settings here if desired
}

local teamCheck = true -- set to true to only modify non-teammates
local friendlyColor = BrickColor.new("Bright green")
local enemyColor = BrickColor.new("Really red")

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local localTeam = localPlayer.Team

local function modifyHead(head)
    if head and head:IsA("BasePart") then
        local color = settings.BrickColor
        if teamCheck and head.Parent.Team == localTeam then
            color = friendlyColor
        elseif teamCheck then
            color = enemyColor
        end
        head.Transparency = settings.Transparency
        head.CanCollide = settings.CanCollide
        head.BrickColor = color
        head.Material = settings.Material
        head.Size = Vector3.new(settings.HeadSize, settings.HeadSize, settings.HeadSize)
    end
end

for _, player in ipairs(players:GetPlayers()) do
    if player ~= localPlayer then
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            modifyHead(humanoidRootPart and humanoidRootPart.Head)
            character.ChildAdded:Connect(function(child)
                if child.Name == "Head" then
                    modifyHead(child)
                end
            end)
            character:GetPropertyChangedSignal("Team"):Connect(function()
                localTeam = localPlayer.Team
                modifyHead(humanoidRootPart and humanoidRootPart.Head)
            end)
        end
    end
end
