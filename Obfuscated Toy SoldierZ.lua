--Toy SoldierZ Script|Ciptian
--Credits: phantoms (Main Dev) and Jakub76512 (Helped) on discord
--loadstring(game:HttpGet("https://pastebin.com/raw/GTQC6duh"))() << use this if you want the loadstring

if not game:IsLoaded() then
	game.Loaded:Wait();
end
for _, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
	v:Disable();
end
local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))();
local win = SolarisLib:New({Name=("Ciptian | " .. tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or ("Game-" .. game.PlaceId))),FolderToSave="CelerySolaris"});
local tab = win:Tab("Main");
local Autofarms = tab:Section("Autofarm");
local fwait = task.wait;
local env = (getgenv and getgenv()) or getfenv(0) or _G;
local LoadBuildRemote = game:GetService("ReplicatedStorage"):WaitForChild("ClientServerRemotes"):WaitForChild("LoadBuild");
local StartWaveRemote = game:GetService("ReplicatedStorage"):WaitForChild("ClientServerRemotes"):WaitForChild("StartWave");
local LoadBuildArgs = {[1]=SaveSlot};
local StartWaveArgs = {[1]=WaveInputEasy,[2]=DifficultyInput};
local WaveSelected = Autofarms:Label("Selected Wave: None!");
local DifficultySelected = Autofarms:Label("Selected Difficulty: None!");
local SlotSelected = Autofarms:Label("Selected Save Slot: None!");
Autofarms:Textbox("Input desired wave you'd like to autofarm:", true, function(WaveInputEasy)
	env.EasyInput = WaveInputEasy;
	StartWaveArgs[1] = WaveInputEasy;
	WaveSelected:Set("Selected Wave: " .. tostring(WaveInputEasy));
end);
Autofarms:Textbox("Input desired difficulty you'd like to autofarm:", true, function(DifficultyInput)
	env.Difficultys = DifficultyInput;
	StartWaveArgs[2] = DifficultyInput;
	DifficultySelected:Set("Selected Difficulty: " .. tostring(DifficultyInput));
end);
local disclaimer = Autofarms:Label("For the save slot you have to do Slot1 Slot2, Autosave Etc..");
Autofarms:Textbox("Input desired save slot you'd like to use:", true, function(SaveSlot)
	env.SaveSlots = SaveSlot;
	LoadBuildArgs[1] = SaveSlot;
	SlotSelected:Set("Selected Save Slot: " .. tostring(SaveSlot));
end);
Autofarms:Toggle("Autofarm Toggle", false, "Toggle", function(Bool)
	env.Autofarm1 = Bool;
	while Autofarm1 == true do
		LoadBuildRemote:FireServer(unpack(LoadBuildArgs));
		StartWaveRemote:FireServer(unpack(StartWaveArgs));
		fwait(1);
	end
end);
local tab2 = win:Tab("Auto Crates");
local AutoCrates = tab2:Section("Statuses");
local UnlockCrateRemote = game:GetService("ReplicatedStorage"):WaitForChild("ClientServerRemotes"):WaitForChild("UnlockCrate");
local AutoCrateArgs = {[1]=Crate,[2]=RandomEnabled};
local CrateSelected = AutoCrates:Label("Selected Crate: None!");
local RandomEnabledText = AutoCrates:Label("Random Enabled: false");
local RandomEnabled = false;
local AutoCrates = tab2:Section("Auto Crates");
AutoCrates:Textbox("Input desired crate you'd like to open:", true, function(Crate)
	env.Crates = Crate;
	AutoCrateArgs[1] = Crate;
	CrateSelected:Set("Selected Crate: " .. tostring(Crate));
end);
AutoCrates:Textbox("Random Enabled (true/false): ", true, function(Random)
	env.Random = Random;
	AutoCrateArgs[2] = ((Random == "true") and true) or ((Random == "false") and false);
	RandomEnabledText:Set("Random Enabled: " .. Random);
end);
AutoCrates:Toggle("Auto Crate Toggle", false, "Toggle", function(Bool)
	env.Autofarm1 = Bool;
	while Autofarm1 == true do
		UnlockCrateRemote:InvokeServer(unpack(AutoCrateArgs));
		fwait(1);
	end
end);
local tab3 = win:Tab("Player");
local PlayerSec = tab3:Section("Player");
local WalkspeedSlider = PlayerSec:Slider("Walkspeed", 16, 250, 0, 1, "Slider", function(walkspeed)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed;
end);
local JPSlider = PlayerSec:Slider("Jump Power", 50, 500, 0, 10, "Slider", function(jumpPower)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPower;
end);
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50;
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
PlayerSec:Button("Reset Walkspeed/Jump power", function()
	WalkspeedSlider:Set(0);
	JPSlider:Set(0);
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50;
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
end);
PlayerSec:Button("Inf Jump", function()
	game:GetService("UserInputService").JumpRequest:connect(function()
		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping");
	end);
end);
PlayerSec:Button("Click TP (Click + E)", function()
	local UIS = game:GetService("UserInputService");
	local Player = game.Players.LocalPlayer;
	local Mouse = Player:GetMouse();
	function GetCharacter()
		return game.Players.LocalPlayer.Character;
	end
	function Teleport(pos)
		local Char = GetCharacter();
		if Char then
			Char:MoveTo(pos);
		end
	end
	UIS.InputBegan:Connect(function(input)
		if ((input.UserInputType == Enum.UserInputType.MouseButton1) and UIS:IsKeyDown(Enum.KeyCode.E)) then
			Teleport(Mouse.Hit.p);
		end
	end);
	wait(0.1);
end);
PlayerSec:Button("Inf Yield", function()
	loadstring(game.HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();
end);
local tab3 = win:Tab("Stats");
local LocalPlayerTab = tab3:Section("Stats");
local CurrentBears = LocalPlayerTab:Label("Current Bears: nil");
local WinsStats = LocalPlayerTab:Label("Wins: nil");
local LossStats = LocalPlayerTab:Label("Losses: nil");
local LocalPlayerTab = tab3:Section("Opened Crates");
local BasicBox = LocalPlayerTab:Label("Opened Basic Boxes: nil");
local BasicCrate = LocalPlayerTab:Label("Opened Basic Crates: nil");
local FragileCrate = LocalPlayerTab:Label("Opened Fragile Crates: nil");
local ToyBoxes = LocalPlayerTab:Label("Opened Toy Boxes: nil");
local tab4 = win:Tab("Teleports");
local TPS = tab4:Section("Base Teleports");
TPS:Button("Teleport to Blue Base", function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(8096.307, 5, 8204.78));
end);
TPS:Button("Teleport to Green Base", function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-8288.423, 5, 8205.877));
end);
TPS:Button("Teleport to Red Base", function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-8288.089, 5, -8179.864));
end);
TPS:Button("Teleport to Yellow Base", function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(8097.544, 5, -8178.656));
end);
while wait() do
	CurrentBears:Set("Current Bears: " .. math.round(game.Players.LocalPlayer.Stats.Wealth.Bears.value));
	WinsStats:Set("Wins: " .. math.round(game.Players.LocalPlayer.Stats.Skill.Victories.value));
	LossStats:Set("Losses: " .. math.round(game.Players.LocalPlayer.Stats.Skill.Losses.value));
	BasicBox:Set("Opened Basic Boxes: " .. math.round(game.Players.LocalPlayer.Stats.CratesUnboxed:FindFirstChild("1").value));
	BasicCrate:Set("Opened Basic Crates: " .. math.round(game.Players.LocalPlayer.Stats.CratesUnboxed:FindFirstChild("2").value));
	FragileCrate:Set("Opened Fragile Crates: " .. math.round(game.Players.LocalPlayer.Stats.CratesUnboxed:FindFirstChild("3").value));
	ToyBoxes:Set("Opened Toy Boxes: " .. math.round(game.Players.LocalPlayer.Stats.CratesUnboxed:FindFirstChild("4").value));
end
