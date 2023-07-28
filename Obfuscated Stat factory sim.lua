local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()

local win = SolarisLib:New({
    Name = "MadBuk",
    FolderToSave = "MadbukStuffs"
  })
root = game.Players.LocalPlayer.Character.HumanoidRootPart
local tab = win:Tab("Auto Farm")
local sec = tab:Section("Auto Recovery requires 1 eclipse")


SolarisLib:Notification("Subscribe", "Thanks for using MadBuk's")
PoDelay = 1
LiDelay = 1
ChDelay = 1
NuDelay = 1
FiDelay = 1
SoDelay = 1
EcDelay = 1
DaDelay = 1
ShDelay = 1
FuDelay = 1
InqDelay = 1
ElecDelay = 1
--------------------------------------------- farming uwu ----------------------------------

local toggle = sec:Toggle("Auto Recover", false,"Toggle", function(Value)
    getgenv().AutoRec = false;
    getgenv().AutoRec = Value
    while getgenv().AutoRec == true do
        local part = workspace.Map.EclipseRecoveryButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        task.wait(0.2)
    end
end)
local toggle = sec:Toggle("Auto Power", false,"Toggle", function(Value)
    getgenv().AutoPow = false;
    getgenv().AutoPow = Value
    while getgenv().AutoPow == true do
        local part = workspace.Map.Part

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(PoDelay)
    end
end)


local toggle = sec:Toggle("Auto Light", false,"Toggle", function(Value)
    getgenv().AutoLi = false;
    getgenv().AutoLi = Value
    while getgenv().AutoLi == true do
        local part = workspace.Map.LightButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(LiDelay)
    end
end)

local toggle = sec:Toggle("Auto Charge", false,"Toggle", function(Value)
    getgenv().AutoCh = false;
    getgenv().AutoCh = Value
    while getgenv().AutoCh == true do
        local part = workspace.Map.ChargeButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(ChDelay)
    end
end)

local toggle = sec:Toggle("Auto Nuclear", false,"Toggle", function(Value)
    getgenv().AutoNu = false;
    getgenv().AutoNu = Value
    while getgenv().AutoNu == true do
        local part = workspace.Map.NuclearButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(NuDelay)
    end
end)

local toggle = sec:Toggle("Auto Fission", false,"Toggle", function(Value)
    getgenv().AutoFi = false;
    getgenv().AutoFi = Value
    while getgenv().AutoFi == true do
        local part = workspace.Map.FissionButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(FiDelay)
    end
end)

local toggle = sec:Toggle("Auto Solar", false,"Toggle", function(Value)
    getgenv().AutoSo = false;
    getgenv().AutoSo = Value
    while getgenv().AutoSo == true do
        local part = workspace.Map.SolarButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(SoDelay)
    end
end)

local toggle = sec:Toggle("Auto Eclipse", false,"Toggle", function(Value)
    getgenv().AutoEc = false;
    getgenv().AutoEc = Value
    while getgenv().AutoEc == true do
        local part = workspace.Map.EclipseButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(EcDelay)
    end
end)

local toggle = sec:Toggle("Auto Fusion", false,"Toggle", function(Value)
    getgenv().AutoFu = false;
    getgenv().AutoFu = Value
    while getgenv().AutoFu == true do
        local part = workspace.Map2.FusionButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(FuDelay)
    end
end)

local toggle = sec:Toggle("Auto Darkness", false,"Toggle", function(Value)
    getgenv().AutoDa = false;
    getgenv().AutoDa = Value
    while getgenv().AutoDa == true do
        local part = workspace.DarknessMap.DarknessButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(DaDelay)
    end
end)

local toggle = sec:Toggle("Auto Shadow", false,"Toggle", function(Value)
    getgenv().AutoSh = false;
    getgenv().AutoSh = Value
    while getgenv().AutoSh == true do
        local part = workspace.DarknessMap.ShadowButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(ShDelay)
    end
end)

local toggle = sec:Toggle("Auto Inquity", false,"Toggle", function(Value)
    getgenv().AutoInq = false;
    getgenv().AutoInq = Value
    while getgenv().AutoInq == true do
        local part = workspace.Map.IniquityButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(inqDelay)
    end
end)
local toggle = sec:Toggle("Auto Electricity", false,"Toggle", function(Value)
    getgenv().AutoElec = false;
    getgenv().AutoElec = Value
    while getgenv().AutoElec == true do
        local part = workspace.Map.ElectricityButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        wait(ElecDelay)
    end
end)
---------------------------------------------- upgrades -------------------------------------

