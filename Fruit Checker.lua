local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player.PlayerGui

player.PlayerGui.CallAllPets.Enabled = true

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FruitTrackerGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 600)
mainFrame.Position = UDim2.new(1, -250, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(80, 80, 80)
mainStroke.Thickness = 1
mainStroke.Transparency = 0.7
mainStroke.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
topBar.BackgroundTransparency = 0
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.4, 0, 1, 0)
title.Parent = topBar
title.Text = "Fruit Checker"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local refresh = Instance.new("TextButton")
refresh.Size = UDim2.new(0.4, 0, 0.8, 0)
refresh.Position = UDim2.new(0.45, 0, 0.1, 0)
refresh.Parent = topBar
refresh.Text = "Refresh"
refresh.BackgroundTransparency = 0
refresh.BackgroundColor3 = Color3.fromRGB(0, 233, 200)
refresh.TextColor3 = Color3.fromRGB(0,0,0)

local topBarStroke = Instance.new("UIStroke")
topBarStroke.Color = Color3.fromRGB(80, 80, 80)
topBarStroke.Thickness = 1
topBarStroke.Transparency = 0.7
topBarStroke.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = topBar

local isVisible = true
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local dragging = false
local dragStart = nil
local startPos = nil

local function updateDrag(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mousePos = input.Position
        local guiPos = mainFrame.AbsolutePosition
        local guiSize = mainFrame.AbsoluteSize
        if mousePos.X >= guiPos.X and mousePos.X <= guiPos.X + guiSize.X and
           mousePos.Y >= guiPos.Y and mousePos.Y <= guiPos.Y + 30 then
            dragging = true
            dragStart = mousePos
            startPos = mainFrame.Position
        end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        updateDrag(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -10, 1, -65)
scrollingFrame.Position = UDim2.new(0, 5, 0, 30)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 2
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)
scrollingFrame.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 10)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scrollingFrame

local function createSection(name)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Size = UDim2.new(1, 0, 0, 0)
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.Parent = scrollingFrame

    local sectionLayout = Instance.new("UIListLayout")
    sectionLayout.Padding = UDim.new(0, 2)
    sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sectionLayout.Parent = sectionFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 18)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14
    title.Font = Enum.Font.SourceSansBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = sectionFrame

    return sectionFrame
end

local gfruitsSection = createSection("Special Fruits")
local fruitsSection = createSection("All Fruits")
local plantsSection = createSection("Plants")

