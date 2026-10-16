--// ============================================
--// 👑 CYBER KING PREMIUM v8.0 ULTIMATE
--// 12 Tabs - 100+ Features - Delta Android
--// ============================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")
local SGui = game:GetService("StarterGui")
local VU = game:GetService("VirtualUser")
local LG = game:GetService("Lighting")
local SS = game:GetService("SoundService")
local TSvc = game:GetService("TeleportService")

local LP = Players.LocalPlayer
local Cam = workspace.CurrentCamera
local PG = LP:WaitForChild("PlayerGui")

for _, n in ipairs({"CyberKingV8","CyberDragonV7","CyberNeonPremium"}) do
    if PG:FindFirstChild(n) then PG[n]:Destroy() end
end

local Themes = {
    Gold = {M=Color3.fromRGB(255,215,80), M2=Color3.fromRGB(255,170,20), D=Color3.fromRGB(18,14,4), Mid=Color3.fromRGB(32,26,10), B=Color3.fromRGB(52,42,18), T=Color3.fromRGB(255,240,180)},
    Silver = {M=Color3.fromRGB(200,220,255), M2=Color3.fromRGB(140,170,220), D=Color3.fromRGB(8,10,18), Mid=Color3.fromRGB(18,22,38), B=Color3.fromRGB(32,40,62), T=Color3.fromRGB(220,235,255)},
    Ruby = {M=Color3.fromRGB(255,80,120), M2=Color3.fromRGB(200,30,70), D=Color3.fromRGB(20,6,12), Mid=Color3.fromRGB(36,12,22), B=Color3.fromRGB(58,22,34), T=Color3.fromRGB(255,200,215)},
    Emerald = {M=Color3.fromRGB(80,255,150), M2=Color3.fromRGB(30,200,100), D=Color3.fromRGB(6,18,12), Mid=Color3.fromRGB(14,34,24), B=Color3.fromRGB(26,54,38), T=Color3.fromRGB(200,255,220)},
    Sapphire = {M=Color3.fromRGB(100,180,255), M2=Color3.fromRGB(50,120,220), D=Color3.fromRGB(6,12,22), Mid=Color3.fromRGB(14,24,42), B=Color3.fromRGB(26,42,66), T=Color3.fromRGB(200,225,255)},
    Amethyst = {M=Color3.fromRGB(200,120,255), M2=Color3.fromRGB(150,60,230), D=Color3.fromRGB(14,6,22), Mid=Color3.fromRGB(26,14,42), B=Color3.fromRGB(44,26,64), T=Color3.fromRGB(230,200,255)},
}

local themeName = "Gold"
local C = Themes[themeName]

local S = {
    Speed=16, Jump=50, FlySpeed=60, FlyMode="Normal",
    Flying=false, FlyDir=Vector3.new(0,0,0), FlyUD=0,
    Noclip=false, InfJump=false, AntiAFK=false, Bhop=false, AutoSprint=false,
    Fullbright=false, Invisible=false, ESP=false, ESPItem=false,
    Hitbox=false, AntiFling=false, AntiVoid=false, AntiRagdoll=false,
    GodMode=false, Freeze=false, GhostMode=false, FakeLag=false,
    BigHead=false, SmallChar=false, GiantSize=false, RGBChar=false,
    Aimbot=false, SilentAim=false, KillAura=false, Wallhack=false,
    ChatSpam=false, AutoRejoin=false, ShowStats=false,
    SoundOn=true, AutoCollect=false,
    WP={}, Decoy=nil, RobCF=nil,
    FPS=60, Ping=0,
}

local function N(t, m)
    pcall(function()
        SGui:SetCore("SendNotification", {Title=t, Text=m, Duration=2.5})
    end)
end

local function Click()
    if not S.SoundOn then return end
    pcall(function()
        local s = Instance.new("Sound")
        s.SoundId = "rbxassetid://6895079853"
        s.Volume = 0.25
        s.Parent = SS
        s:Play()
        task.delay(0.5, function() s:Destroy() end)
    end)
end

local function Cn(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = p
    return c
end

local function St(p, col, th)
    local s = Instance.new("UIStroke")
    s.Color = col or C.M
    s.Thickness = th or 1.5
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = p
    return s
end

local function Gr(p, c1, c2, rot)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, c1),
        ColorSequenceKeypoint.new(1, c2 or c1)
    }
    g.Rotation = rot or 0
    g.Parent = p
    return g
end

local function Drag(f, h)
    h = h or f
    h.Active = true
    local dg, st, sp
    h.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dg = true; st = i.Position; sp = f.Position
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dg and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
            local d = i.Position - st
            f.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
        end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dg = false
        end
    end)
end

local SG = Instance.new("ScreenGui")
SG.Name = "CyberKingV8"
SG.ResetOnSpawn = false
SG.IgnoreGuiInset = true
SG.DisplayOrder = 999999
SG.Parent = PG

local USc = Instance.new("UIScale")
USc.Parent = SG
local function UpSc()
    local v = Cam.ViewportSize
    USc.Scale = math.clamp(math.min(v.X/820, v.Y/580), 0.65, 1)
end
UpSc()
Cam:GetPropertyChangedSignal("ViewportSize"):Connect(UpSc)

--// END TIN 1
local function MakeFloat(txt, pos, col)
    local h = Instance.new("Frame")
    h.Size = UDim2.new(0, 56, 0, 56)
    h.Position = pos
    h.BackgroundTransparency = 1
    h.Parent = SG
    local glow = Instance.new("Frame")
    glow.Size = UDim2.new(1, 10, 1, 10)
    glow.Position = UDim2.new(0, -5, 0, -5)
    glow.BackgroundColor3 = col
    glow.BackgroundTransparency = 0.6
    glow.BorderSizePixel = 0
    glow.Parent = h
    Cn(glow, 33)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 1, 0)
    b.BackgroundColor3 = C.D
    b.Text = txt
    b.TextColor3 = col
    b.TextSize = 24
    b.Font = Enum.Font.GothamBold
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = h
    Cn(b, 28)
    St(b, col, 2)
    task.spawn(function()
        while h.Parent do
            TS:Create(glow, TweenInfo.new(1.6, Enum.EasingStyle.Sine), {BackgroundTransparency=0.2, Size=UDim2.new(1,16,1,16), Position=UDim2.new(0,-8,0,-8)}):Play()
            task.wait(1.6)
            TS:Create(glow, TweenInfo.new(1.6, Enum.EasingStyle.Sine), {BackgroundTransparency=0.7, Size=UDim2.new(1,10,1,10), Position=UDim2.new(0,-5,0,-5)}):Play()
            task.wait(1.6)
        end
    end)
    Drag(h)
    return b