local tab = win:Tab("upgrades")
local sec = tab:Section("Elements")

local toggle = sec:Toggle("Power", false,"Toggle", function(Value)
    getgenv().AutoPoU = false;
    getgenv().AutoPoU = Value
    while getgenv().AutoPoU == true do
        local part = workspace.Map.Upgrades.PowerLightUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)

        wait(0.2)
    end
end)

local toggle = sec:Toggle("Light", false,"Toggle", function(Value)
    getgenv().AutoLiU = false;
    getgenv().AutoLiU = Value
    while getgenv().AutoLiU == true do
        local part = workspace.Map.Upgrades.LightPowUpgradeButton
        local part2 = workspace.Map.Upgrades.LightChargeUpgradeButton
        local part3 = workspace.Map.Upgrades.LightBpsUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)
        firetouchinterest(part3,root,1)
        firetouchinterest(part3,root,0)

        wait(0.2)
    end
end)

local toggle = sec:Toggle("Charge", false,"Toggle", function(Value)
    getgenv().AutoChU = false;
    getgenv().AutoChU = Value
    while getgenv().AutoChU == true do
        local part = workspace.Map.Upgrades.ChargePowUpgradeButton
        local part2 = workspace.Map.Upgrades.ChargeLightUpgradeButton
        local part3 = workspace.Map.Upgrades.ChargeNuclearUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)
        firetouchinterest(part3,root,1)
        firetouchinterest(part3,root,0)

        wait(0.2)
    end
end)

local toggle = sec:Toggle("Nuclear", false,"Toggle", function(Value)
    getgenv().AutoNuU = false;
    getgenv().AutoNuU = Value
    while getgenv().AutoNuU == true do
        local part = workspace.Map.Upgrades.NuclearPowUpgradeButton
        local part2 = workspace.Map.Upgrades.NuclearLightUpgradeButton
        local part3 = workspace.Map.Upgrades.NuclearFissionUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)
        firetouchinterest(part3,root,1)
        firetouchinterest(part3,root,0)

        wait(0.2)
    end
end)
local toggle = sec:Toggle("Fission", false,"Toggle", function(Value)
    getgenv().AutoFiU = false;
    getgenv().AutoFiU = Value
    while getgenv().AutoFiU == true do
        local part = workspace.Map.Upgrades.FissionLightUpgradeButton
        local part2 = workspace.Map.Upgrades.FissionChargeUpgradeButton
        local part3 = workspace.Map.Upgrades.FissionSolarUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)
        firetouchinterest(part3,root,1)
        firetouchinterest(part3,root,0)

        wait(0.2)
    end
end)
local toggle = sec:Toggle("Solar", false,"Toggle", function(Value)
    getgenv().AutoSoU = false;
    getgenv().AutoSoU = Value
    while getgenv().AutoSoU == true do
        local part = workspace.Map.Upgrades.SolarChargeUpgradeButton
        local part2 = workspace.Map.Upgrades.SolarNuclearUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)

        wait(0.2)
    end
end)
local toggle = sec:Toggle("Eclipse", false,"Toggle", function(Value)
    getgenv().AutoEcU = false;
    getgenv().AutoEcU = Value
    while getgenv().AutoEcU == true do
        local part = workspace.Map.Upgrades.EclipseSolarUpgradeButton
        local part2 = workspace.Map.Upgrades.EclipseDarknessUpgradeButton
        local part3 = workspace.Map.Upgrades.EclipseFusionUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)
        firetouchinterest(part3,root,1)
        firetouchinterest(part3,root,0)

        wait(0.2)
    end
end)

local toggle = sec:Toggle("Fusion", false,"Toggle", function(Value)
    getgenv().AutoFuU = false;
    getgenv().AutoFuU = Value
    while getgenv().AutoFuU == true do
        local part = workspace.Map2.FusionEclipseUpgradeButton
        local part2 = workspace.Map2.FusionShadowUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)

        wait(0.2)
    end
end)
local toggle = sec:Toggle("Darkness", false,"Toggle", function(Value)
    getgenv().AutoDaU = false;
    getgenv().AutoDaU = Value
    while getgenv().AutoDaU == true do
        local part = workspace.DarknessMap.DarknessShadowUpgradeButton

        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)

        wait(0.2)
    end
end)


local toggle = sec:Toggle("Shadow", false,"Toggle", function(Value)
    getgenv().AutoShU = false;
    getgenv().AutoShU = Value
    while getgenv().AutoShU == true do
        local part = workspace.DarknessMap.ShadowPowUpgradeButton
        local part2 = workspace.DarknessMap.ShadowEclipseUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)

        wait(0.2)
    end
