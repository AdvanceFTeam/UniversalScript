-- Universal Silent Aim Script
-- Modify By YellowGreg, Wspboy12

--[[ 
Note: We were dumb because we tried to modify this script to have a hitchance,
but that was not universal for all game but for arsenal, 
so we just modify the script to be universal for some fps game and so it can be functional with no error.
]]--


-- Universal Silent Aim Script
-- Modify By YellowGreg, Wspboy12, and ChatGPT

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
  aimPart = "Head";
  aimPrediction = true;
  predictionFactor = 0.1;
  chams = true;
  chamsColor = Color3.fromRGB(255, 0, 0);
  fov = 500;
  fovCircle = true;
  fovColor = Color3.fromRGB(255, 255, 255);
  showTeam = false;
}

function getNearestEnemy()
  local nearestMagnitude = math.huge
  local nearestEnemy = nil
  for i, enemy in ipairs(Players:GetPlayers()) do
    if enemy ~= LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") and
        enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 and
        (features.showTeam or enemy.TeamColor ~= LocalPlayer.TeamColor) then
      local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character[features.aimPart].Position)
      if onScreen then
        if features.chams then
          for _, v in ipairs(enemy.Character:GetChildren()) do
            if v:IsA("BasePart") then
              local cham = Instance.new("BoxHandleAdornment")
              cham.Name = "cham"
              cham.Size = v.Size
              cham.Adornee = v
              cham.AlwaysOnTop = true
              cham.Color3 = features.chamsColor
              cham.ZIndex = 5
              cham.Transparency = 0.5
              cham.Parent = v
              Debris:AddItem(cham, 0.05)
            end
          end
        end
        local aimVector = enemy.Character.HumanoidRootPart.Velocity * features.predictionFactor
        local ray = Ray.new(Camera.CFrame.Position,
          ((enemy.Character[features.aimPart].Position + aimVector) - Camera.CFrame.Position).unit * 500)
        local hitPart, hitPosition, hitNormal = workspace:FindPartOnRayWithIgnoreList(ray, { LocalPlayer.Character })
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
  local args = { ... }
  if string.find(method, 'Ray') and target then
    args[2] = Ray.new(Camera.CFrame.Position, (target.Position - Camera.CFrame.Position).unit * 500)
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
