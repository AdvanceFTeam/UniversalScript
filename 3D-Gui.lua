--[[

- Organized the Script Dent by YellowGreg (Took about 1 hour and 20 min to organize it)

TODO:
- Deobfuscate all the letters
- Improve the GUI
- Add more things to the to-do list later

]]--

LocalPlayer = game.Players.LocalPlayer
LocalPlayer.Character:WaitForChild("\72\101\97\100")
local il = nil
local oi = Instance.new("\83\99\114\101\101\110\71\117\105")
oi.Parent = LocalPlayer.PlayerGui
oi.Name = "\104\52\120\95\71\85\73"
local to = Instance.new("\70\114\97\109\101")
to.Parent = oi
to.Position = UDim2.new(0.01, 0, 0.49, 0)
to.BackgroundTransparency = 1
local ft = Instance.new("\84\101\120\116\66\111\120")
ft.Parent = to
ft.Name = "\104\52\120\95\99\111\109\109\97\110\100\98\97\114"
ft.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ft.Position = UDim2.new(0.01, 0, 0.49, 0)
ft.Size = UDim2.new(0, 215, 0, 28)
ft.BackgroundTransparency = 0.5
ft.TextColor3 = Color3.fromRGB(255, 255, 255)
ft.TextScaled = true
ft.ClearTextOnFocus = false
ft.Text = "\71\105\116\104\117\98\32\45\32\74\85\75\106\97\99\107\101\114"
function lm()
  local oil = workspace:FindFirstChild("\104\52\120\95\116\97\98\108\101\116\115"):FindFirstChild("\116\101\108\101\112\111\114\116\95\105\110\100\101\120")
  local lm = Instance.new("\80\97\114\116")
  local qg = Instance.new("\83\117\114\102\97\99\101\71\117\105")
  qg.Face = Enum.NormalId.Top
  qg.Parent = lm
  local lm_to = Instance.new("\70\114\97\109\101")
  lm_to.BackgroundTransparency = 1
  lm_to.Size = UDim2.new(0, 800, 0, 600)
  lm_to.Parent = qg
  local _n = Instance.new("\84\101\120\116\76\97\98\101\108")
  _n.Parent = lm_to
  _n.Text = oil.Value
  _n.BackgroundTransparency = 1
  _n.TextColor3 = Color3.fromRGB(255, 255, 255)
  _n.Size = UDim2.new(0, 800, 0, 600)
  _n.TextSize = 100
  local pd = LocalPlayer.Character.Head.Position
  lm.Anchored = true
  lm.Color = Color3.fromRGB(0, 0, 255)
  lm.Size = Vector3.new(4, 0.25, 4)
  lm.Position = Vector3.new(pd.X, pd.Y - 4.3, pd.Z)
  lm.Parent = workspace
  lm.Name = "\116\101\108\101\112\111\114\116\112\97\100\49\95" .. tostring(oil.Value)
  workspace:FindFirstChild("\104\52\120\95\116\97\98\108\101\116\115").tablet1.SurfaceGui.Frame.teleport1_button.Visible = false
  local function m(o)
    if o.Parent:FindFirstChild("\72\117\109\97\110\111\105\100") ~= nil then
      local dk_name = "\116\101\108\101\112\111\114\116\112\97\100\50" .. "\95" .. string.split(lm.Name, "\95")
          [2]
      print("\80\101\114\115\111\110\32\116\111\117\99\104\101\100\32\105\116")
      print(dk_name)
      local dk = game.Workspace:FindFirstChild(dk_name)
      lm.CanTouch = false
      dk.CanTouch = false
      LocalPlayer.Character:moveTo(dk.Position)
      wait(3)
      lm.CanTouch = true
      dk.CanTouch = true
    else
      print("\83\111\109\101\116\104\105\110\103\32\116\111\117\99\104\101\100\32\105\116\44\32\110\111\116\32\97\32\112\101\114\115\111\110")
    end
  end

  lm.Touched:Connect(m)
end

