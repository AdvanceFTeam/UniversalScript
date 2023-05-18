-- Universal Hitbox
-- Created by YellowGreg, Wspboy12, MMSVon

local settings = {
    HeadSize = 20,
    HeadColor = Color3.new(153, 0, 0),
    HeadTransparency = 0.5,
    BodySize = Vector3.new(2, 3, 1),
    BodyColor = Color3.new(0, 0, 1),
    BodyTransparency = 0.5,
    CanCollide = false,
    -- add more settings here if desired
}

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local function modifyHead(head)
    if head and head:IsA("BasePart") then
        head.Size = Vector3.new(settings.HeadSize, settings.HeadSize, settings.HeadSize)
        head.Color = settings.HeadColor
        head.Transparency = settings.HeadTransparency
        head.CanCollide = settings.CanCollide
    end
end

local function modifyBody(body)
    if body and body:IsA("BasePart") then
        body.Size = settings.BodySize
        body.Color = settings.BodyColor
        body.Transparency = settings.BodyTransparency
        body.CanCollide = settings.CanCollide
    end
end

local function modifyCharacter(character)
    if character then
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        if humanoidRootPart then
            for _, part in ipairs(character:GetDescendants()) do
                if part.Name == "Head" then
                    modifyHead(part)
                elseif part:IsA("BasePart") and part ~= humanoidRootPart then
                    modifyBody(part)
                end
            end

            character.ChildAdded:Connect(function(child)
                if child.Name == "Head" then
                    modifyHead(child)
                elseif child:IsA("BasePart") and child ~= humanoidRootPart then
                    modifyBody(child)
                end
            end)
        end
    end
end

local function modifyAllPlayers()
    for _, player in ipairs(players:GetPlayers()) do
        if player ~= localPlayer then
            modifyCharacter(player.Character)
            player.CharacterAdded:Connect(function(character)
                modifyCharacter(character)
            end)
        end
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        modifyCharacter(character)
    end)
end

players.PlayerAdded:Connect(onPlayerAdded)

modifyAllPlayers()
