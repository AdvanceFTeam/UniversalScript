-- Silent Aim script Modify by YellowGreg, MMSVon, and ShadowClark
-- Created GetNearestEnemy() function to find the nearest enemy to aim at
-- Modified the Namecall function to update the Ray argument with the target position when using Silent Aim
-- Added a feature to limit the field of view (FOV) to avoid targeting enemies outside a certain range
-- Added a RenderStep to update the target position and implement the Silent Aim functionality

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Features = {
  SilentAim = true;
  Fov = 500;
}

local target = nil

local function GetNearestEnemy()
  local NearestMagnitude = math.huge
  local NearestEnemy = nil
  for _, Player in ipairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and
        Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 then
      local Vector, OnScreen = Camera:WorldToScreenPoint(Player.Character.HumanoidRootPart.Position)
      if OnScreen then
        local Ray = Ray.new(Camera.CFrame.p, (Player.Character.Head.Position - Camera.CFrame.p).unit * 500)
        local IgnoreList = {
          LocalPlayer.Character;
        }
        local Hit, Position, Normal = workspace:FindPartOnRayWithIgnoreList(Ray, IgnoreList)
        if Hit and Hit:IsDescendantOf(Player.Character) and Hit:FindFirstAncestorOfClass("Model") and
            Players:FindFirstChild(Hit:FindFirstAncestorOfClass("Model").Name) then
          local Magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).magnitude
          if Magnitude < NearestMagnitude and Magnitude <= Features.Fov then
            NearestEnemy = Player
            NearestMagnitude = Magnitude
          end
        end
      end
    end
  end
  return NearestEnemy
end

local function Namecall(...)
  local Method = getnamecallmethod()
  local Args = { ... }
  if string.find(Method, "Ray") and Features.SilentAim and target then
    Args[2] = Ray.new(Camera.CFrame.Position,
      (target + Vector3.new(0, (Camera.CFrame.Position - target).Magnitude / 500, 0) - Camera.CFrame.Position).unit * 500)
  end
  return OldNamecall(unpack(Args))
end

local Meta = getrawmetatable(game)
setreadonly(Meta, false)
local OldNamecall = Meta.__namecall
Meta.__namecall = newcclosure(Namecall)

RunService:BindToRenderStep("SilentAim", 1, function()
  if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and Features.SilentAim and
      LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and
      LocalPlayer.Character.Humanoid.Health > 0 then
    local Enemy = GetNearestEnemy()
    if Enemy and Enemy.Character and Enemy.Character:FindFirstChild("Humanoid") and Enemy.Character.Humanoid.Health > 0 then
      local Vector, OnScreen = Camera:WorldToScreenPoint(Enemy.Character.Head.Position)
      local Magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).magnitude
      target = workspace[Enemy.Name]["Head"].Position
    end
  else
    target = nil
  end
end)

local OldNameCall = Meta.__namecall
Meta.__namecall = newcclosure(function(...)
  local Method = getnamecallmethod()
  local Args = { ... }
  if string.find(Method, 'Ray') then
    if target then
      Args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position,
        (
        target + Vector3.new(0, (workspace.CurrentCamera.CFrame.Position - target).Magnitude / 500, 0) -
            workspace.CurrentCamera.CFrame.Position).unit * 500)
    end
  end
  return OldNameCall(unpack(Args))
end)
