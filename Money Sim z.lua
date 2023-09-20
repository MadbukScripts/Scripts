function unformat(x)
    local suffixes = {'k','M','B','T','Qa','Qn','Se'}
    num = x:match("%d+.%d+") or x:match("%d+")
    if string.find(x, ",") then
        result = string.gsub(x,",","")
    elseif table.find(suffixes,x:match("%a+")) then
        result = num*10^(table.find(suffixes,x:match("%a+"))*3)
    else 
        result = x
    end
    return result
end

function format(x,d)
    local suffixes = {'k','M','B','T','Qa','Qn'}

    for i,v in next, suffixes do 
        suffix = 1*10^(i*3)
        if x/suffix >= 1 and x/suffix < 1000 then
            result = string.format("%."..d.."f",x/suffix)..v
        end
    end
    return result
end

local player = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage:WaitForChild("Events")

local MadbukLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/MadbukScripts/Madbuk-Library/main/GUI"))()

local main = MadbukLibrary:Init({
	name = "Money Simulator Z --- Madbuk Scripts",
	intro = true,
	multiple = false,
	sounds = {
		hover = "rbxassetid://10066936758",
		click = "rbxassetid://10066936758",
		type = "rbxassetid://10066936758",
		start = "rbxassetid://4835664238",
		notify = "rbxassetid://3318722848"
	}
})


local tab = main:CreateTab({
	name = "Main",
	icon = "rbxassetid://13965544901"
})

local label = tab:CreateLabel({
	text = "Remember to click the three lines in the top left for more tabs!"
})

local toggle = tab:CreateToggle({
	name = "Fast Money",
	callback = function(value)
		getgenv().Money = value
        while Money and task.wait(0.1) do
            local args = {
                [1] = 1,
                [2] = false
            }

            game:GetService("ReplicatedStorage").Events.BuyMachine:FireServer(unpack(args))
            fireclickdetector(workspace.MachineBoost.MachineBoost1.ClickDetector)
        end
	end,
})


local toggle = tab:CreateToggle({
	name = "Quick Gems",
	callback = function(value)
		getgenv().Gems = value
        while Gems and task.wait(0.06) do
            fireclickdetector(workspace.IncreaseGemButton.ClickDetector)
        end
	end,
})

local toggle = tab:CreateToggle({
	name = "Auto Gems",
	callback = function(value)
		getgenv().Gems = value
        while Gems and task.wait(0.2) do
            for i,v in next, workspace.Factory.Gems:GetChildren() do
                fireclickdetector(v.ClickDetector)
            end
        end
	end,
})


local toggle = tab:CreateToggle({
	name = "Auto Perks",
	callback = function(value)
		getgenv().Perk = value
        while Perk and task.wait(1) do
            for v = 1,10,1 do
                local args = {
                    [1] = v
                }

                game:GetService("ReplicatedStorage").Events.LevelPerk:FireServer(unpack(args))
                local args = {
                    [1] = v
                }

                game:GetService("ReplicatedStorage").Events.OrePerk:FireServer(unpack(args))
            end
        end
	end,
})



getgenv().PrestigeDelay = 1

local toggle = tab:CreateToggle({
	name = "Auto Prestige",
	callback = function(value)
		getgenv().Prestige = value
        print(PrestigeWant,PrestigeFor)
        while Prestige and task.wait(PrestigeDelay) do
            game:GetService("ReplicatedStorage").Events.Prestige:FireServer()
        end
	end,
})

local slider = tab:CreateSlider({
	name = "Prestige Delay",
	min = 0,
	default = 50,
	max = 1000,
	callback = function(value)
		PrestigeDelay = value
	end,
})

getgenv().RebirthDelay = 59

local toggle = tab:CreateToggle({
	name = "Auto Rebirth",
	callback = function(value)
		getgenv().Rebirth = value
        while Rebirth and task.wait(RebirthDelay) do
            game:GetService("ReplicatedStorage").Events.Rebirth:FireServer()
        end
	end,
})

