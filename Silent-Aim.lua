-- Universal Silent Aim Script
-- Created By YellowGreg, Wspboy12

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = nil
local RunService = game:GetService("RunService")

local fov = 100 -- The FOV radius
local circle = Drawing.new("Circle") -- The circle object for drawing the FOV
circle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2) -- Centered position of the circle
circle.Thickness = 1 -- The thickness of the circle
circle.Radius = fov -- The radius of the circle
circle.Color = Color3.fromRGB(255, 255, 255) -- The color of the circle

local features = {
  silentaim = true
}

function getNearestEnemy()
  local nearestMagnitude = math.huge
  local nearestEnemy = nil
  for i, enemy in ipairs(Players:GetPlayers()) do
    if enemy ~= LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") and
        enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then
      local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character.HumanoidRootPart.Position)
      if onScreen then
        local ray = Ray.new(Camera.CFrame.Position, (enemy.Character.Head.Position - Camera.CFrame.Position).unit * 500)
        local hitPart, hitPosition, hitNormal = workspace:FindPartOnRayWithIgnoreList(ray, { LocalPlayer.Character })

        if hitPart and hitPart:IsDescendantOf(enemy.Character) then
          local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
          if magnitude < nearestMagnitude and magnitude <= fov then
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
  local args = { ... }
  if string.find(method, 'Ray') and target then
    args[2] = Ray.new(Camera.CFrame.Position, (target.Position - Camera.CFrame.Position).unit * 500)
  end
  return oldNamecall(unpack(args))
end)
setreadonly(meta, true)

RunService:BindToRenderStep("silentaim", 1, function()
  circle.Visible = features.silentaim -- Show or hide the FOV circle based on the value of 'features.silentaim'

  if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and features.silentaim and
      LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and
      LocalPlayer.Character.Humanoid.Health > 0 then
    local nearestEnemy = getNearestEnemy()
    if nearestEnemy and nearestEnemy.Character and nearestEnemy.Character:FindFirstChild("Humanoid") and
        nearestEnemy.Character.Humanoid.Health > 0 then
      local vector, onScreen = Camera:WorldToScreenPoint(nearestEnemy.Character.Head.Position)
      local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector
        .Y)).magnitude
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