function dk()
  local oil = workspace:FindFirstChild("\104\52\120\95\116\97\98\108\101\116\115"):FindFirstChild("\116\101\108\101\112\111\114\116\95\105\110\100\101\120")
  local dk = Instance.new("\80\97\114\116")
  local pd = LocalPlayer.Character.Head.Position
  dk.Anchored = true
  dk.Color = Color3.fromRGB(255, 0, 0)
  dk.Size = Vector3.new(4, 0.25, 4)
  dk.Position = Vector3.new(pd.X, pd.Y - 4.3, pd.Z)
  dk.Parent = workspace
  workspace:FindFirstChild("\104\52\120\95\116\97\98\108\101\116\115").tablet1.SurfaceGui.Frame.teleport1_button.Visible = true
  dk.Name = "\116\101\108\101\112\111\114\116\112\97\100\50\95" .. tostring(oil.Value)
  local dk_surfaceGui = Instance.new("\83\117\114\102\97\99\101\71\117\105")
  dk_surfaceGui.Face = Enum.NormalId.Top
  dk_surfaceGui.Parent = dk
  local dk_to = Instance.new("\70\114\97\109\101")
  dk_to.BackgroundTransparency = 1
  dk_to.Size = UDim2.new(0, 800, 0, 600)
  dk_to.Parent = dk_surfaceGui
  local _n = Instance.new("\84\101\120\116\76\97\98\101\108")
  _n.Parent = dk_to
  _n.Text = oil.Value
  _n.BackgroundTransparency = 1
  _n.TextColor3 = Color3.fromRGB(255, 255, 255)
  _n.Size = UDim2.new(0, 800, 0, 600)
  _n.TextSize = 100
  oil.Value = oil.Value + 1
  local function i(o) if o.Parent:FindFirstChild("\72\117\109\97\110\111\105\100") ~= nil then
      local lm_name = "\116\101\108\101\112\111\114\116\112\97\100\49" .. "\95" .. string.split(dk.Name, "\95")
          [2]
      print("\80\101\114\115\111\110\32\116\111\117\99\104\101\100\32\105\116")
      print(lm_name)
      local lm = game.Workspace:FindFirstChild(lm_name)
      lm.CanTouch = false
      dk.CanTouch = false
      LocalPlayer.Character:moveTo(lm.Position)
      wait(3)
      lm.CanTouch = true
      dk.CanTouch = true
    else
      print("\83\111\109\101\116\104\105\110\103\32\116\111\117\99\104\101\100\32\105\116\44\32\110\111\116\32\97\32\112\101\114\115\111\110")
    end
  end

  dk.Touched:Connect(i)
end

function a()
  LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(ft.Text)
end

function k()
  LocalPlayer.Character.Humanoid.JumpPower = tonumber(ft.Text)
end

local ilm = Instance.new("\77\111\100\101\108")
ilm.Name = "\104\52\120\95\116\97\98\108\101\116\115"
ilm.Parent = workspace
local oil = Instance.new("\73\110\116\86\97\108\117\101")
oil.Value = 1
oil.Parent = ilm
oil.Name = "\116\101\108\101\112\111\114\116\95\105\110\100\101\120"
function d(p) if ilm:FindFirstChild("\108\111\103\103\105\110\103\95\116\97\98\108\101\116") ~= nil then
    local toi = ilm:FindFirstChild("\108\111\103\103\105\110\103\95\116\97\98\108\101\116")
    toi.SurfaceGui.Frame.TextBox.Text = p
  end
end

function j()
  local function t(f)
    for i, v in pairs(f:GetChildren()) do
      if v:IsA("\80\97\114\116") then
        v.Locked = false
      end
      if v:IsA("\77\111\100\101\108") or v:IsA("\70\111\108\100\101\114") then
        t(v)
      end
    end
  end

  t(workspace)
  d("\85\110\108\111\99\107\101\100\32\119\111\114\107\115\112\97\99\101")
end

function n()
  local fto = game:GetService("\80\108\97\121\101\114\115").LocalPlayer
  local hf = fto:GetMouse()
  hf.Button1Down:connect(function()
    if not
        game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101"):IsKeyDown(Enum.KeyCode.LeftControl) then
      return
    end
    if not hf.Target then return
    end
    il = hf.Target
    d(il:GetFullName())
  end)
end

function _()
  local gh = LocalPlayer.Character.Head.Position
  il.Position = Vector3.new(gh.X, gh.Y, gh.Z - 5)
end

function m_()
  local qgh = ft.Text
  if tonumber(qgh) ~= nil then
    local cqg = tonumber(qgh)
    il.Size = Vector3.new(cqg, cqg, cqg)
  else
    il.Size = Vector3.new(1, 1, 1)
  end
end

local function h()
  il.Anchored = true
end

local function g()
  il.Anchored = false
end

local function q() il.CanCollide = true end

local function c() il.CanCollide = false end

