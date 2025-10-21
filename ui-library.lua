-- Inovoproductions UI Library
-- Modern UI Framework inspired by Sirius.menu

local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- Theme Colors
Library.Theme = {
    Background = Color3.fromRGB(20, 20, 25),
    Secondary = Color3.fromRGB(30, 30, 35),
    Accent = Color3.fromRGB(138, 43, 226), -- Purple accent
    TextColor = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(150, 150, 150),
    Border = Color3.fromRGB(50, 50, 55),
    Success = Color3.fromRGB(46, 204, 113),
    Warning = Color3.fromRGB(241, 196, 15),
    Error = Color3.fromRGB(231, 76, 60)
}

function Library:CreateWindow(title)
    local Window = {}
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "InovoproductionsHub"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Library.Theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
    MainFrame.Size = UDim2.new(0, 700, 0, 500)
    MainFrame.ClipsDescendants = true
    
    -- Add rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Add shadow effect
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = MainFrame
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -15, 0, -15)
    Shadow.Size = UDim2.new(1, 30, 1, 30)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 10, 10)
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Library.Theme.Secondary
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 50)
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 12)
    TopBarCorner.Parent = TopBar
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title
    Title.TextColor3 = Library.Theme.TextColor
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Library.Theme.Error
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(1, -40, 0.5, -15)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Library.Theme.TextColor
    CloseButton.TextSize = 16
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = TopBar
    MinimizeButton.BackgroundColor3 = Library.Theme.Warning
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Position = UDim2.new(1, -75, 0.5, -15)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Library.Theme.TextColor
    MinimizeButton.TextSize = 16
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 8)
    MinimizeCorner.Parent = MinimizeButton
    
    local isMinimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        local targetSize = isMinimized and UDim2.new(0, 700, 0, 50) or UDim2.new(0, 700, 0, 500)
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = targetSize}):Play()
    end)
    
    -- Tabs Container
    local TabsContainer = Instance.new("Frame")
    TabsContainer.Name = "TabsContainer"
    TabsContainer.Parent = MainFrame
    TabsContainer.BackgroundColor3 = Library.Theme.Secondary
    TabsContainer.BorderSizePixel = 0
    TabsContainer.Position = UDim2.new(0, 0, 0, 50)
    TabsContainer.Size = UDim2.new(0, 150, 1, -50)
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = MainFrame
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 150, 0, 50)
    ContentContainer.Size = UDim2.new(1, -150, 1, -50)
    
    -- Make draggable
    local dragging, dragInput, dragStart, startPos
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    Window.Tabs = {}
    Window.CurrentTab = nil
    
    function Window:CreateTab(name, icon)
        local Tab = {}
        
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name
        TabButton.Parent = TabsContainer
        TabButton.BackgroundColor3 = Library.Theme.Background
        TabButton.BorderSizePixel = 0
        TabButton.Position = UDim2.new(0, 5, 0, 5 + (#Window.Tabs * 45))
        TabButton.Size = UDim2.new(1, -10, 0, 40)
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = (icon or "📁") .. "  " .. name
        TabButton.TextColor3 = Library.Theme.SubText
        TabButton.TextSize = 14
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        TabButton.TextXOffset = 10
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
        -- Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = name .. "Content"
        TabContent.Parent = ContentContainer
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.ScrollBarThickness = 4
        TabContent.ScrollBarImageColor3 = Library.Theme.Accent
        TabContent.Visible = false
        
        local TabLayout = Instance.new("UIListLayout")
        TabLayout.Parent = TabContent
        TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabLayout.Padding = UDim.new(0, 8)
        
        local TabPadding = Instance.new("UIPadding")
        TabPadding.Parent = TabContent
        TabPadding.PaddingTop = UDim.new(0, 10)
        TabPadding.PaddingLeft = UDim.new(0, 10)
        TabPadding.PaddingRight = UDim.new(0, 10)
        TabPadding.PaddingBottom = UDim.new(0, 10)
        
        TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y + 20)
        end)
        
        TabButton.MouseButton1Click:Connect(function()
            if Window.CurrentTab then
                Window.CurrentTab.Button.TextColor3 = Library.Theme.SubText
                Window.CurrentTab.Button.BackgroundColor3 = Library.Theme.Background
                Window.CurrentTab.Content.Visible = false
            end
            
            TabButton.TextColor3 = Library.Theme.TextColor
            TabButton.BackgroundColor3 = Library.Theme.Accent
            TabContent.Visible = true
            Window.CurrentTab = {Button = TabButton, Content = TabContent}
        end)
        
        -- Auto select first tab
        if #Window.Tabs == 0 then
            TabButton.TextColor3 = Library.Theme.TextColor
            TabButton.BackgroundColor3 = Library.Theme.Accent
            TabContent.Visible = true
            Window.CurrentTab = {Button = TabButton, Content = TabContent}
        end
        
        Tab.Content = TabContent
        
        function Tab:AddButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Name = text
            Button.Parent = TabContent
            Button.BackgroundColor3 = Library.Theme.Secondary
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, -20, 0, 40)
            Button.Font = Enum.Font.Gotham
            Button.Text = text
            Button.TextColor3 = Library.Theme.TextColor
            Button.TextSize = 14
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Library.Theme.Accent}):Play()
                wait(0.1)
                TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Library.Theme.Secondary}):Play()
                
                pcall(callback)
            end)
            
            return Button
        end
        
        function Tab:AddLabel(text)
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = TabContent
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, -20, 0, 30)
            Label.Font = Enum.Font.Gotham
            Label.Text = text
            Label.TextColor3 = Library.Theme.TextColor
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
            
            return Label
        end
        
        function Tab:AddToggle(text, default, callback)
            local toggled = default or false
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = text
            ToggleFrame.Parent = TabContent
            ToggleFrame.BackgroundColor3 = Library.Theme.Secondary
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Size = UDim2.new(1, -20, 0, 40)
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
            ToggleLabel.Size = UDim2.new(1, -60, 1, 0)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Library.Theme.TextColor
            ToggleLabel.TextSize = 14
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Parent = ToggleFrame
            ToggleButton.BackgroundColor3 = toggled and Library.Theme.Success or Library.Theme.Border
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(1, -45, 0.5, -10)
            ToggleButton.Size = UDim2.new(0, 40, 0, 20)
            ToggleButton.Text = ""
            
            local ToggleButtonCorner = Instance.new("UICorner")
            ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
            ToggleButtonCorner.Parent = ToggleButton
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Parent = ToggleButton
            ToggleCircle.BackgroundColor3 = Library.Theme.TextColor
            ToggleCircle.BorderSizePixel = 0
            ToggleCircle.Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            ToggleCircle.Size = UDim2.new(0, 16, 0, 16)
            
            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = ToggleCircle
            
            ToggleButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                
                TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = toggled and Library.Theme.Success or Library.Theme.Border
                }):Play()
                
                TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {
                    Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
                }):Play()
                
                pcall(callback, toggled)
            end)
            
            return ToggleFrame
        end
        
        table.insert(Window.Tabs, Tab)
        return Tab
    end
    
    return Window
end

return Library