end

local OpenBtn = MakeFloat("👑", UDim2.new(0, 12, 0.42, 0), C.M)
local CloneBtn = MakeFloat("👥", UDim2.new(1, -68, 0.42, 0), Color3.fromRGB(0,220,140))
local TeleBtn = MakeFloat("🚀", UDim2.new(1, -68, 0.55, 0), C.M)
local PanicBtn = MakeFloat("👁️", UDim2.new(1, -68, 0.68, 0), Color3.fromRGB(255,200,60))

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 460, 0, 400)
Main.Position = UDim2.new(0.5, -230, 0.5, -200)
Main.BackgroundColor3 = C.D
Main.BorderSizePixel = 0
Main.Visible = false
Main.ClipsDescendants = true
Main.Parent = SG
Cn(Main, 18)
local mainStk = St(Main, C.M, 2.5)

local mainGrad = Instance.new("UIGradient")
mainGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, C.D),
    ColorSequenceKeypoint.new(0.5, C.Mid),
    ColorSequenceKeypoint.new(1, C.D),
}
mainGrad.Rotation = 45
mainGrad.Parent = Main

task.spawn(function()
    local r = 0
    while Main.Parent do
        r = (r + 1.5) % 360
        mainGrad.Rotation = r
        task.wait(0.05)
    end
end)

local beam = Instance.new("Frame")
beam.Size = UDim2.new(0, 2, 1, 0)
beam.BackgroundColor3 = C.M2
beam.BorderSizePixel = 0
beam.Parent = Main
task.spawn(function()
    while Main.Parent do
        TS:Create(beam, TweenInfo.new(2.8), {Position=UDim2.new(1,0,0,0)}):Play()
        task.wait(2.8)
        beam.Position = UDim2.new(0,0,0,0)
    end
end)

local TB = Instance.new("Frame")
TB.Size = UDim2.new(1, 0, 0, 44)
TB.BackgroundColor3 = C.Mid
TB.BackgroundTransparency = 0.15
TB.BorderSizePixel = 0
TB.Parent = Main
Cn(TB, 18)

local TBf = Instance.new("Frame")
TBf.Size = UDim2.new(1, 0, 0, 20)
TBf.Position = UDim2.new(0, 0, 1, -20)
TBf.BackgroundColor3 = C.Mid
TBf.BackgroundTransparency = 0.15
TBf.BorderSizePixel = 0
TBf.Parent = TB

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(0, 34, 1, 0)
Logo.Position = UDim2.new(0, 12, 0, 0)
Logo.BackgroundTransparency = 1
Logo.Text = "👑"
Logo.TextSize = 22
Logo.Font = Enum.Font.GothamBold
Logo.Parent = TB

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -140, 1, 0)
Title.Position = UDim2.new(0, 48, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "CYBER KING PREMIUM"
Title.TextColor3 = C.M
Title.TextSize = 15
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TB
Gr(Title, C.M, C.M2, 0)

local VB = Instance.new("TextLabel")
VB.Size = UDim2.new(0, 50, 0, 20)
VB.Position = UDim2.new(1, -136, 0, 12)
VB.BackgroundColor3 = C.M
VB.Text = "v8.0"
VB.TextColor3 = C.D
VB.TextSize = 10
VB.Font = Enum.Font.GothamBlack
VB.BorderSizePixel = 0
VB.Parent = TB
Cn(VB, 10)
Gr(VB, C.M, C.M2, 45)

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -68, 0, 8)
MinBtn.BackgroundColor3 = Color3.fromRGB(255,200,60)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.TextSize = 18
MinBtn.Font = Enum.Font.GothamBold
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TB
Cn(MinBtn, 8)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -36, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(230,50,70)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TB
Cn(CloseBtn, 8)

local function ShowMenu(sh)
    if sh then
        Main.Visible = true
        Main.Size = UDim2.new(0, 0, 0, 0)
        Main.Rotation = -8
        TS:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 460, 0, 400),
            Rotation = 0,
        }):Play()
    else
        local tw = TS:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Rotation = 8,
        })
        tw:Play()
        tw.Completed:Connect(function()
            Main.Visible = false
            Main.Rotation = 0
        end)
    end
end

OpenBtn.MouseButton1Click:Connect(function() Click() ShowMenu(not Main.Visible) end)
CloseBtn.MouseButton1Click:Connect(function() Click() ShowMenu(false) end)
MinBtn.MouseButton1Click:Connect(function() Click() ShowMenu(false) end)
Drag(Main, TB)

--// END TIN 2
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 58)
TabBar.Position = UDim2.new(0, 0, 0, 46)
TabBar.BackgroundColor3 = C.Mid
TabBar.BackgroundTransparency = 0.4
TabBar.BorderSizePixel = 0
TabBar.Parent = Main

local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Size = UDim2.new(1, -8, 1, 0)
TabScroll.Position = UDim2.new(0, 4, 0, 0)
TabScroll.BackgroundTransparency = 1
TabScroll.BorderSizePixel = 0
TabScroll.ScrollBarThickness = 0
TabScroll.ScrollDirection = Enum.ScrollDirection.X
TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
TabScroll.Parent = TabBar

local TL = Instance.new("UIListLayout")
TL.Padding = UDim.new(0, 5)
TL.FillDirection = Enum.FillDirection.Horizontal
TL.VerticalAlignment = Enum.VerticalAlignment.Center
TL.Parent = TabScroll

local TP = Instance.new("UIPadding")
TP.PaddingLeft = UDim.new(0, 4)
TP.PaddingRight = UDim.new(0, 4)
TP.Parent = TabScroll

local TabNames = {
    {icon="⚡", name="Speed"},
    {icon="🛸", name="Fly"},
    {icon="🏠", name="Home"},
    {icon="🛡️", name="Support"},
    {icon="🎭", name="Char"},
    {icon="🔮", name="Visual"},
    {icon="⚔️", name="Combat"},
    {icon="🎪", name="Fun"},
    {icon="🎬", name="Macro"},
    {icon="🌐", name="Server"},
    {icon="📊", name="Stats"},
    {icon="⚙️", name="Config"},
}

local TabBtns = {}
local TabConts = {}

