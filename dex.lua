-- List PlayerGui contents (top-level ScreenGuis and all descendants).

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local outputFile = "playergui_list.txt"
local outputGuiName = "PlayerGuiListOutput"
local outputText = {}

local function emit(line)
    table.insert(outputText, line)
end

local function getPath(inst)
    local parts = {}
    local current = inst
    while current and current ~= playerGui do
        table.insert(parts, 1, current.Name)
        current = current.Parent
    end
    return "PlayerGui/" .. table.concat(parts, "/")
end

local function listTopLevel()
    emit("== PlayerGui Top-Level ==")
    for _, child in ipairs(playerGui:GetChildren()) do
        if child:IsA("ScreenGui") then
            emit(string.format("[ScreenGui] %s", child.Name))
        else
            emit(string.format("[%s] %s", child.ClassName, child.Name))
        end
    end
end

local function listAllDescendants()
    emit("== PlayerGui Descendants ==")
    local items = playerGui:GetDescendants()
    table.sort(items, function(a, b)
        return getPath(a) < getPath(b)
    end)
    for _, inst in ipairs(items) do
        emit(string.format("[%s] %s", inst.ClassName, getPath(inst)))
    end
end

local function outputToFile(text)
    if type(writefile) == "function" then
        writefile(outputFile, text)
        return true
    end
    return false
end

local function outputToGui(text)
    local existing = playerGui:FindFirstChild(outputGuiName)
    if existing then
        existing:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = outputGuiName
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.9, 0, 0.7, 0)
    frame.Position = UDim2.new(0.05, 0, 0.15, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -40, 0, 28)
    title.Position = UDim2.new(0, 10, 0, 6)
    title.BackgroundTransparency = 1
    title.Text = "PlayerGui List"
    title.TextColor3 = Color3.fromRGB(0, 255, 150)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 24, 0, 24)
    closeBtn.Position = UDim2.new(1, -30, 0, 6)
    closeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 12
    closeBtn.Parent = frame

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -20, 1, -48)
    box.Position = UDim2.new(0, 10, 0, 38)
    box.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    box.BorderSizePixel = 0
    box.ClearTextOnFocus = false
    box.MultiLine = true
    box.TextEditable = false
    box.TextXAlignment = Enum.TextXAlignment.Left
    box.TextYAlignment = Enum.TextYAlignment.Top
    box.TextWrapped = false
    box.Font = Enum.Font.Code
    box.TextSize = 12
    box.TextColor3 = Color3.new(1, 1, 1)
    box.Text = text
    box.Parent = frame

    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

listTopLevel()
listAllDescendants()

local output = table.concat(outputText, "\n")
if not outputToFile(output) then
    outputToGui(output)
end