function l() local ec = Instance.new("\80\97\114\116")
  ec.Name = "\116\97\98\108\101\116\51"
  ec.Size = Vector3.new(4, 6, 0.5)
  ec.CanCollide = false
  ec.Transparency = 1
  ec.Color = Color3.fromRGB(69, 69, 255)
  ec.BackSurface = Enum.SurfaceType.SmoothNoOutlines
  ec.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
  ec.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
  ec.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
  ec.RightSurface = Enum.SurfaceType.SmoothNoOutlines
  ec.TopSurface = Enum.SurfaceType.SmoothNoOutlines
  ec.CanCollide = false
  local ghf = Instance.new("\83\101\108\101\99\116\105\111\110\66\111\120")
  ghf.Color3 = Color3.fromRGB(0, 0, 255)
  ghf.LineThickness = 0.01
  ghf.SurfaceColor3 = Color3.fromRGB(13, 105, 172)
  ghf.Transparency = 0
  ghf.Parent = ec
  ghf.Adornee = ec
  local ec_surfaceGUI = Instance.new("\83\117\114\102\97\99\101\71\117\105")
  ec_surfaceGUI.Face = Enum.NormalId.Back
  local ab = Instance.new("\70\114\97\109\101")
  ab.Size = UDim2.new(0, 800, 1, 0)
  ab.BackgroundTransparency = 1
  ec_surfaceGUI.Parent = ec
  ab.Parent = ec_surfaceGUI
  local qghfto = Instance.new("\65\116\116\97\99\104\109\101\110\116")
  qghfto.Parent = LocalPlayer.Character.Head
  qghfto.Position = Vector3.new(-6.875, 2.966, 0.985)
  qghfto.Orientation = Vector3.new(18.2, 90, 0)
  local s = Instance.new("\65\116\116\97\99\104\109\101\110\116")
  s.Parent = ec
  local bse = Instance.new("\65\108\105\103\110\80\111\115\105\116\105\111\110")
  bse.Parent = ec
  bse.Attachment0 = s
  bse.Attachment1 = qghfto
  local abs = Instance.new("\65\108\105\103\110\79\114\105\101\110\116\97\116\105\111\110")
  abs.Parent = ec
  abs.Attachment0 = s
  abs.Attachment1 = qghfto
  ec.Parent = ilm
  local ec_button_inspectpart = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  ec_button_inspectpart.Size = UDim2.new(0, 400, 0, 150)
  ec_button_inspectpart.TextColor3 = Color3.fromRGB(0, 0, 255)
  ec_button_inspectpart.BorderColor3 = Color3.fromRGB(0, 12, 255)
  ec_button_inspectpart.BorderSizePixel = 4
  ec_button_inspectpart.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  ec_button_inspectpart.TextSize = 300
  ec_button_inspectpart.BackgroundTransparency = 0.3
  ec_button_inspectpart.Text = "\67\116\114\108\43\99\108\105\99\107\32\116\111\32\115\101\108\101\99\116\32\112\97\114\116"
  ec_button_inspectpart.Name = "\73\110\115\112\101\99\116\95\112\97\114\116\95\98\117\116\116\111\110"
  ec_button_inspectpart.Parent = ab
  ec_button_inspectpart.TextScaled = true
  ec_button_inspectpart.MouseButton1Click:Connect(n)
  local _nj = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  _nj.Size = UDim2.new(0, 400, 0, 150)
  _nj.Position = UDim2.new(0, 400, 0, 0)
  _nj.TextColor3 = Color3.fromRGB(0, 0, 255)
  _nj.BorderColor3 = Color3.fromRGB(0, 12, 255)
  _nj.BorderSizePixel = 4
  _nj.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  _nj.TextSize = 300
  _nj.BackgroundTransparency = 0.3
  _nj.Text = "\85\110\108\111\99\107\32\119\111\114\107\115\112\97\99\101"
  _nj.Name = "\117\110\108\111\99\107\95\119\115\95\98\117\116\116\111\110"
  _nj.Parent = ab
  _nj.TextScaled = true
  _nj.MouseButton1Click:Connect(j)
  local ec_button__ = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  ec_button__.Size = UDim2.new(0, 400, 0, 150)
  ec_button__.Position = UDim2.new(0, 0, 0.25, 0)
  ec_button__.TextColor3 = Color3.fromRGB(0, 0, 255)
  ec_button__.BorderColor3 = Color3.fromRGB(0, 12, 255)
  ec_button__.BorderSizePixel = 4
  ec_button__.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  ec_button__.TextSize = 300
  ec_button__.BackgroundTransparency = 0.3
  ec_button__.Text = "\66\114\105\110\103\32\112\97\114\116"
  ec_button__.Name = "\98\114\105\110\103\95\112\97\114\116\95\98\117\116\116\111\110"
  ec_button__.Parent = ab
  ec_button__.TextScaled = true
  ec_button__.MouseButton1Click:Connect(_)
  local lm_ = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  lm_.Size = UDim2.new(0, 400, 0, 150)
  lm_.Position = UDim2.new(0, 400, 0.25, 0)
  lm_.TextColor3 = Color3.fromRGB(0, 0, 255)
  lm_.BorderColor3 = Color3.fromRGB(0, 12, 255)
  lm_.BorderSizePixel = 4
  lm_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  lm_.TextSize = 300
  lm_.BackgroundTransparency = 0.3
  lm_.Text = "\67\117\98\105\102\121\32\112\97\114\116\32\40\99\97\110\32\117\115\101\32\105\110\112\117\116\41"
  lm_.Name = "\99\117\98\105\102\121\95\98\117\116\116\111\110"
  lm_.Parent = ab
  lm_.TextScaled = true
  lm_.MouseButton1Click:Connect(m_)
  local ec_button_anchor = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  ec_button_anchor.Size = UDim2.new(0, 400, 0, 150)
  ec_button_anchor.Position = UDim2.new(0, 0, 0.5, 0)
  ec_button_anchor.TextColor3 = Color3.fromRGB(0, 0, 255)
  ec_button_anchor.BorderColor3 = Color3.fromRGB(0, 12, 255)
  ec_button_anchor.BorderSizePixel = 4
  ec_button_anchor.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  ec_button_anchor.TextSize = 300
  ec_button_anchor.BackgroundTransparency = 0.3
  ec_button_anchor.Text = "\65\110\99\104\111\114\32\112\97\114\116"
  ec_button_anchor.Name = "\97\110\99\104\111\114\95\98\117\116\116\111\110"
  ec_button_anchor.Parent = ab
  ec_button_anchor.TextScaled = true
  ec_button_anchor.MouseButton1Click:Connect(h)
  local ec_button_unanchor = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  ec_button_unanchor.Size = UDim2.new(0, 400, 0, 150)
  ec_button_unanchor.Position = UDim2.new(0, 400, 0.5, 0)
  ec_button_unanchor.TextColor3 = Color3.fromRGB(0, 0, 255)
  ec_button_unanchor.BorderColor3 = Color3.fromRGB(0, 12, 255)
  ec_button_unanchor.BorderSizePixel = 4
  ec_button_unanchor.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  ec_button_unanchor.TextSize = 300
  ec_button_unanchor.BackgroundTransparency = 0.3
  ec_button_unanchor.Text = "\85\110\97\110\99\104\111\114\32\112\97\114\116"
  ec_button_unanchor.Name = "\117\110\97\110\99\104\111\114\95\98\117\116\116\111\110"
  ec_button_unanchor.Parent = ab
  ec_button_unanchor.TextScaled = true
  ec_button_unanchor.MouseButton1Click:Connect(g)
  local toil = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  toil.Size = UDim2.new(0, 400, 0, 150)
  toil.Position = UDim2.new(0, 0, 0.75, 0)
  toil.TextColor3 = Color3.fromRGB(0, 0, 255)
  toil.BorderColor3 = Color3.fromRGB(0, 12, 255)
  toil.BorderSizePixel = 4
  toil.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  toil.TextSize = 300
  toil.BackgroundTransparency = 0.3
  toil.Text = "\69\110\97\98\108\101\32\99\111\108\108\105\115\105\111\110\115"
  toil.Name = "\101\110\97\98\108\101\95\99\111\108\108\105\115\105\111\110\115\95\98\117\116\116\111\110"
  toil.Parent = ab
  toil.TextScaled = true
  toil.MouseButton1Click:Connect(q)
  local ec_button_disable_collisions = Instance.new("\84\101\120\116\66\117\116\116\111\110")
  ec_button_disable_collisions.Size = UDim2.new(0, 400, 0, 150)
  ec_button_disable_collisions.Position = UDim2.new(0, 400, 0.75, 0)
  ec_button_disable_collisions.TextColor3 = Color3.fromRGB(0, 0, 255)
  ec_button_disable_collisions.BorderColor3 = Color3.fromRGB(0, 12, 255)
  ec_button_disable_collisions.BorderSizePixel = 4
  ec_button_disable_collisions.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  ec_button_disable_collisions.TextSize = 300
  ec_button_disable_collisions.BackgroundTransparency = 0.3
  ec_button_disable_collisions.Text = "\68\105\115\97\98\108\101\32\99\111\108\108\105\115\105\111\110\115"
  ec_button_disable_collisions.Name = "\100\105\115\97\98\108\101\95\99\111\108\108\105\115\105\111\110\115\95\98\117\116\116\111\110"
  ec_button_disable_collisions.Parent = ab
  ec_button_disable_collisions.TextScaled = true
  ec_button_disable_collisions.MouseButton1Click:Connect(c)
  local hft = Instance.new("\80\97\114\116")
  hft.Name = "\108\111\103\103\105\110\103\95\116\97\98\108\101\116"
  hft.Size = Vector3.new(4, 6, 0.5)
  hft.CanCollide = false
  hft.Transparency = 1
  hft.Color = Color3.fromRGB(69, 69, 255)
  hft.BackSurface = Enum.SurfaceType.SmoothNoOutlines
  hft.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
  hft.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
  hft.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
  hft.RightSurface = Enum.SurfaceType.SmoothNoOutlines
  hft.TopSurface = Enum.SurfaceType.SmoothNoOutlines
  hft.CanCollide = false
  local ghf = Instance.new("\83\101\108\101\99\116\105\111\110\66\111\120")
  ghf.Color3 = Color3.fromRGB(0, 0, 255)
  ghf.LineThickness = 0.01
  ghf.SurfaceColor3 = Color3.fromRGB(13, 105, 172)
  ghf.Transparency = 0
  ghf.Parent = hft
  ghf.Adornee = hft
  local qghf = Instance.new("\83\117\114\102\97\99\101\71\117\105")
  qghf.Face = Enum.NormalId.Back
  local cqgh = Instance.new("\70\114\97\109\101")
  cqgh.Size = UDim2.new(0, 800, 1, 0)
  cqgh.BackgroundTransparency = 1
  qghf.Parent = hft
  cqgh.Parent = qghf
  local qghfto = Instance.new("\65\116\116\97\99\104\109\101\110\116")
  qghfto.Parent = LocalPlayer.Character.Head
  qghfto.Position = Vector3.new(7.941, 2.807, 0.985)
  qghfto.Orientation = Vector3.new(18.2, -90, 0)
  local s = Instance.new("\65\116\116\97\99\104\109\101\110\116")
  s.Parent = hft
  local bse = Instance.new("\65\108\105\103\110\80\111\115\105\116\105\111\110")
  bse.Parent = hft
  bse.Attachment0 = s
  bse.Attachment1 = qghfto
  local abs = Instance.new("\65\108\105\103\110\79\114\105\101\110\116\97\116\105\111\110")
  abs.Parent = hft
  abs.Attachment0 = s
  abs.Attachment1 = qghfto
  hft.Parent = ilm
  local ka = Instance.new("\84\101\120\116\66\111\120")
  ka.Size = UDim2.new(0, 800, 1, 0)
  ka.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  ka.TextScaled = true
  ka.MultiLine = true
  ka.RichText = true
  ka.TextColor3 = Color3.fromRGB(0, 17, 255)
  ka.BorderSizePixel = 4
  ka.BorderColor3 = Color3.fromRGB(0, 0, 255)
  ka.Text = '"\84\104\101\32\100\105\102\102\101\114\101\110\99\101\32\98\101\116\119\101\101\110\32\97\32\103\111\111\100\32\112\114\111\103\114\97\109\109\101\114\32\97\110\100\32\97\32\98\97\100\32\112\114\111\103\114\97\109\109\101\114\32\105\115\32\110\111\116\32\108\97\122\121\46" - Terry A. Davis'
  ka.Parent = cqgh
  ka.BackgroundTransparency = 0.5