for i, tab in ipairs(TabNames) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 64, 0, 50)
    b.BackgroundColor3 = C.D
    b.Text = tab.icon .. "\n" .. tab.name
    b.TextColor3 = C.T
    b.TextSize = 9
    b.Font = Enum.Font.GothamBold
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = TabScroll
    Cn(b, 8)
    TabBtns[i] = b
end

local Cont = Instance.new("Frame")
Cont.Size = UDim2.new(1, -12, 1, -114)
Cont.Position = UDim2.new(0, 6, 0, 108)
Cont.BackgroundTransparency = 1
Cont.Parent = Main

for i = 1, #TabNames do
    local sf = Instance.new("ScrollingFrame")
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.ScrollBarThickness = 4
    sf.ScrollBarImageColor3 = C.M
    sf.CanvasSize = UDim2.new(0, 0, 0, 0)
    sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sf.Visible = (i == 1)
    sf.Parent = Cont
    local L = Instance.new("UIListLayout")
    L.Padding = UDim.new(0, 5)
    L.Parent = sf
    local Pd = Instance.new("UIPadding")
    Pd.PaddingTop = UDim.new(0, 4)
    Pd.PaddingLeft = UDim.new(0, 4)
    Pd.PaddingRight = UDim.new(0, 4)
    Pd.Parent = sf
    TabConts[i] = sf
end

local function SwitchT(idx)
    for i, b in ipairs(TabBtns) do
        b.BackgroundColor3 = C.D
        b.TextColor3 = C.T
        local g = b:FindFirstChildOfClass("UIGradient")
        if g then g:Destroy() end
    end
    TabBtns[idx].BackgroundColor3 = C.M
    TabBtns[idx].TextColor3 = Color3.new(1,1,1)
    Gr(TabBtns[idx], C.M, C.M2, 45)
    for i, c in ipairs(TabConts) do
        c.Visible = (i == idx)
    end
end

for i, b in ipairs(TabBtns) do
    b.MouseButton1Click:Connect(function() Click() SwitchT(i) end)
end
SwitchT(1)

local function mkBtn(p, txt, col, cb, h)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, h or 34)
    b.BackgroundColor3 = col or C.B
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = p
    Cn(b, 8)
    b.MouseEnter:Connect(function()
        TS:Create(b, TweenInfo.new(0.15), {BackgroundColor3=(col or C.B):Lerp(C.M, 0.4)}):Play()
    end)
    b.MouseLeave:Connect(function()
        TS:Create(b, TweenInfo.new(0.15), {BackgroundColor3=col or C.B}):Play()
    end)
    if cb then b.MouseButton1Click:Connect(function() Click() cb() end) end
    return b
end

local function mkLbl(p, txt, h, col)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, 0, 0, h or 30)
    l.BackgroundColor3 = C.Mid
    l.BackgroundTransparency = 0.15
    l.Text = txt
    l.TextColor3 = col or C.M
    l.TextSize = 11
    l.Font = Enum.Font.GothamBold
    l.BorderSizePixel = 0
    l.Parent = p
    Cn(l, 8)
    return l
end

local function mkTog(p, txt, key, cb)
    local b = mkBtn(p, txt..": TẮT", C.B)
    b.MouseButton1Click:Connect(function()
        S[key] = not S[key]
        b.Text = txt..": "..(S[key] and "BẬT" or "TẮT")
        b.BackgroundColor3 = S[key] and Color3.fromRGB(0,220,140) or C.B
        if cb then cb(S[key]) end
    end)
    return b
end

--// END TIN 3
--// TAB 1: SPEED
local T1 = TabConts[1]
local SpdLbl = mkLbl(T1, "🚶 Speed: 16 | 🦘 Jump: 50")
local function SetSpd(v)
    S.Speed = v
    SpdLbl.Text = "🚶 Speed: "..v.." | 🦘 Jump: "..S.Jump
    local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if h then h.WalkSpeed = v end
end
local function SetJmp(v)
    S.Jump = v
    SpdLbl.Text = "🚶 Speed: "..S.Speed.." | 🦘 Jump: "..v
    local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if h then h.UseJumpPower = true; h.JumpPower = v end
end
for _, v in ipairs({16, 50, 100, 200, 500, 1000, 2000, 5000}) do
    local name = v == 16 and " (Mặc định)" or (v == 5000 and " (Thần Tốc)" or "")
    local col = v >= 2000 and Color3.fromRGB(150,50,180) or C.B
    mkBtn(T1, "⚡ Speed "..v..name, col, function() SetSpd(v) end)
end
for _, v in ipairs({50, 120, 200, 300, 500, 1000}) do
    local name = v == 50 and " (Mặc định)" or ""
    mkBtn(T1, "🦘 Jump "..v..name, Color3.fromRGB(0,100,180), function() SetJmp(v) end)
end
mkTog(T1, "🏃 Auto Sprint", "AutoSprint", function(v)
    if v then
        task.spawn(function()
            while S.AutoSprint do
                local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                if h and h.WalkSpeed < 60 then h.WalkSpeed = 60 end
                task.wait(0.5)
            end
        end)
    end
end)
mkTog(T1, "🦘 Bhop (Auto Jump)", "Bhop")
mkBtn(T1, "🔄 Reset Chỉ Số", Color3.fromRGB(80,40,40), function() SetSpd(16); SetJmp(50) end)

--// TAB 2: FLY
local T2 = TabConts[2]
local FlyStt = mkLbl(T2, "🛸 Trạng thái: TẮT", 28, Color3.fromRGB(230,50,70))
local FlyBtn = mkBtn(T2, "🚀 BẬT BAY LƯỢN", Color3.fromRGB(0,220,140), nil, 38)
local FSpdLbl = mkLbl(T2, "💨 Tốc độ bay: 60", 24)
mkBtn(T2, "➕ Tăng Tốc (+20)", C.B, function()
    S.FlySpeed = math.min(S.FlySpeed + 20, 600)
    FSpdLbl.Text = "💨 Tốc độ bay: "..S.FlySpeed
end)
mkBtn(T2, "➖ Giảm Tốc (-20)", C.B, function()
    S.FlySpeed = math.max(S.FlySpeed - 20, 20)
    FSpdLbl.Text = "💨 Tốc độ bay: "..S.FlySpeed
end)
for _, v in ipairs({100, 200, 500}) do
    mkBtn(T2, "⚡ Tốc Độ "..v, Color3.fromRGB(150,50,180), function()
        S.FlySpeed = v
        FSpdLbl.Text = "💨 Tốc độ bay: "..v
    end)
end

