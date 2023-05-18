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

for _, player in ipairs(players:GetPlayers()) do
    if player ~= localPlayer then
        local character = player.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part.Name == "Head" then
                    modifyHead(part)
                elseif part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    modifyBody(part)
                end
            end

            character.ChildAdded:Connect(function(child)
                if child.Name == "Head" then
                    modifyHead(child)
                elseif child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
                    modifyBody(child)
                end
            end)
        end
    end
end