end

local function e() local dka = Instance.new("\83\111\117\110\100")
  dka.Parent = workspace
  dka.SoundId = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\52\50\57\51\48\52\53\52"
  dka.Volume = 10
  dka.Looped = true
  dka:Play()
  game.Lighting.FogEnd = 100
  game.Lighting.FogStart = 0
  game.Lighting:SetMinutesAfterMidnight(600)
  for i, v in pairs(game.Lighting:GetChildren()) do if v:IsA("\83\107\121") then v
          :Remove()
    end
  end
  local pdk = Instance.new("\83\107\121")
  pdk.Parent = game.Lighting
  pdk.SkyboxBk = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\55\56\57\57\51\55\52\53"
  pdk.SkyboxDn = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\55\56\57\57\51\55\52\53"
  pdk.SkyboxFt = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\55\56\57\57\51\55\52\53"
  pdk.SkyboxLf = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\55\56\57\57\51\55\52\53"
  pdk.SkyboxRt = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\55\56\57\57\51\55\52\53"
  pdk.SkyboxUp = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\55\56\57\57\51\55\52\53"
  while true do game.Lighting.FogColor = Color3.fromRGB(255, 0, 4)
    wait(0.5)
    game.Lighting.FogColor = Color3.fromRGB(255, 0
      , 234)
    wait(0.5)
    game.Lighting.FogColor = Color3.fromRGB(0, 4, 255)
    wait(0.5)
    game.Lighting.FogColor = Color3.fromRGB(0
      , 251, 255)
    wait(0.5)
    game.Lighting.FogColor = Color3.fromRGB(4, 255, 0)
    wait(0.5)
    game.Lighting.FogColor = Color3.fromRGB(255
      , 238, 0)
    wait(0.5)
    game.Lighting.FogColor = Color3.fromRGB(255, 85, 0)
    wait(0.5)
  end