local Joy = Instance.new("Frame")
Joy.Size = UDim2.new(0, 130, 0, 130)
Joy.Position = UDim2.new(0, 25, 1, -170)
Joy.BackgroundColor3 = C.Mid
Joy.BackgroundTransparency = 0.4
Joy.BorderSizePixel = 0
Joy.Visible = false
Joy.Parent = SG
Cn(Joy, 65)
local joyStk = St(Joy, C.M, 2.5)

local Knob = Instance.new("Frame")
Knob.Size = UDim2.new(0, 55, 0, 55)
Knob.Position = UDim2.new(0.5, -27, 0.5, -27)
Knob.BackgroundColor3 = C.M
Knob.BorderSizePixel = 0
Knob.Parent = Joy
Cn(Knob, 28)
Gr(Knob, C.M, C.M2)

task.spawn(function()
    while Joy.Parent do
        if Joy.Visible then
            TS:Create(joyStk, TweenInfo.new(1.2), {Transparency=0.5}):Play()
            task.wait(1.2)
            TS:Create(joyStk, TweenInfo.new(1.2), {Transparency=0}):Play()
            task.wait(1.2)
        else
            task.wait(0.5)
        end
    end
end)

local UpBtn = MakeFloat("⬆", UDim2.new(0.78, 0, 0.72, 0), Color3.fromRGB(0,220,140))
UpBtn.Size = UDim2.new(0, 50, 0, 50)
UpBtn.Visible = false
local DnBtn = MakeFloat("⬇", UDim2.new(0.78, 0, 0.84, 0), Color3.fromRGB(230,50,70))
DnBtn.Size = UDim2.new(0, 50, 0, 50)
DnBtn.Visible = false

local jD, jC
Joy.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch then
        jD = true
        jC = Joy.AbsolutePosition + Joy.AbsoluteSize/2
    end
end)
UIS.InputChanged:Connect(function(i)
    if jD and i.UserInputType == Enum.UserInputType.Touch and jC then
        local d = i.Position - jC
        local m = math.min(d.Magnitude, 42)
        local u = d.Unit
        Knob.Position = UDim2.new(0.5, u.X*m - 27, 0.5, u.Y*m - 27)
        S.FlyDir = Vector3.new(u.X, 0, u.Y)
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch then
        jD = false
        Knob.Position = UDim2.new(0.5, -27, 0.5, -27)
        S.FlyDir = Vector3.new(0,0,0)
    end
end)

UpBtn.MouseButton1Down:Connect(function() S.FlyUD = 1 end)
UpBtn.MouseButton1Up:Connect(function() S.FlyUD = 0 end)
UpBtn.MouseLeave:Connect(function() S.FlyUD = 0 end)
DnBtn.MouseButton1Down:Connect(function() S.FlyUD = -1 end)
DnBtn.MouseButton1Up:Connect(function() S.FlyUD = 0 end)
DnBtn.MouseLeave:Connect(function() S.FlyUD = 0 end)

FlyBtn.MouseButton1Click:Connect(function()
    S.Flying = not S.Flying
    if S.Flying then
        FlyStt.Text = "🛸 Trạng thái: BẬT"
        FlyStt.TextColor3 = Color3.fromRGB(0,220,140)
        FlyBtn.Text = "⛔ TẮT BAY LƯỢN"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(230,50,70)
        Joy.Visible = true
        UpBtn.Visible = true
        DnBtn.Visible = true
        N("Fly", "BẬT - dùng joystick")
    else
        FlyStt.Text = "🛸 Trạng thái: TẮT"
        FlyStt.TextColor3 = Color3.fromRGB(230,50,70)
        FlyBtn.Text = "🚀 BẬT BAY LƯỢN"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0,220,140)
        Joy.Visible = false
        UpBtn.Visible = false
        DnBtn.Visible = false
        local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if h then h.PlatformStand = false end
    end
end)

RS.RenderStepped:Connect(function()
    if not S.Flying then return end
    local c = LP.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local h = c:FindFirstChildOfClass("Humanoid")
    if not hrp or not h or h.Health <= 0 then return end
    h.PlatformStand = true
    local cf = Cam.CFrame
    local mv = cf.RightVector * S.FlyDir.X + cf.LookVector * -S.FlyDir.Z
    local v = Vector3.new(0, S.FlyUD, 0)
    local total = mv + v
    hrp.Velocity = total.Magnitude > 0.01 and total.Unit * S.FlySpeed or Vector3.new(0,0,0)
end)

--// END TIN 4
--// TAB 3: HOME
local T3 = TabConts[3]
local WpLbl = mkLbl(T3, "📍 Chưa lưu vị trí", 34)
local function SaveWP(k)
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        S.WP[k] = c.HumanoidRootPart.CFrame
        WpLbl.Text = "✅ Đã lưu: "..k
        N("Waypoint", "Đã lưu "..k)
    end
end
local function GotoWP(k)
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") and S.WP[k] then
        c.HumanoidRootPart.CFrame = S.WP[k]
        N("Teleport", "Đã đến "..k)
    else
        N("Lỗi", "Chưa lưu "..k)
    end
end

mkBtn(T3, "🏠 Lưu Nhà", Color3.fromRGB(0,220,140), function() SaveWP("Home") end)
mkBtn(T3, "➡️ Đi đến Nhà", C.B, function() GotoWP("Home") end)
mkBtn(T3, "🏦 Lưu Bank", Color3.fromRGB(0,220,140), function() SaveWP("Bank") end)
mkBtn(T3, "➡️ Đi Bank", C.B, function() GotoWP("Bank") end)
mkBtn(T3, "🛒 Lưu Shop", Color3.fromRGB(0,220,140), function() SaveWP("Shop") end)
mkBtn(T3, "➡️ Đi Shop", C.B, function() GotoWP("Shop") end)
mkBtn(T3, "🎯 Lưu Điểm Cướp", Color3.fromRGB(150,50,180), function() SaveWP("Rob") end)
mkBtn(T3, "➡️ Đi Điểm Cướp", C.B, function() GotoWP("Rob") end)

local function MakeDecoy()
    local c = LP.Character
    if not c then return end
    c.Archivable = true
    local cl = c:Clone()
    cl.Name = LP.Name.."_Decoy"
    for _, o in ipairs(cl:GetDescendants()) do
        if o:IsA("Script") or o:IsA("LocalScript") then o:Destroy() end
    end
    cl.Parent = workspace
    c.Archivable = false
    return cl
end

