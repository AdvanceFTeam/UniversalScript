-- Universal Aimbot Script That Works for PC and Mobile
--// Made by Advancefalling Team

-- Update: Improve the support mobile touch inputs




--[[ 
Credit:
- YellowGreg (code optimization and refactoring), 
- ShadowClark (initial code implementation and testing), 
- Wspboy12 (input event handling and mobile support)
]]--

-- Configuration options
local AIMBOT_ENABLED = true
local TEAM_CHECK = false -- If set to true then the script would only lock your aim at enemy team members.
local AIM_PART = "Head" -- Where the aimbot script would lock at.
local SENSITIVITY = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Variables
local camera = workspace.CurrentCamera
local localPlayer = Players.LocalPlayer
local touching = false

-- Functions
local function getClosestPlayer()
    local maxDistance = math.huge
    local target = nil
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and (not TEAM_CHECK or player.Team ~= localPlayer.Team) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local screenPoint = camera:WorldToScreenPoint(player.Character.HumanoidRootPart.Position)
            local vectorDistance = (UserInputService:GetMouseLocation() - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
            
            if vectorDistance < maxDistance then
                target = player
                maxDistance = vectorDistance
            end
        end
    end
    
    return target
end

-- Event connections
UserInputService.InputBegan:Connect(function(input, processed)
    -- If the user taps the screen with a finger, or clicks the right mouse button,
    -- set the 'touching' variable to true.
    if not processed and (input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.Touch) then
        touching = true
    end
end)

UserInputService.InputEnded:Connect(function(input, processed)
    -- If the user lifts their finger off the screen, or releases the right mouse button,
    -- set the 'touching' variable to false.
    if not processed and (input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.Touch) then
        touching = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    -- If the user is touching the screen (or holding down the right mouse button)
    -- and the aimbot is enabled, attempt to lock onto the closest player.
    if touching and AIMBOT_ENABLED then
        local target = getClosestPlayer()
        
        if target then
            local aimPosition = target.Character[AIM_PART].Position
            TweenService:Create(camera, TweenInfo.new(SENSITIVITY, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(camera.CFrame.Position, aimPosition)}):Play()
        end
    end
end)