end

local jpd = Instance.new("\80\97\114\116")
jpd.Name = "\116\97\98\108\101\116\49"
jpd.Size = Vector3.new(4, 6, 0.5)
jpd.Color = Color3.fromRGB(255, 74, 74)
jpd.Transparency = 1
local njpd = Instance.new("\65\116\116\97\99\104\109\101\110\116")
njpd.Parent = jpd
local qghfto = Instance.new("\65\116\116\97\99\104\109\101\110\116")
qghfto.Parent = LocalPlayer.Character:WaitForChild("\72\101\97\100")
local m_njp = Instance.new("\65\108\105\103\110\80\111\115\105\116\105\111\110")
m_njp.Parent = jpd
m_njp.Attachment0 = njpd
m_njp.Attachment1 = qghfto
jpd.Parent = ilm
local lm_n = Instance.new("\65\108\105\103\110\79\114\105\101\110\116\97\116\105\111\110")
lm_n.Parent = jpd
lm_n.Attachment0 = njpd
lm_n.Attachment1 = qghfto
character_attachment1.Position = Vector3.new(-3.741, 3.515, -4.163)
qghfto.Orientation = Vector3.new(28.874, 17.189, 8.514)
jpd.BackSurface = Enum.SurfaceType.SmoothNoOutlines
jpd.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
jpd.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
jpd.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
jpd.RightSurface = Enum.SurfaceType.SmoothNoOutlines
jpd.TopSurface = Enum.SurfaceType.SmoothNoOutlines
jpd.CanCollide = false
local sec = Instance.new("\83\101\108\101\99\116\105\111\110\66\111\120")
sec.Parent = jpd
sec.Color3 = Color3.fromRGB(149, 0, 0)
sec.Adornee = jpd
sec.LineThickness = 0.01
local oilm_ = Instance.new("\83\117\114\102\97\99\101\71\117\105")
oilm_.Parent = jpd
oilm_.Face = Enum.NormalId.Back
local toilm = Instance.new("\70\114\97\109\101")
toilm.Parent = oilm_
toilm.Size = UDim2.new(0, 800, 1, 0)
toilm.BackgroundTransparency = 1
local jpd_lm_button = Instance.new("\84\101\120\116\66\117\116\116\111\110")
jpd_lm_button.Parent = toilm
jpd_lm_button.Size = UDim2.new(0, 800, 0.5, 0)
jpd_lm_button.TextColor3 = Color3.fromRGB(255, 0, 0)
jpd_lm_button.BorderColor3 = Color3.fromRGB(255, 0, 0)
jpd_lm_button.BorderSizePixel = 4
jpd_lm_button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
jpd_lm_button.TextSize = 300
jpd_lm_button.BackgroundTransparency = 0.3
jpd_lm_button.Text = "\84\101\108\101\112\111\114\116\32\49"
jpd_lm_button.Name = "\116\101\108\101\112\111\114\116\49\95\98\117\116\116\111\110"
jpd_lm_button.MouseButton1Click:Connect(lm)
local hfto = Instance.new("\84\101\120\116\66\117\116\116\111\110")
hfto.Parent = toilm
hfto.Size = UDim2.new(0, 800, 0.5, 0)
hfto.Position = UDim2.new(0, 0, 0.5, 0)
hfto.TextColor3 = Color3.fromRGB(255, 0, 0)
hfto.BorderColor3 = Color3.fromRGB(255, 0, 0)
hfto.BorderSizePixel = 4
hfto.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
hfto.TextSize = 300
hfto.BackgroundTransparency = 0.3
hfto.Text = "\84\101\108\101\112\111\114\116\32\50"
hfto.Name = "\116\101\108\101\112\111\114\116\50\95\98\117\116\116\111\110"
hfto.MouseButton1Click:Connect(dk)
local ghft = Instance.new("\80\97\114\116")
ghft.Name = "\116\97\98\108\101\116\50"
ghft.Size = Vector3.new(4, 6, 0.5)
ghft.Color = Color3.fromRGB(255, 74, 74)
ghft.Transparency = 1
local qghft = Instance.new("\65\116\116\97\99\104\109\101\110\116")
qghft.Parent = ghft
local cqghf = Instance.new("\65\116\116\97\99\104\109\101\110\116")
cqghf.Parent = LocalPlayer.Character.Head
local ecq = Instance.new("\65\108\105\103\110\80\111\115\105\116\105\111\110")
ecq.Parent = ghft
ecq.Attachment0 = qghft
ecq.Attachment1 = cqghf
ghft.Parent = ilm
local se = Instance.new("\65\108\105\103\110\79\114\105\101\110\116\97\116\105\111\110")
se.Parent = ghft
se.Attachment0 = qghft
se.Attachment1 = cqghf
character_attachment2.Position = Vector3.new(4.869, 3.243, -4.009)
cqghf.Orientation = Vector3.new(25.659, -33.69, -16.102)
ghft.BackSurface = Enum.SurfaceType.SmoothNoOutlines
ghft.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
ghft.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
ghft.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
ghft.RightSurface = Enum.SurfaceType.SmoothNoOutlines
ghft.TopSurface = Enum.SurfaceType.SmoothNoOutlines
ghft.CanCollide = false
local sec = Instance.new("\83\101\108\101\99\116\105\111\110\66\111\120")
sec.Parent = ghft
sec.Color3 = Color3.fromRGB(149, 0, 0)
sec.Adornee = ghft
sec.LineThickness = 0.01
local abse = Instance.new("\83\117\114\102\97\99\101\71\117\105")
abse.Parent = ghft
abse.Face = Enum.NormalId.Back
local kab = Instance.new("\70\114\97\109\101")
kab.Parent = abse
kab.Size = UDim2.new(0, 800, 1, 0)
kab.BackgroundTransparency = 1
local dkab = Instance.new("\84\101\120\116\66\117\116\116\111\110")
dkab.Parent = kab
dkab.Size = UDim2.new(0, 800, 0.5, 0)
dkab.TextColor3 = Color3.fromRGB(255, 0, 0)
dkab.BorderColor3 = Color3.fromRGB(255, 0, 0)
dkab.BorderSizePixel = 4
dkab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dkab.TextSize = 300
dkab.BackgroundTransparency = 0.3
dkab.Text = "\83\101\116\32\115\112\101\101\100"
dkab.Name = "\115\112\101\101\100\95\98\117\116\116\111\110"
dkab.MouseButton1Click:Connect(a)
local pdka = Instance.new("\84\101\120\116\66\117\116\116\111\110")
pdka.Parent = kab
pdka.Size = UDim2.new(0, 800, 0.5, 0)
pdka.Position = UDim2.new(0, 0, 0.5, 0)
pdka.TextColor3 = Color3.fromRGB(255, 0, 0)
pdka.BorderColor3 = Color3.fromRGB(255, 0, 0)
pdka.BorderSizePixel = 4
pdka.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
pdka.TextScaled = true
pdka.BackgroundTransparency = 0.3
pdka.Text = "\83\101\116\32\106\117\109\112\32\112\111\119\101\114"
pdka.Name = "\106\117\109\112\112\111\119\101\114\95\98\117\116\116\111\110"
pdka.MouseButton1Click:Connect(k)
local ftoilm = Instance.new("\80\97\114\116")
ftoilm.Name = "\112\97\114\116\95\109\97\110\105\112\117\108\97\116\105\111\110\95\98\117\116\116\111\110"
ftoilm.Size = Vector3.new(4, 3, 0.5)
ftoilm.Color = Color3.fromRGB(255, 74, 74)
ftoilm.Transparency = 1
local njpdk = Instance.new("\65\116\116\97\99\104\109\101\110\116")
njpdk.Parent = ftoilm
local qghfto = Instance.new("\65\116\116\97\99\104\109\101\110\116")
qghfto.Parent = LocalPlayer.Character:WaitForChild("\72\101\97\100")
local m_njpd = Instance.new("\65\108\105\103\110\80\111\115\105\116\105\111\110")
m_njpd.Parent = ftoilm
m_njpd.Attachment0 = njpdk
m_njpd.Attachment1 = qghfto
ftoilm.Parent = ilm
local lm_nj = Instance.new("\65\108\105\103\110\79\114\105\101\110\116\97\116\105\111\110")
lm_nj.Parent = ftoilm
lm_nj.Attachment0 = njpdk
lm_nj.Attachment1 = qghfto
character_attachment1.Position = Vector3.new(0.5, 7.879, -2.293)
qghfto.Orientation = Vector3.new(45, 0, -0)
ftoilm.BackSurface = Enum.SurfaceType.SmoothNoOutlines
ftoilm.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
ftoilm.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
ftoilm.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
ftoilm.RightSurface = Enum.SurfaceType.SmoothNoOutlines
ftoilm.TopSurface = Enum.SurfaceType.SmoothNoOutlines
ftoilm.CanCollide = false
local sec = Instance.new("\83\101\108\101\99\116\105\111\110\66\111\120")
sec.Parent = ftoilm
sec.Color3 = Color3.fromRGB(149, 0, 0)
sec.Adornee = ftoilm
sec.LineThickness = 0.01
local oilm_n = Instance.new("\83\117\114\102\97\99\101\71\117\105")
oilm_n.Parent = ftoilm
oilm_n.Face = Enum.NormalId.Back
local ftoilm_to = Instance.new("\70\114\97\109\101")
ftoilm_to.Parent = oilm_n
ftoilm_to.Size = UDim2.new(0, 800, 1, 0)
ftoilm_to.BackgroundTransparency = 1
local ftoilm = Instance.new("\84\101\120\116\66\117\116\116\111\110")
ftoilm.Parent = ftoilm_to
ftoilm.Size = UDim2.new(0, 800, 1, 0)
ftoilm.TextColor3 = Color3.fromRGB(255, 0, 0)
ftoilm.BorderColor3 = Color3.fromRGB(255, 0, 0)
ftoilm.BorderSizePixel = 4
ftoilm.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ftoilm.TextScaled = true
ftoilm.BackgroundTransparency = 0.3
ftoilm.Text = "\80\97\114\116\32\109\97\110\105\112\117\108\97\116\105\111\110"
ftoilm.Name = "\116\101\108\101\112\111\114\116\49\95\98\117\116\116\111\110"
ftoilm.MouseButton1Click:Connect(l)
local kabs = Instance.new("\80\97\114\116")
kabs.Name = "\116\101\104\95\98\117\116\116\111\110"
kabs.Size = Vector3.new(2, 0.25, 2)
kabs.Color = Color3.fromRGB(255, 74, 74)
kabs.Transparency = 1
local kabs_attachment = Instance.new("\65\116\116\97\99\104\109\101\110\116")
kabs_attachment.Parent = kabs
local qghfto = Instance.new("\65\116\116\97\99\104\109\101\110\116")
qghfto.Parent = LocalPlayer.Character:WaitForChild("\72\101\97\100")
local cqghft = Instance.new("\65\108\105\103\110\80\111\115\105\116\105\111\110")
cqghft.Parent = kabs
cqghft.Attachment0 = kabs_attachment
cqghft.Attachment1 = qghfto
kabs.Parent = ilm
local ecqg = Instance.new("\65\108\105\103\110\79\114\105\101\110\116\97\116\105\111\110")
ecqg.Parent = kabs
ecqg.Attachment0 = kabs_attachment
ecqg.Attachment1 = qghfto
character_attachment1.Position = Vector3.new(0.475, 5.172, -3.671)
qghfto.Orientation = Vector3.new(0.036, -90.01, -120)
kabs.BackSurface = Enum.SurfaceType.SmoothNoOutlines
kabs.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
kabs.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
kabs.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
kabs.RightSurface = Enum.SurfaceType.SmoothNoOutlines
kabs.TopSurface = Enum.SurfaceType.SmoothNoOutlines
kabs.CanCollide = false
local sec = Instance.new("\83\101\108\101\99\116\105\111\110\66\111\120")
sec.Parent = kabs
sec.Color3 = Color3.fromRGB(149, 0, 0)
sec.Adornee = kabs
sec.LineThickness = 0.01
local kabs_surfaceGUI = Instance.new("\83\117\114\102\97\99\101\71\117\105")
kabs_surfaceGUI.Parent = kabs
bsec.Face = Enum.NormalId.Top
local kabs_to = Instance.new("\70\114\97\109\101")
kabs_to.Parent = kabs_surfaceGUI
kabs_to.Size = UDim2.new(0, 800, 0, 600)
kabs_to.BackgroundTransparency = 1
local kabs = Instance.new("\84\101\120\116\66\117\116\116\111\110")
kabs.Parent = kabs_to
kabs.Size = UDim2.new(0, 800, 0, 600)
kabs.TextColor3 = Color3.fromRGB(255, 0, 0)
kabs.BorderColor3 = Color3.fromRGB(255, 0, 0)
kabs.BorderSizePixel = 4
kabs.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
kabs.TextSize = 100
kabs.BackgroundTransparency = 0.3
kabs.Text = "\84\101\104\32\98\117\116\116\111\110"
kabs.Name = "\116\101\108\101\112\111\114\116\49\95\98\117\116\116\111\110"
kabs.MouseButton1Click:Connect(e)
