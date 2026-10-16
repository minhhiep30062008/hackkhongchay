--// 🐉 DEMO LAYOUT C - TAB NGANG ICON TO
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

if PG:FindFirstChild("DragonDemoC") then PG.DragonDemoC:Destroy() end

-- THEME RỒNG LỬA
local C = {
    M = Color3.fromRGB(255, 80, 30),
    M2 = Color3.fromRGB(255, 180, 40),
    D = Color3.fromRGB(10, 4, 4),
    Mid = Color3.fromRGB(24, 10, 10),
    B = Color3.fromRGB(40, 18, 18),
    T = Color3.fromRGB(255, 220, 180),
}

local SG = Instance.new("ScreenGui")
SG.Name = "DragonDemoC"
SG.ResetOnSpawn = false
SG.IgnoreGuiInset = true
SG.DisplayOrder = 999999
SG.Parent = PG

local function Cn(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = p
end

local function St(p, col, th)
    local s = Instance.new("UIStroke")
    s.Color = col
    s.Thickness = th or 1.5
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
        if dg then
            local d = i.Position - st
            f.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
        end
    end)
    UIS.InputEnded:Connect(function() dg = false end)
end

-- NÚT NỔI
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 56, 0, 56)
OpenBtn.Position = UDim2.new(0, 15, 0.4, 0)
OpenBtn.BackgroundColor3 = C.D
OpenBtn.Text = "🐉"
OpenBtn.TextColor3 = C.M
OpenBtn.TextSize = 26
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.BorderSizePixel = 0
OpenBtn.Parent = SG
Cn(OpenBtn, 28)
St(OpenBtn, C.M, 2.5)
Drag(OpenBtn)

-- MAIN MENU
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 400, 0, 380)
Main.Position = UDim2.new(0.5, -200, 0.5, -190)
Main.BackgroundColor3 = C.D
Main.BorderSizePixel = 0
Main.Visible = false
Main.ClipsDescendants = true
Main.Parent = SG
Cn(Main, 16)
St(Main, C.M, 2)

local mainGrad = Instance.new("UIGradient")
mainGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, C.D),
    ColorSequenceKeypoint.new(0.5, C.Mid),
    ColorSequenceKeypoint.new(1, C.D),
}
mainGrad.Rotation = 45
mainGrad.Parent = Main

-- TITLE BAR
local TB = Instance.new("Frame")
TB.Size = UDim2.new(1, 0, 0, 40)
TB.BackgroundColor3 = C.Mid
TB.BackgroundTransparency = 0.2
TB.BorderSizePixel = 0
TB.Parent = Main
Cn(TB, 16)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 14, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🐉 CYBER DRAGON v8.0"
Title.TextColor3 = C.M
Title.TextSize = 14
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TB
Gr(Title, C.M, C.M2, 0)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -32, 0, 7)
CloseBtn.BackgroundColor3 = Color3.fromRGB(230, 50, 70)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TB
Cn(CloseBtn, 6)

-- TAB NGANG + ICON TO (LAYOUT C)
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 55)
TabBar.Position = UDim2.new(0, 0, 0, 42)
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

local Tabs = {
    {icon="⚡", name="Speed"},
    {icon="🛸", name="Fly"},
    {icon="🏠", name="Home"},
    {icon="🛡️", name="Support"},
    {icon="🎭", name="Char"},
    {icon="🔮", name="Visual"},
    {icon="⚔️", name="Combat"},
    {icon="🎪", name="Fun"},
    {icon="⚙️", name="Config"},
}

local TabBtns = {}
local TabConts = {}

for i, tab in ipairs(Tabs) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 60, 0, 45)
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

-- Content
local Cont = Instance.new("Frame")
Cont.Size = UDim2.new(1, -12, 1, -110)
Cont.Position = UDim2.new(0, 6, 0, 102)
Cont.BackgroundTransparency = 1
Cont.Parent = Main

for i = 1, #Tabs do
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
    TabBtns[idx].TextColor3 = Color3.new(1, 1, 1)
    Gr(TabBtns[idx], C.M, C.M2, 45)
    for i, c in ipairs(TabConts) do
        c.Visible = (i == idx)
    end
end

for i, b in ipairs(TabBtns) do
    b.MouseButton1Click:Connect(function() SwitchT(i) end)
end
SwitchT(1)

-- DEMO NÚT MẪU
local function mkDemoBtn(p, txt, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 34)
    b.Position = UDim2.new(0, 0, 0, y)
    b.BackgroundColor3 = C.B
    b.Text = txt
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = p
    Cn(b, 7)
    return b
end

mkDemoBtn(TabConts[1], "⚡ Speed 16 (Mặc định)", 0)
mkDemoBtn(TabConts[1], "⚡ Speed 100", 40)
mkDemoBtn(TabConts[1], "⚡ Speed 500", 80)
mkDemoBtn(TabConts[1], "⚡ Speed 1000", 120)
mkDemoBtn(TabConts[2], "🚀 BẬT BAY LƯỢN", 0)
mkDemoBtn(TabConts[2], "➕ Tăng Tốc", 40)
mkDemoBtn(TabConts[2], "➖ Giảm Tốc", 80)
mkDemoBtn(TabConts[3], "🏠 Lưu Nhà", 0)
mkDemoBtn(TabConts[3], "➡️ Đi Nhà", 40)
mkDemoBtn(TabConts[4], "🚪 Noclip", 0)
mkDemoBtn(TabConts[4], "🦘 Inf Jump", 40)
mkDemoBtn(TabConts[5], "🙆 Big Head", 0)
mkDemoBtn(TabConts[6], "👁️ ESP", 0)
mkDemoBtn(TabConts[7], "🎯 Aimbot", 0)
mkDemoBtn(TabConts[8], "💃 Disco", 0)
mkDemoBtn(TabConts[9], "🎨 Theme", 0)

-- SHOW/HIDE
local function ShowMenu(sh)
    if sh then
        Main.Visible = true
        Main.Size = UDim2.new(0, 0, 0, 0)
        Main.Rotation = -6
        TweenService:Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 400, 0, 380),
            Rotation = 0,
        }):Play()
    else
        local tw = TweenService:Create(Main, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Rotation = 6,
        })
        tw:Play()
        tw.Completed:Connect(function()
            Main.Visible = false
            Main.Rotation = 0
        end)
    end
end

OpenBtn.MouseButton1Click:Connect(function() ShowMenu(not Main.Visible) end)
CloseBtn.MouseButton1Click:Connect(function() ShowMenu(false) end)
Drag(Main, TB)

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "🐉 DEMO Layout C",
        Text = "Bấm 🐉 để xem giao diện!",
        Duration = 3
    })
end)