end)
local toggle = sec:Toggle("Inquity", false,"Toggle", function(Value)
    getgenv().AutoInqU = false;
    getgenv().AutoInqU = Value
    while getgenv().AutoInqU == true do
        local part = workspace.Map.Upgrades.IniquitySolarUpgradeButton
        local part2 = workspace.Map.Upgrades.IniquityShadowUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)

        wait(0.2)
    end
end)
local toggle = sec:Toggle("electricity", false,"Toggle", function(Value)
    getgenv().AutoElecU = false;
    getgenv().AutoElecU = Value
    while getgenv().AutoElecU == true do
        local part = workspace.Map.Upgrades.ElectricityDarknessUpgradeButton
        local part2 = workspace.Map.Upgrades.ElectricityFissionUpgradeButton
        firetouchinterest(part,root,1)
        firetouchinterest(part,root,0)
        firetouchinterest(part2,root,1)
        firetouchinterest(part2,root,0)

        wait(0.2)
    end
end)



















--------------------------------------- delays -------------------------------------




local tab = win:Tab("Delays")
local sec = tab:Section("1 = 1 second")

sec:Textbox("Power", true, function(Value)
    PoDelay = Value
end)
sec:Textbox("Light", true, function(Value)
    LiDelay = Value
end)
sec:Textbox("Charge", true, function(Value)
    ChDelay = Value
end)
sec:Textbox("Nuclear", true, function(Value)
    NuDelay = Value
end)
sec:Textbox("Fission", true, function(Value)
    FiDelay = Value
end)
sec:Textbox("Solar", true, function(Value)
    SoDelay = Value
end)
sec:Textbox("Eclipse", true, function(Value)
    EcDelay = Value
end)
sec:Textbox("Fusion", true, function(Value)
    FuDelay = Value
end)
sec:Textbox("Darkness", true, function(Value)
    DaDelay = Value
end)
sec:Textbox("Shadow", true, function(Value)
    ShDelay = Value
end)
sec:Textbox("Inquity", true, function(Value)
    InqDelay = Value
end)
sec:Textbox("Electricity", true, function(Value)
    ElecDelay = Value
end)

--------------------------------------------- stats -------------------------------------
local tab = win:Tab("Stats")
local sec = tab:Section("Elements")

local PowerStat = sec:Label("Power")
local LightStat = sec:Label("Light")
local ChargeStat = sec:Label("Charge")
local NuclearStat = sec:Label("Nuclear")
local FissionStat = sec:Label("Fission")
local SolarStat = sec:Label("Solar")
local EclipseStat = sec:Label("Eclipse")
local FusionStat = sec:Label("Fusion")
local DarknessStat = sec:Label("Darkness")
local ShadowStat = sec:Label("Shadow")
local InquityStat = sec:Label("Inquity")
local ElectricityStat = sec:Label("Electicity")

local tab = win:Tab("Player Stuffs")
local sec = tab:Section("Elements")

local slider = sec:Slider("Walkspeed", 25,200,25,2.5,"Slider", function(t)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
end)

sec:Button("Inf Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)


while wait() do
    PowerStat:Set("Power: "..workspace.Map.PowerLabel.SurfaceGui.PowerNum.Text)
    LightStat:Set("Light: "..workspace.Map.LightLabel.SurfaceGui.LightNum.Text)
    ChargeStat:Set("Charge: "..workspace.Map.ChargeLabel.SurfaceGui.Num.Text)
    NuclearStat:Set("Nuclear: "..workspace.Map.NuclearLabel.SurfaceGui.Num.Text)
    FusionStat:Set("Fusion: "..workspace.Map.FissionLabel.SurfaceGui.Num.Text)
    SolarStat:Set("Solar: "..workspace.Map.SolarLabel.SurfaceGui.Num.Text)
    EclipseStat:Set("Eclipse: "..workspace.Map.EclipseLabel.SurfaceGui.Num.Text)
    FusionStat:Set("Fusion: "..workspace.Map2.FusionLabel.SurfaceGui.Num.Text)
    DarknessStat:Set("Darkness: "..workspace.DarknessMap.DarknessLabel.SurfaceGui.PowerNum.Text)
    ShadowStat:Set("Shadow: "..workspace.DarknessMap.ShadowLabel.SurfaceGui.Num.Text)
    InquityStat:Set("Inquity: "..workspace.Map.IniquityLabel.SurfaceGui.Num.Text)
    ElectricityStat:Set("Electricty: "..workspace.Map.ElectricityLabel.SurfaceGui.Num.Text)
end