local slider = tab:CreateSlider({
	name = "Rebirth Delay",
	min = 0,
	default = 50,
	max = 1000,
	callback = function(value)
		RebirthDelay = value
	end,
})


local tab = main:CreateTab({
	name = "Upgrades",
	icon = "rbxassetid://14287321323"
})

local toggle = tab:CreateToggle({
	name = "Auto Upgrade",
	callback = function(value)
		getgenv().GenUpg = value
        while GenUpg and task.wait(0.5) do
            for v = 1,10,1 do
                local args = {
                    [1] = v,
                    [2] = 2,
                    [3] = false
                }

                game:GetService("ReplicatedStorage").Events.UpgradeMachine:FireServer(unpack(args))
            end
        end
	end,
})

local toggle = tab:CreateToggle({
	name = "Auto Machines",
	callback = function(value)
		getgenv().Machines = value
        while Machines and task.wait() do
            for i = 1 , 5 , 1 do 
                if player.Stats["FactoryUpgrade"..tostring(i)].Value < factoryUpgradeLimits[i] then
                    events.BuyMachine:FireServer(i,true)
                    events.BuyMoreMachines:FireServer(i,2,true)
                    
                    wait(.5)
                end
            end
        end
	end,
})

local factoryUpgradeLimits = {
    [1] = 20,
    [2] = 18,
    [3] = math.huge,
    [4] = 9,
    [5] = 20,
}

local toggle = tab:CreateToggle({
	name = "Auto Factory",
	callback = function(value)
		getgenv().Factory = value
        while Factory and task.wait() do
            for i = 1 , 5 , 1 do 
                if player.Stats["FactoryUpgrade"..tostring(i)].Value < factoryUpgradeLimits[i] then
                    events.FactoryUpgrade:FireServer(i,true)
                    wait(.5)
                end
            end
        end
	end,
})

local toggle = tab:CreateToggle({
	name = "Prestige Upgrades",
	callback = function(value)
		getgenv().PresUpgs = value
        while PresUpgs and task.wait(.5) do
            for _,v in next, ReplicatedStorage.PrestigeData:GetChildren() do 
                if not player.Stats:FindFirstChild("PrestigeUpgrade"..v.NeedToUnlock.Value) or player.Stats:FindFirstChild("PrestigeUpgrade"..v.Name) and player.Stats["PrestigeUpgrade"..v.Name].Value < v.UpgradeLimit.Value or player.Stats["PrestigeUpgrade"..v.NeedToUnlock.Value].Value > 0 and player.Stats["PrestigeUpgrade"..v.Name].Value < v.UpgradeLimit.Value then 
                    ReplicatedStorage.Events.PrestigeUpgrade:FireServer(tonumber(v.Name), 50)
                end
            end
        end
	end,
})

local toggle = tab:CreateToggle({
	name = "Rebirth Upgrades",
	callback = function(value)
		getgenv().RebUpgs = value
        while RebUpgs and task.wait(.5) do
            for _,v in next, ReplicatedStorage.RebirthData:GetChildren() do 
                if not player.Stats:FindFirstChild("RebirthUpgrade"..v.NeedToUnlock.Value) or player.Stats:FindFirstChild("RebirthUpgrade"..v.Name) and player.Stats["RebirthUpgrade"..v.Name].Value < v.UpgradeLimit.Value or player.Stats["RebirthUpgrade"..v.NeedToUnlock.Value].Value > 0 and player.Stats["RebirthUpgrade"..v.Name].Value < v.UpgradeLimit.Value then 
                    events.RebirthUpgrade:FireServer(tonumber(v.Name), 50)
                end
            end
        end
	end,
})


local toggle = tab:CreateToggle({
	name = "Research Upgrades",
	callback = function(value)
		getgenv().ResUpgs = value
        while ResUpgs and task.wait(5) do
            for v = 1,100,1 do
                local args = {
                    [1] = v
                }

                game:GetService("ReplicatedStorage").Events.Research:FireServer(unpack(args))
            end
        end
	end,
})

