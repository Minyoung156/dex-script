-- PlayerGui 실시간 리스트 UI
-- 드래그 가능, X 버튼으로 닫기

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerGuiListUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 500)
main.Position = UDim2.new(0.5, -200, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Parent = screenGui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- 드래그 기능을 위한 타이틀 바
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
titleBar.BorderSizePixel = 0
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)

-- 타이틀
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "PlayerGui Items"
title.TextColor3 = Color3.fromRGB(0, 255, 150)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- X 버튼
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 2)
closeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- 호버 효과
closeBtn.MouseEnter:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 30)
end)
closeBtn.MouseLeave:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
end)

-- 리스트 프레임
local listFrame = Instance.new("ScrollingFrame")
listFrame.Size = UDim2.new(1, -20, 1, -50)
listFrame.Position = UDim2.new(0, 10, 0, 45)
listFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
listFrame.BorderSizePixel = 0
listFrame.ScrollBarThickness = 6
listFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 70)
listFrame.Parent = main
Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 8)

local listLayout = Instance.new("UIListLayout", listFrame)
listLayout.Padding = UDim.new(0, 6)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

local listPadding = Instance.new("UIPadding", listFrame)
listPadding.PaddingTop = UDim.new(0, 8)
listPadding.PaddingLeft = UDim.new(0, 8)
listPadding.PaddingRight = UDim.new(0, 8)
listPadding.PaddingBottom = UDim.new(0, 8)

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    listFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 16)
end)

-- 드래그 기능
local dragging = false
local dragStart = nil
local startPos = nil

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

titleBar.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- 아이템 표시 함수
local function createItemEntry(item)
    local entry = Instance.new("Frame")
    entry.Size = UDim2.new(1, 0, 0, 50)
    entry.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    entry.BorderSizePixel = 0
    entry.Parent = listFrame
    Instance.new("UICorner", entry).CornerRadius = UDim.new(0, 6)
    
    -- 아이템 이름
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -10, 0, 20)
    nameLabel.Position = UDim2.new(0, 5, 0, 5)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = item.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 12
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.Parent = entry
    
    -- 클래스명
    local classLabel = Instance.new("TextLabel")
    classLabel.Size = UDim2.new(1, -10, 0, 18)
    classLabel.Position = UDim2.new(0, 5, 0, 25)
    classLabel.BackgroundTransparency = 1
    classLabel.Text = "Class: " .. item.ClassName
    classLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    classLabel.Font = Enum.Font.Gotham
    classLabel.TextSize = 10
    classLabel.TextXAlignment = Enum.TextXAlignment.Left
    classLabel.TextTruncate = Enum.TextTruncate.AtEnd
    classLabel.Parent = entry
    
    -- 호버 효과
    entry.MouseEnter:Connect(function()
        entry.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    end)
    entry.MouseLeave:Connect(function()
        entry.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    end)
    
    return entry
end

-- 리스트 새로고침
local function refreshList()
    -- 기존 항목 제거
    for _, child in ipairs(listFrame:GetChildren()) do
        if child:IsA("Frame") and child ~= listLayout and child ~= listPadding then
            child:Destroy()
        end
    end
    
    -- PlayerGui의 모든 자식 가져오기
    local children = playerGui:GetChildren()
    table.sort(children, function(a, b)
        return a.Name < b.Name
    end)
    
    -- 항목 생성
    for _, item in ipairs(children) do
        createItemEntry(item)
    end
    
    -- 아이템 개수 표시
    title.Text = string.format("PlayerGui Items (%d)", #children)
end

-- 초기 리스트 생성
refreshList()

-- 실시간 업데이트
playerGui.ChildAdded:Connect(function()
    refreshList()
end)

playerGui.ChildRemoved:Connect(function()
    refreshList()
end)

-- X 버튼 클릭
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

print("PlayerGui 리스트 UI가 생성되었습니다!")
