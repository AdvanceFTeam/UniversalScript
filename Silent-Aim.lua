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

]] --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = nil
local RunService = game:GetService("RunService")
local aimbotting = false

local features = {
  silentaim = true;
  fov = 500;
  teamcheck = true;
  visiblecheck = true;
  targetpart = "Head";
  prediction = true;
  esp = true;
}

function getNearestEnemy()
  local nearestMagnitude = math.huge
  local nearestEnemy = nil
  for i, enemy in ipairs(Players:GetPlayers()) do
    if enemy ~= LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") and
        enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then
      if features.teamcheck and enemy.TeamColor == LocalPlayer.TeamColor then
        continue
      end
      local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character[features.targetpart].Position)
      if onScreen then
        local ray = Ray.new(Camera.CFrame.Position,
          (enemy.Character[features.targetpart].Position - Camera.CFrame.Position).unit * 500)
        local hitPart, hitPosition, hitNormal = workspace:FindPartOnRayWithIgnoreList(ray, { LocalPlayer.Character })

        if hitPart and hitPart:IsDescendantOf(enemy.Character) then
          if features.visiblecheck and
              not
              workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.Position,
                (enemy.Character[features.targetpart].Position - Camera.CFrame.Position).unit *
                (hitPosition - enemy.Character[features.targetpart].Position).magnitude), { LocalPlayer.Character }) then
            continue
          end
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
  local args = { ... }
  if string.find(method, 'Ray') and target and aimbotting then
    if features.prediction then
      local prediction = target.Character[features.targetpart].Velocity *
          (target.Character[features.targetpart].Position - Camera.CFrame.Position).magnitude / 1000
      args[2] = Ray.new(Camera.CFrame.Position,
        ((target.Character[features.targetpart].Position + prediction) - Camera.CFrame.Position).unit * 500)
    else
      args[2] = Ray.new(Camera.CFrame.Position,
        (target.Character[features.targetpart].Position - Camera.CFrame.Position).unit * 500)
    end
  end
  return oldNamecall(unpack(args))
end)
setreadonly(meta, true)

RunService:BindToRenderStep("silentaim", 1, function()
  if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and features.silentaim and
      LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and
      LocalPlayer.Character.Humanoid.Health > 0 then
    local nearestEnemy = getNearestEnemy()
    if nearestEnemy and nearestEnemy.Character and nearestEnemy.Character:FindFirstChild("Humanoid") and
        nearestEnemy.Character.Humanoid.Health > 0 then
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

local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = true
FOVCircle.Transparency = 1
FOVCircle.Thickness = 1.5
FOVCircle.Color = Color3.new(255, 0, 0)
FOVCircle.NumSides = 25
FOVCircle.Radius = features.fov

RunService:BindToRenderStep("fov", 1, function()
  if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and
      LocalPlayer.Character.Humanoid.Health > 0 then
    FOVCircle.Position = Vector2.new(mouse.X, mouse.Y)
    FOVCircle.Radius = features.fov
  else
    FOVCircle.Radius = 0
  end
end)

local function toggleSilentAim()
  features.silentaim = not features.silentaim
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
  if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.LeftAlt then
    toggleSilentAim()
  end
end)