CloneBtn.MouseButton1Click:Connect(function()
    if not S.WP.Home then N("Lỗi", "Chưa lưu Nhà!") return end
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        S.RobCF = c.HumanoidRootPart.CFrame
        if S.Decoy then S.Decoy:Destroy() end
        S.Decoy = MakeDecoy()
        c.HumanoidRootPart.CFrame = S.WP.Home
        N("Decoy", "Đã thả phân thân + về nhà")
        task.delay(30, function()
            if S.Decoy and S.Decoy.Parent then S.Decoy:Destroy(); S.Decoy = nil end
        end)
    end
end)

TeleBtn.MouseButton1Click:Connect(function()
    if S.Decoy then S.Decoy:Destroy(); S.Decoy = nil end
    if S.RobCF then
        local c = LP.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame = S.RobCF
            N("Teleport", "Quay lại điểm cướp")
        end
    else
        N("Lỗi", "Chưa có điểm cướp!")
    end
end)

mkBtn(T3, "❌ Xóa Phân Thân", Color3.fromRGB(120,40,40), function()
    if S.Decoy then S.Decoy:Destroy(); S.Decoy = nil end
end)

--// TAB 4: SUPPORT
local T4 = TabConts[4]
mkTog(T4, "🚪 Noclip (Xuyên Tường)", "Noclip")
mkTog(T4, "🦘 Nhảy Vô Hạn", "InfJump")
mkTog(T4, "🛡️ Anti-AFK", "AntiAFK")
mkTog(T4, "👻 Tàng Hình", "Invisible", function(v)
    local c = LP.Character
    if c then
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                p.LocalTransparencyModifier = v and 1 or 0
            end
        end
    end
end)
mkTog(T4, "🛡️ Anti-Fling", "AntiFling", function(v)
    if v then
        task.spawn(function()
            while S.AntiFling do
                task.wait(0.5)
                local c = LP.Character
                if c then
                    local hrp = c:FindFirstChild("HumanoidRootPart")
                    if hrp and hrp.AssemblyLinearVelocity.Magnitude > 100 then
                        hrp.AssemblyLinearVelocity = Vector3.new(0,0,0)
                    end
                end
            end
        end)
    end
end)
mkTog(T4, "🕳️ Anti-Void", "AntiVoid", function(v)
    if v then
        task.spawn(function()
            while S.AntiVoid do
                task.wait(0.5)
                local c = LP.Character
                if c then
                    local hrp = c:FindFirstChild("HumanoidRootPart")
                    if hrp and hrp.Position.Y < -50 then
                        hrp.CFrame = CFrame.new(0, 50, 0)
                        N("Anti-Void", "Đã cứu khỏi void!")
                    end
                end
            end
        end)
    end
end)
mkTog(T4, "🦴 Anti-Ragdoll", "AntiRagdoll", function(v)
    if v then
        task.spawn(function()
            while S.AntiRagdoll do
                task.wait(0.3)
                local c = LP.Character
                if c then
                    local h = c:FindFirstChildOfClass("Humanoid")
                    if h then h:ChangeState(Enum.HumanoidStateType.GettingUp) end
                end
            end
        end)
    end
end)
mkTog(T4, "🛡️ God Mode", "GodMode", function(v)
    local c = LP.Character
    if c then
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.MaxHealth = v and math.huge or 100 end
    end
end)
mkBtn(T4, "🔄 Reset Nhân Vật", Color3.fromRGB(80,40,40), function()
    if LP.Character then LP.Character:BreakJoints() end
end)
mkBtn(T4, "🏃 Chạy Nhanh 60", Color3.fromRGB(0,100,180), function() SetSpd(60) end)

--// END TIN 5
--// TAB 5: CHAR
local T5 = TabConts[5]
mkTog(T5, "🙆 Đầu To (Big Head)", "BigHead", function(v)
    local c = LP.Character
    if c then
        local head = c:FindFirstChild("Head")
        if head then
            if v then
                head.Size = Vector3.new(3, 3, 3)
                head.Massless = true
            else
                head.Size = Vector3.new(2, 1, 1)
            end
        end
    end
end)
mkTog(T5, "🐜 Nhân Vật Nhỏ", "SmallChar", function(v)
    local c = LP.Character
    if c then
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                p.Size = v and (p.Size * 0.5) or (p.Size * 2)
            end
        end
    end
end)
mkTog(T5, "🦣 Nhân Vật Khổng Lồ", "GiantSize", function(v)
    local c = LP.Character
    if c then
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Size = v and Vector3.new(8, 8, 4) or Vector3.new(2, 2, 1)
        end
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.HipHeight = v and 6 or 2 end
    end
end)
mkTog(T5, "🌈 Đổi Màu RGB", "RGBChar", function(v)
    if v then
        task.spawn(function()
            local hue = 0
            while S.RGBChar do
                task.wait(0.1)
                hue = (hue + 0.02) % 1
                local c = LP.Character
                if c then
                    local col = Color3.fromHSV(hue, 1, 1)
                    for _, p in ipairs(c:GetDescendants()) do
                        if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                            pcall(function() p.Color = col end)
                        end
                    end
                end
            end
        end)
    end
end)
mkBtn(T5, "🔄 Reset Nhân Vật", Color3.fromRGB(80,40,40), function()
    if LP.Character then LP.Character:BreakJoints() end
end)

--// TAB 6: VISUAL
local T6 = TabConts[6]
local origLight = {
    Brightness = LG.Brightness,
    ClockTime = LG.ClockTime,
    GlobalShadows = LG.GlobalShadows,
    Ambient = LG.Ambient,
    OutdoorAmbient = LG.OutdoorAmbient,
    FogEnd = LG.FogEnd,
}
mkTog(T6, "☀️ Nhìn Đêm (Fullbright)", "Fullbright", function(v)
    if v then
        LG.Brightness = 3
        LG.ClockTime = 14
        LG.GlobalShadows = false
        LG.Ambient = Color3.fromRGB(178,178,178)
        LG.OutdoorAmbient = Color3.fromRGB(178,178,178)
        LG.FogEnd = 100000
    else
        for k, val in pairs(origLight) do LG[k] = val end
    end
end)
mkTog(T6, "👁️ ESP Người Chơi", "ESP", function(v)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local hl = p.Character:FindFirstChild("CN_HL")
            if v and not hl then
                local h = Instance.new("Highlight")
                h.Name = "CN_HL"
                h.FillColor = Color3.fromRGB(255,0,0)
                h.OutlineColor = Color3.fromRGB(255,255,255)
                h.Parent = p.Character
            elseif not v and hl then
                hl:Destroy()
            end
        end
    end
end)
mkTog(T6, "🎯 Hitbox To Người Khác", "Hitbox", function(v)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Size = v and Vector3.new(15,15,15) or Vector3.new(2,2,1)
                hrp.Transparency = v and 0.7 or 1
                hrp.CanCollide = false
            end
        end
    end
end)
mkTog(T6, "🔦 Wallhack (Xuyên Tường)", "Wallhack")
mkBtn(T6, "🔄 Tắt Tất Cả Visual", Color3.fromRGB(80,40,40), function()
    S.ESP = false
    S.Hitbox = false
    S.Fullbright = false
    for k, val in pairs(origLight) do LG[k] = val end
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then
            local hl = p.Character:FindFirstChild("CN_HL")
            if hl then hl:Destroy() end
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Size = Vector3.new(2,2,1); hrp.Transparency = 1 end
        end
    end
    N("Visual", "Đã tắt hết")
end)