local toggle = tab:CreateToggle({
	name = "Gem Upgrades",
	callback = function(value)
		getgenv().GemUpgs = value
        while GemUpgs and task.wait(1) do
            for v = 1,10,1 do
                local args = {
                    [1] = v
                }

                game:GetService("ReplicatedStorage").Events.GemUpgrade:FireServer(unpack(args))
            end
        end
	end,
})

local toggle = tab:CreateToggle({
	name = "Mine Upgrades",
	callback = function(value)
		getgenv().MineUpgs = value
        while MineUpgs and task.wait(1) do
            for v = 1,20,1 do
                local args = {
                    [1] = v
                }

                game:GetService("ReplicatedStorage").Events.PickaxeUpgrade:FireServer(unpack(args))
                local args = {
                    [1] = v,
                    [2] = 1
                }

                game:GetService("ReplicatedStorage").Events.OreUpgrade:FireServer(unpack(args))
            end
        end
	end,
})






local tab = main:CreateTab({
	name = "Misc",
	icon = "rbxassetid://14198030946"
})



    local function getOreList()
        local stringOreList = {}
        
        local oreList = {}
        local sortedOres = {}

        for _,ore in next, ReplicatedStorage.OresPrices:GetChildren() do
            oreList[ore.Name] = ore.Value
            table.insert(stringOreList, ore.Name)
        end

        for oreName, _ in pairs(oreList) do
            table.insert(sortedOres, oreName)
        end

        table.sort(sortedOres, function(a, b)
            return oreList[a] < oreList[b]
        end)

        local priorityOres = {}
        for i, oreName in ipairs(sortedOres) do
            priorityOres[oreName] = i
        end
        
        local priorityOresStrings = {}
        local amount = 0
        for _, oreName in ipairs(sortedOres) do
            table.insert(priorityOresStrings, oreName)
            amount += 1
        end

        return priorityOres, priorityOresStrings, amount
    end
    local oreList, stringOreList, totalOres = getOreList()
    

    local function getDepth(position)
        return math.abs(math.floor(position.Y / 6))
    end
    if not getgenv().miningDepth then
        getgenv().miningDepth = 100
    end

    local function getAllAttackableOres(ignoreStone, range, enforceDepth)
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            return
        end
        
        local attackableOres = {}
        local distance = range or (18 + player.Stats.MiningUpgrade4.Value * 6)
        local rootPartPosition = player.Character.HumanoidRootPart.Position
    
        for _, chunk in ipairs(workspace.MineChunks:GetChildren()) do 
            for _, ore in ipairs(chunk:GetChildren()) do
                if ore:IsA("BasePart") and ore.Name ~= "Bedrock" and ore:FindFirstChild("Health") and ore.Health.Value > 0 then
                    local orePosition = ore.Position
                    local distanceToOre = (orePosition - rootPartPosition).Magnitude
    
                    if ignoreStone then
                        if oreList[ore.Name] then
                            table.insert(attackableOres, ore)
                        end
                    else
                        if distanceToOre <= distance then
                            if enforceDepth then
                                if getDepth(orePosition) == getgenv().miningDepth then
                                    table.insert(attackableOres, ore)
                                end
                            else
                                table.insert(attackableOres, ore)
                            end
                        end
                    end
                end
            end
        end
        if not ignoreStone and #attackableOres == 0 and range == math.huge and enforceDepth then
            local lowestY = math.huge
            local lowestOre = nil
            for _, chunk in ipairs(workspace.MineChunks:GetChildren()) do 
                for _, ore in ipairs(chunk:GetChildren()) do
                    local orePosition = ore.Position
                    local oreY = orePosition.Y
                    if oreY < lowestY then
                        lowestY = oreY
                        lowestOre = ore
                    end
                end
            end
            return {lowestOre}
            
        elseif ignoreStone and #attackableOres == 0 then
            return getAllAttackableOres(false, math.huge, enforceDepth)
        end
    
        return attackableOres
    end
    
    



    local ores = {}
    local function getNextMiningOre(bool, distance, rec)
        local found = false
        for _,v in next, ores do
            found = true
            break
        end
        warn(found)
        if not found and not rec then
            ores = getAllAttackableOres(bool, distance, true)
            table.sort(ores, function(a,b)
                local priorityA = oreList[a.Name] or 0
                local priorityB = oreList[b.Name] or 0
                return priorityA > priorityB
            end)
            return getNextMiningOre(bool, distance, rec)
        end
        return ores[1]
    end


    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.new(0,255,0)


	local toggle = tab:CreateToggle({
	name = "Auto Quarry",
	callback = function(value)
		getgenv().Mine = value
        while Mine and task.wait() do
            task.wait()
                local ore = getNextMiningOre(true, math.huge)
                if ore then
                    highlight.Enabled = true
                    highlight.Parent = ore
                    task.spawn(function()
                        repeat
                            getgenv().isMiningQuarry = true
                            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                player.Character.HumanoidRootPart.CFrame = ore.CFrame
                            else
                                break
                            end
                            task.wait()
                        until not ore or not ore.Parent or not getgenv().Mine
                    end)
                    if ore:FindFirstChild("Health") then
                        local health = ore.Health.Value
                        local t = tick()
                        repeat
                            game:GetService("ReplicatedStorage").Events.Mine:FireServer(ore)
                            if ore:FindFirstChild("Health") then
                                if ore.Health.Value ~= health then
                                    health = ore.Health.Value
                                elseif tick() - t > 1 then
                                    highlight.Parent = game:GetService("CoreGui")
                                    highlight.Enabled = false
                                    ore:Destroy()
                                    break
                                end
                            end
                            wait()
                        until not ore.Parent or not getgenv().Mine
                        table.remove(ores, table.find(ores, ore))
                        
                        getgenv().isMiningQuarry = false
                        if not getgenv().Mine then
                            break
                        end
                    end
                else
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(19.9446526, 7.64234638, 2525.29077, 0.999993265, -4.27085887e-08, -0.00367515767, 4.28989821e-08, 1, 5.17268433e-08, 0.00367515767, -5.18841539e-08, 0.999993265)
                end
        end
	end,
})



