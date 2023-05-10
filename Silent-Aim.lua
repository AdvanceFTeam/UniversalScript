-- Universal Silent Aim Script
-- Modify By YellowGreg, Wspboy12

--[[

TODO:
--// Main
- Add TeamCheck
- Add Visible Check
- Add Target Part
- Add Silent Aim Method
- Add Target Prediction
- Add Visual ESP
- Need to Fix FOV Circle

]]--

--[[ 
Note: We were dumb because we tried to modify this script to have a hitchance,
but that was not universal for all game but for arsenal, 
so we just modify the script to be universal for some fps game and so it can be functional with no error.
]]--


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = nil
local RunService = game:GetService("RunService")

local features = {
    silentaim = true;
    fov = 500;
}

function getNearestEnemy()
    local nearestMagnitude = math.huge
    local nearestEnemy = nil
    for i, enemy in ipairs(Players:GetPlayers()) do
        if enemy ~= LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") and enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then
            local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character.HumanoidRootPart.Position)
            if onScreen then
                local ray = Ray.new(Camera.CFrame.Position, (enemy.Character.Head.Position - Camera.CFrame.Position).unit * 500)
                local hitPart, hitPosition, hitNormal = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})

                if hitPart and hitPart:IsDescendantOf(enemy.Character) then
                    local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
                    if magnitude < nearestMagnitude and magnitude <= features.fov then
                        nearestEnemy = enemy
                        nearestMagnitude = magnitude
                    end
                end
            end
        end
    end
    return nearestEnemy
end

local meta = getrawmetatable(game)
setreadonly(meta, false)
local oldNamecall = meta.__namecall
meta.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}
    if string.find(method, 'Ray') and target then
        args[2] = Ray.new(Camera.CFrame.Position, (target.Position - Camera.CFrame.Position).unit * 500)
    end
    return oldNamecall(unpack(args))
end)
setreadonly(meta, true)

RunService:BindToRenderStep("silentaim", 1, function()
    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and features.silentaim and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then
        local nearestEnemy = getNearestEnemy()
        if nearestEnemy and nearestEnemy.Character and nearestEnemy.Character:FindFirstChild("Humanoid") and nearestEnemy.Character.Humanoid.Health > 0 then
            local vector, onScreen = Camera:WorldToScreenPoint(nearestEnemy.Character.Head.Position)
            local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
            if magnitude <= features.fov then
                target = workspace[nearestEnemy.Name].Head
            else
                target = nil
            end
        else
            target = nil
        end
    else
        target = nil
    end
end)