local s, e = pcall(function()
    getgenv().playerFarm = nil

    for _, farm in ipairs(workspace.Farm:GetChildren()) do
        if farm.Important.Data.Owner.Value == player.Name then
            playerFarm = farm
            break
        end
    end

    if not playerFarm then
        warn("No farm found for player")
        return
    end

    local plants = {}
    local fruits = {}
    local gfruits = {}
    local plantLabels = {}
    local fruitLabels = {}
    local gfruitLabels = {}
    local w_v = {"Gold", "Rainbow"}
    local w_m = {"Shocked", "Moonlit"}

    local function getItemColor(category, key)
        if category == "gfruits" then
            local variant, modifier = key:match("^(%S+)%s*(%S*)%s*.*$")
            modifier = modifier or ""
            if modifier == "Shocked" then return Color3.fromRGB(20, 250, 20)
            elseif modifier == "Moonlit" then return Color3.fromRGB(173, 216, 230)
            elseif variant == "Gold" then return Color3.fromRGB(255, 255, 0)
            elseif variant == "Rainbow" then return Color3.fromRGB(0, 255, 255)
            else return Color3.fromRGB(255, 255, 255) end
        else
            return Color3.fromRGB(255, 255, 255)
        end
    end

    local function updateLabel(category, key, count, section, labels)
        if count <= 0 then
            if labels[key] then
                labels[key]:Destroy()
                labels[key] = nil
            end
            return
        end

        if not labels[key] then
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -5, 0, 14)
            label.BackgroundTransparency = 1
            label.TextSize = 12
            label.Font = Enum.Font.SourceSans
            label.Text = key .. ": " .. count
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextColor3 = getItemColor(category, key)
            label.Parent = section
            labels[key] = label
        else
            labels[key].Text = key .. ": " .. count
        end

        section.Size = UDim2.new(1, 0, 0, section.UIListLayout.AbsoluteContentSize.Y)
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
    end

    local function scanFarm()
        local newPlants = {}
        local newFruits = {}
        local newGfruits = {}

        for _, plant in ipairs(playerFarm.Important["Plants_Physical"]:GetChildren()) do
            if plant:FindFirstChild("Fruits") then
                newPlants[plant.Name] = (newPlants[plant.Name] or 0) + 1
                for _, fruit in ipairs(plant.Fruits:GetChildren()) do
                    newFruits[fruit.Name] = (newFruits[fruit.Name] or 0) + 1
                    local variant = fruit.Variant.Value
                    local isSpecial = table.find(w_v, variant)
                    local modifier = ""
                    for _, attr in ipairs(w_m) do
                        if fruit:GetAttribute(attr) == true then
                            isSpecial = true
                            modifier = attr
                            break
                        end
                    end
                    if isSpecial then
						if modifier == "Moonlit" then
							if not fruit:FindFirstChildWhichIsA("Highlight", true) then
								local highlight = Instance.new("Highlight")
								highlight.Parent = fruit
							end
						end
                        local key = table.concat({variant, modifier, fruit.Name}, " "):gsub("%s+", " ")
                        newGfruits[key] = (newGfruits[key] or 0) + 1
                    end
                end
            end
        end

        for key, count in pairs(newPlants) do
            if plants[key] ~= count then
                updateLabel("plants", key, count, plantsSection, plantLabels)
            end
        end
        for key in pairs(plants) do
            if not newPlants[key] then
                updateLabel("plants", key, 0, plantsSection, plantLabels)
            end
        end
        plants = newPlants

        for key, count in pairs(newFruits) do
            if fruits[key] ~= count then
                updateLabel("fruits", key, count, fruitsSection, fruitLabels)
            end
        end
        for key in pairs(fruits) do
            if not newFruits[key] then
                updateLabel("fruits", key, 0, fruitsSection, fruitLabels)
            end
        end
        fruits = newFruits

        for key, count in pairs(newGfruits) do
            if gfruits[key] ~= count then
                updateLabel("gfruits", key, count, gfruitsSection, gfruitLabels)
            end
        end
        for key in pairs(gfruits) do
            if not newGfruits[key] then
                updateLabel("gfruits", key, 0, gfruitsSection, gfruitLabels)
            end
        end
        gfruits = newGfruits
    end

    scanFarm()

    for _, plant in ipairs(playerFarm.Important["Plants_Physical"]:GetChildren()) do
        if plant:FindFirstChild("Fruits") then
            plant.Fruits.ChildAdded:Connect(function()
                scanFarm()
            end)
            plant.Fruits.ChildRemoved:Connect(function()
                scanFarm()
            end)
        end
    end

    playerFarm.Important["Plants_Physical"].ChildAdded:Connect(function(plant)
    if plant:WaitForChild("Fruits", 5) then
        for _, fruit in ipairs(plant.Fruits:GetChildren()) do
            local variant = fruit.Variant.Value
            local isSpecial = table.find(w_v, variant)
            local modifier = ""
            for _, attr in ipairs(w_m) do
                if fruit:GetAttribute(attr) == true then
                    isSpecial = true
                    modifier = attr
                    break
                end
            end
            if isSpecial then
						if modifier == "Moonlit" then
							if not fruit:FindFirstChildWhichIsA("Highlight", true) then
								local highlight = Instance.new("Highlight")
								highlight.Parent = fruit
							end
						end
                local key = table.concat({variant, modifier, fruit.Name}, " "):gsub("%s+", " ")
                gfruits[key] = (gfruits[key] or 0) + 1
                updateLabel("gfruits", key, gfruits[key], gfruitsSection, gfruitLabels)
            end
            newFruits[fruit.Name] = (newFruits[fruit.Name] or 0) + 1
            updateLabel("fruits", fruit.Name, newFruits[fruit.Name], fruitsSection, fruitLabels)
        end

        plants[plant.Name] = (plants[plant.Name] or 0) + 1
        updateLabel("plants", plant.Name, plants[plant.Name], plantsSection, plantLabels)

        plant.Fruits.ChildAdded:Connect(function()
            scanFarm()
        end)
        plant.Fruits.ChildRemoved:Connect(function()
            scanFarm()
        end)

        scanFarm()
    end
end)

refresh.MouseButton1Click:Connect(function()
    scanFarm()
end)

task.spawn(function()
	while task.wait(10) do
		scanFarm()
	end
end)

end)

if not s then
    warn("Error: " .. tostring(e))
end