local toggle = tab:CreateToggle({
	name = "Hit Tree",
	callback = function(value)
		getgenv().Tree = value
        while Tree and task.wait() do
            events.HitTree:FireServer()
        end
	end,
})

local toggle = tab:CreateToggle({
	name = "Collect Tree",
	callback = function(value)
		getgenv().CTree = value
        while CTree and task.wait() do
            if player.Character and player.Character.PrimaryPart then
                for _,v in next, game:GetService("Workspace").Factory.TreeObjects:GetChildren() do 
                    v.CanCollide = false
                    v.CFrame = player.Character.HumanoidRootPart.CFrame
                end
            end
        end
	end,
})


local tab = main:CreateTab({
	name = "Teleports",
	icon = "rbxassetid://14236849628"
})

local button = tab:CreateButton({
	name = "Factory",
	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpawnLocation.CFrame + Vector3.new(0,2,0)
	end,
})

local button = tab:CreateButton({
	name = "City",
	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(704.513245, 7.64234734, 134.697647, 0.955939233, -4.1481659e-08, 0.293564647, 4.18234904e-08, 1, 5.11283016e-09, -0.293564647, 7.390343e-09, 0.955939233)
	end,
})

local button = tab:CreateButton({
	name = "Mine",
	callback = function()
		events.EnterMine:FireServer(1)
	end,
})









































main:NotificationCreate({
	name = "Success",
	description = "Successfully ran script",
	duration = 2.6,
	button = {
		enabled = false,
		content = "Okay!",
		icon = "rbxassetid://13965544901",
		callback = function()
			print("Okay")
		end,
	}
})
