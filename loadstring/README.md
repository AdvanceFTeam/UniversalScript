## Loadstring
- Silent Aim
```lua
local settings = {
    fov = 100, -- The FOV radius
    aimbotEnabled = true,
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/AdvanceFTeam/UniversalScript/main/Silent-Aim.lua", true))()

-- Change the settings below
silentaim = settings.aimbotEnabled
fov = settings.fov
```
- Aimbot
```lua
local AIMBOT_ENABLED = true
local TEAM_CHECK = false -- If set to true then the script would only lock your aim at enemy team members.
local AIM_PART = "Head" -- Where the aimbot script would lock at.
local SENSITIVITY = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

loadstring(game:HttpGet(("https://raw.githubusercontent.com/AdvanceFTeam/UniversalScript/main/Aimbot.lua"), true))()
```