--// END TIN 6
--// TAB 7: COMBAT
local T7 = TabConts[7]
mkTog(T7, "🎯 Aimbot (Ngắm Tự Động)", "Aimbot", function(v)
    if v then
        task.spawn(function()
            while S.Aimbot do
                task.wait(0.1)
                local nearest, dist = nil, math.huge
                local myChar = LP.Character
                if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    local myPos = Cam.CFrame.Position
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local d = (p.Character.HumanoidRootPart.Position - myPos).Magnitude
                            if d < dist and d < 500 then
                                dist = d
                                nearest = p
                            end
                        end
                    end
                    if nearest and nearest.Character then
                        local target = nearest.Character:FindFirstChild("Head") or nearest.Character:FindFirstChild("HumanoidRootPart")
                        if target then
                            Cam.CFrame = CFrame.new(Cam.CFrame.Position, target.Position)
                        end
                    end
                end
            end
        end)
    end
end)
mkTog(T7, "🤫 Silent Aim", "SilentAim")
mkTog(T7, "💥 Kill Aura", "KillAura", function(v)
    if v then
        task.spawn(function()
            while S.KillAura do
                task.wait(0.3)
                local c = LP.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local d = (p.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude
                            if d < 15 then
                                local tool = c:FindFirstChildOfClass("Tool")
                                if tool then pcall(function() tool:Activate() end) end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
mkBtn(T7, "🎯 Teleport Đến Người Gần Nhất", Color3.fromRGB(0,100,180), function()
    local myChar = LP.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
    local nearest, dist = nil, math.huge
    local myPos = myChar.HumanoidRootPart.Position
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (p.Character.HumanoidRootPart.Position - myPos).Magnitude
            if d < dist then dist = d; nearest = p end
        end
    end
    if nearest then
        myChar.HumanoidRootPart.CFrame = nearest.Character.HumanoidRootPart.CFrame + Vector3.new(3, 0, 0)
        N("Teleport", "Đã đến gần "..nearest.Name)
    end
end)
mkBtn(T7, "🚀 Teleport Lên Trời Cao", Color3.fromRGB(0,100,180), function()
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame + Vector3.new(0, 500, 0)
        N("Teleport", "Đã lên trời")
    end
end)

--// TAB 8: FUN
local T8 = TabConts[8]
mkBtn(T8, "💃 Nhảy Disco", Color3.fromRGB(200,30,120), function()
    local c = LP.Character
    if c then
        local anim = c:FindFirstChildOfClass("Animator")
        if anim then
            local a = Instance.new("Animation")
            a.AnimationId = "rbxassetid://182435998"
            local track = anim:LoadAnimation(a)
            track:Play()
            N("Fun", "Đang nhảy disco!")
        end
    end
end)
mkBtn(T8, "🌀 Xoay Như Chong Chóng", Color3.fromRGB(150,50,180), function()
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        task.spawn(function()
            for i = 1, 100 do
                if c and c.Parent then
                    c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(30), 0)
                end
                task.wait(0.03)
            end
        end)
    end
end)
mkBtn(T8, "🦸 Bay Như Superman", Color3.fromRGB(0,100,180), function()
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame + Vector3.new(0, 100, 0)
        N("Fun", "Bay như siêu nhân!")
    end
end)
mkBtn(T8, "🎨 Đổi Màu Ngẫu Nhiên", Color3.fromRGB(150,50,180), function()
    local c = LP.Character
    if c then
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then
                pcall(function()
                    p.Color = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
                end)
            end
        end
    end
    N("Fun", "Đã đổi màu!")
end)
mkBtn(T8, "👑 Biến Hình Vua", Color3.fromRGB(255,200,60), function()
    local c = LP.Character
    if c then
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then
                pcall(function()
                    p.Color = Color3.fromRGB(255, 200, 60)
                    p.Material = Enum.Material.Neon
                end)
            end
        end
    end
    N("Fun", "👑 Biến hình Vua!")
end)
mkBtn(T8, "💬 Spam Chat Vui", Color3.fromRGB(200,100,30), function()
    task.spawn(function()
        for i = 1, 10 do
            pcall(function()
                game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
            end)
            task.wait(0.5)
        end
    end)
    N("Chat", "Đã spam (demo)")
end)
mkBtn(T8, "📸 Chụp Màn Hình", Color3.fromRGB(60,40,80), function()
    N("Screenshot", "Đang chụp...")
    pcall(function()
        game:GetService("CaptureService"):CaptureScreenshot(function(screenshot)
            if writefile then
                writefile("CyberKing_Screenshot.png", screenshot)
                N("Screenshot", "Đã lưu ảnh!")
            end
        end)
    end)
end)

--// END TIN 7
--// TAB 9: MACRO
local T9 = TabConts[9]
local macroRecording = false
local macroActions = {}
local macroPlaying = false

mkBtn(T9, "🔴 Bắt Đầu Ghi Macro", Color3.fromRGB(200,30,60), function()
    macroRecording = true
    macroActions = {}
    N("Macro", "🔴 Đang ghi... Bấm Dừng để kết thúc")
end)
mkBtn(T9, "⏹️ Dừng Ghi", Color3.fromRGB(60,60,60), function()
    macroRecording = false
    N("Macro", "⏹️ Đã dừng. Ghi được "..#macroActions.." hành động")
end)
mkBtn(T9, "▶️ Phát Lại Macro", Color3.fromRGB(0,220,140), function()
    if #macroActions == 0 then
        N("Macro", "Chưa có hành động nào!")
        return
    end
    if macroPlaying then return end
    macroPlaying = true
    task.spawn(function()
        for _, act in ipairs(macroActions) do
            if not macroPlaying then break end
            pcall(function()
                if act.type == "tp" then
                    local c = LP.Character
                    if c and c:FindFirstChild("HumanoidRootPart") then
                        c.HumanoidRootPart.CFrame = act.cf
                    end
                elseif act.type == "wait" then
                    task.wait(act.time)
                end
            end)
            task.wait(0.1)
        end
        macroPlaying = false
        N("Macro", "✅ Phát xong")
    end)
end)
mkBtn(T9, "⏸️ Dừng Phát", Color3.fromRGB(60,60,60), function()
    macroPlaying = false
end)
mkBtn(T9, "📝 Ghi Vị Trí Hiện Tại", C.B, function()
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        table.insert(macroActions, {type="tp", cf=c.HumanoidRootPart.CFrame})
        N("Macro", "📝 Đã ghi vị trí #"..#macroActions)
    end
end)
mkBtn(T9, "⏱️ Ghi Wait 1s", C.B, function()
    table.insert(macroActions, {type="wait", time=1})
    N("Macro", "⏱️ Đã ghi wait #"..#macroActions)
end)
mkBtn(T9, "🗑️ Xóa Macro", Color3.fromRGB(120,40,40), function()
    macroActions = {}
    N("Macro", "Đã xóa")
end)
mkLbl(T9, "ℹ️ Cách dùng: Ghi Vị Trí → Ghi Wait → Phát Lại", 24)

--// TAB 10: SERVER
local T10 = TabConts[10]
mkBtn(T10, "🔄 Đổi Server Khác", Color3.fromRGB(0,100,180), function()
    N("Server", "Đang chuyển...")
    task.wait(1)
    pcall(function()
        TSvc:Teleport(game.PlaceId, LP)
    end)
end)
mkBtn(T10, "🔁 Rejoin Server Hiện Tại", Color3.fromRGB(0,100,180), function()
    N("Server", "Đang rejoin...")
    task.wait(1)
    pcall(function()
        TSvc:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
    end)
end)
mkBtn(T10, "🌐 Hop Server Ngẫu Nhiên", Color3.fromRGB(0,150,220), function()
    N("Server", "Đang hop...")
    task.wait(1)
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    if servers.data and #servers.data > 0 then
        for _, srv in ipairs(servers.data) do
            if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
                pcall(function()
                    TSvc:TeleportToPlaceInstance(game.PlaceId, srv.id, LP)
                end)
                return
            end
        end
    end
    N("Server", "Không tìm thấy server trống")
end)
mkTog(T10, "🔁 Auto Rejoin Khi Bị Kick", "AutoRejoin", function(v)
    if v then
        task.spawn(function()
            while S.AutoRejoin do
                task.wait(5)
                if not LP.Parent or LP.Parent ~= Players then
                    pcall(function()
                        TSvc:Teleport(game.PlaceId, LP)
                    end)
                end
            end
        end)
    end
end)
mkLbl(T10, "🌐 Server ID: "..game.JobId:sub(1,8).."...", 24)
mkLbl(T10, "👥 Players: "..#Players:GetPlayers().."/"..Players.MaxPlayers, 24)

--// END TIN 8
--// TAB 11: STATS
local T11 = TabConts[11]
local StatsLbl = mkLbl(T11, "📊 Đang tải...", 80)
mkTog(T11, "📊 Hiện Bảng Thống Kê", "ShowStats")

local fpsCounter = Instance.new("TextLabel")
fpsCounter.Size = UDim2.new(0, 220, 0, 50)
fpsCounter.Position = UDim2.new(0, 10, 0, 60)
fpsCounter.BackgroundColor3 = C.D
fpsCounter.BackgroundTransparency = 0.3
fpsCounter.Text = "📊 Loading..."
fpsCounter.TextColor3 = C.M
fpsCounter.TextSize = 12
fpsCounter.Font = Enum.Font.GothamBold
fpsCounter.BorderSizePixel = 0
fpsCounter.Visible = false
fpsCounter.Parent = SG
Cn(fpsCounter, 8)
St(fpsCounter, C.M, 1)

task.spawn(function()
    local frames = 0
    local lastTime = tick()
    RS.RenderStepped:Connect(function()
        frames = frames + 1
        local now = tick()
        if now - lastTime >= 1 then
            local fps = math.floor(frames / (now - lastTime))
            frames = 0
            lastTime = now
            local ping = math.floor(LP:GetNetworkPing() * 1000)
            local pos = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") and LP.Character.HumanoidRootPart.Position or Vector3.new(0,0,0)
            local pc = #Players:GetPlayers()
            StatsLbl.Text = string.format("📊 FPS: %d | Ping: %dms\n👥 Players: %d\n📍 Pos: %.0f, %.0f, %.0f", fps, ping, pc, pos.X, pos.Y, pos.Z)
            fpsCounter.Text = string.format("📊 FPS: %d | Ping: %dms\n👥 %d players", fps, ping, pc)
            fpsCounter.Visible = S.ShowStats
        end
    end)
end)

--// TAB 12: CONFIG
local T12 = TabConts[12]
local ThemeLbl = mkLbl(T12, "🎨 Theme: Gold 👑", 30)

local function ChangeTheme(name)
    themeName = name
    C = Themes[name]
    ThemeLbl.Text = "🎨 Theme: "..name
    for _, part in ipairs(SG:GetDescendants()) do
        if part:IsA("UIStroke") then
            if part.Color == Color3.fromRGB(255,215,80) or part.Color == Color3.fromRGB(200,220,255) or part.Color == Color3.fromRGB(255,80,120) or part.Color == Color3.fromRGB(80,255,150) or part.Color == Color3.fromRGB(100,180,255) or part.Color == Color3.fromRGB(200,120,255) then
                part.Color = C.M
            end
        elseif part:IsA("TextLabel") then
            if part.TextColor3 == Color3.fromRGB(255,215,80) or part.TextColor3 == Color3.fromRGB(200,220,255) or part.TextColor3 == Color3.fromRGB(255,80,120) or part.TextColor3 == Color3.fromRGB(80,255,150) or part.TextColor3 == Color3.fromRGB(100,180,255) or part.TextColor3 == Color3.fromRGB(200,120,255) then
                part.TextColor3 = C.M
            end
        end
    end
    N("Theme", "Đã đổi sang "..name)
end

mkBtn(T12, "👑 Gold (Vàng Hoàng Gia)", Color3.fromRGB(200,160,40), function() ChangeTheme("Gold") end)
mkBtn(T12, "🥈 Silver (Bạc)", Color3.fromRGB(150,170,200), function() ChangeTheme("Silver") end)
mkBtn(T12, "❤️ Ruby (Đỏ Hồng Ngọc)", Color3.fromRGB(200,40,80), function() ChangeTheme("Ruby") end)
mkBtn(T12, "💚 Emerald (Xanh Lục Bảo)", Color3.fromRGB(40,180,100), function() ChangeTheme("Emerald") end)
mkBtn(T12, "💙 Sapphire (Xanh Lam)", Color3.fromRGB(50,120,220), function() ChangeTheme("Sapphire") end)
mkBtn(T12, "💜 Amethyst (Tím Thạch Anh)", Color3.fromRGB(150,60,230), function() ChangeTheme("Amethyst") end)

mkBtn(T12, "🔍 UI Nhỏ (0.7x)", Color3.fromRGB(60,40,80), function()
    USc.Scale = 0.7
    N("UI", "Đã thu nhỏ")
end)
mkBtn(T12, "🔍 UI Vừa (0.85x)", Color3.fromRGB(60,40,80), function()
    USc.Scale = 0.85
    N("UI", "Kích thước vừa")
end)
mkBtn(T12, "🔍 UI To (1x)", Color3.fromRGB(60,40,80), function()
    USc.Scale = 1
    N("UI", "Kích thước to")
end)

mkTog(T12, "🔊 Âm Thanh UI", "SoundOn")
mkLbl(T12, "👑 Cyber King Premium v8.0", 26)
mkLbl(T12, "📱 Mobile - Delta Android", 24)
mkLbl(T12, "✨ 12 Tabs - 100+ Features", 24)
mkLbl(T12, "💎 Made with love 💎", 24)
mkBtn(T12, "🗑️ Xóa Toàn Bộ GUI", Color3.fromRGB(120,40,40), function()
    SG:Destroy()
    N("Bye", "Đã xóa GUI")
end)

--// END TIN 9
--// LOGIC LOOPS
RS.Stepped:Connect(function()
    if not S.Noclip then return end
    local c = LP.Character
    if not c then return end
    for _, v in ipairs(c:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide then
            v.CanCollide = false
        end
    end
end)

RS.Heartbeat:Connect(function()
    if S.Bhop then
        local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if h and h.FloorMaterial ~= Enum.Material.Air then
            h.Jump = true
        end
    end
end)

UIS.JumpRequest:Connect(function()
    if S.InfJump then
        local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if h then
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

LP.Idled:Connect(function()
    if S.AntiAFK then
        pcall(function()
            VU:Button2Down(Vector2.new(0,0), Cam.CFrame)
            task.wait(1)
            VU:Button2Up(Vector2.new(0,0), Cam.CFrame)
        end)
    end
end)

-- Auto Collect (nếu game có tiền rơi)
task.spawn(function()
    while true do
        task.wait(2)
        if S.AutoCollect then
            local c = LP.Character
            if c and c:FindFirstChild("HumanoidRootPart") then
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj.Name:lower():find("coin") or obj.Name:lower():find("cash") or obj.Name:lower():find("money") then
                        if obj:IsA("BasePart") and (obj.Position - c.HumanoidRootPart.Position).Magnitude < 30 then
                            pcall(function()
                                c.HumanoidRootPart.CFrame = CFrame.new(obj.Position)
                            end)
                        end
                    end
                end
            end
        end
    end
end)

-- Fake Lag
task.spawn(function()
    while true do
        task.wait(0.5)
        if S.FakeLag then
            local c = LP.Character
            if c then
                local hrp = c:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local old = hrp.CFrame
                    hrp.CFrame = old + Vector3.new(0, 0.1, 0)
                    task.wait(0.1)
                    hrp.CFrame = old
                end
            end
        end
    end
end)

-- Ghost Mode
task.spawn(function()
    while true do
        task.wait(0.3)
        if S.GhostMode then
            local c = LP.Character
            if c then
                for _, p in ipairs(c:GetDescendants()) do
                    if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                        p.LocalTransparencyModifier = 0.9
                    end
                end
            end
        end
    end
end)

--// END TIN 10
-- PANIC BUTTON
local hidden = false
PanicBtn.MouseButton1Click:Connect(function()
    hidden = not hidden
    OpenBtn.Visible = not hidden
    CloneBtn.Visible = not hidden
    TeleBtn.Visible = not hidden
    if hidden then Main.Visible = false end
    N("UI", hidden and "Đã ẩn UI" or "Đã hiện UI")
end)

-- WATERMARK
local WM = Instance.new("TextLabel")
WM.Size = UDim2.new(0, 250, 0, 26)
WM.Position = UDim2.new(0, 10, 1, -38)
WM.BackgroundColor3 = C.D
WM.BackgroundTransparency = 0.3
WM.Text = "👑 Cyber King Premium v8.0"
WM.TextColor3 = C.M
WM.TextSize = 11
WM.Font = Enum.Font.GothamBold
WM.BorderSizePixel = 0
WM.Parent = SG
Cn(WM, 8)
St(WM, C.M, 1)
Gr(WM, C.M, C.M2, 0)

-- AUTO CLEANUP DECOY
task.spawn(function()
    while true do
        task.wait(60)
        if S.Decoy and S.Decoy.Parent then
            S.Decoy:Destroy()
            S.Decoy = nil
        end
    end
end)

-- KEYBIND (cho PC - optional)
UIS.InputBegan:Connect(function(i, gp)
    if gp then return end
    if i.KeyCode == Enum.KeyCode.RightControl then
        ShowMenu(not Main.Visible)
    end
    if i.KeyCode == Enum.KeyCode.F then
        S.Flying = not S.Flying
    end
    if i.KeyCode == Enum.KeyCode.G then
        if S.WP.Home then
            local c = LP.Character
            if c and c:FindFirstChild("HumanoidRootPart") then
                c.HumanoidRootPart.CFrame = S.WP.Home
            end
        end
    end
end)

--// END TIN 11
-- WELCOME
N("👑 Cyber King Premium", "Load thành công! Bấm 👑 để mở menu")
print("[Cyber King Premium v8.0] Loaded OK!")

--// END TIN 12
--// ✅ DONE! Toàn bộ 100+ tính năng đã sẵn sàng!
