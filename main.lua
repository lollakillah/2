-- Inovoproductions Game Hub
-- Main Hub Script

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/inovoproductions/main/ui-library.lua"))()

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Game Detection
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local GameId = game.PlaceId

-- Create Window
local Window = Library:CreateWindow("🎮 Inovoproductions Hub | " .. GameName)

-- Notification System
local function Notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration or 5;
    })
end

Notify("Inovoproductions Hub", "Welkom! Hub succesvol geladen.", 5)

-- ==================== HOME TAB ====================
local HomeTab = Window:CreateTab("Home", "🏠")

HomeTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
HomeTab:AddLabel("🎮 Welkom bij Inovoproductions Hub!")
HomeTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
HomeTab:AddLabel("")
HomeTab:AddLabel("📊 Game Informatie:")
HomeTab:AddLabel("   Game: " .. GameName)
HomeTab:AddLabel("   Place ID: " .. tostring(GameId))
HomeTab:AddLabel("   Speler: " .. LocalPlayer.Name)
HomeTab:AddLabel("")
HomeTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
HomeTab:AddLabel("ℹ️ Gebruik de tabs aan de linkerkant")
HomeTab:AddLabel("   om scripts te selecteren!")
HomeTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- ==================== UNIVERSAL SCRIPTS TAB ====================
local UniversalTab = Window:CreateTab("Universal", "🌍")

UniversalTab:AddLabel("⚡ Algemene Scripts (Werken in alle games)")

UniversalTab:AddButton("💨 Speed Boost (WalkSpeed)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
        Notify("Speed Boost", "WalkSpeed ingesteld op 100!", 3)
    end
end)

UniversalTab:AddButton("🦘 Jump Power Boost", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = 150
        Notify("Jump Boost", "JumpPower ingesteld op 150!", 3)
    end
end)

UniversalTab:AddButton("👻 Noclip Toggle", function()
    local noclip = false
    local player = LocalPlayer
    local char = player.Character
    
    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
    
    noclip = not noclip
    Notify("Noclip", "Noclip " .. (noclip and "geactiveerd" or "gedeactiveerd") .. "!", 3)
end)

UniversalTab:AddButton("🌟 Infinite Jump", function()
    local InfiniteJumpEnabled = true
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
    Notify("Infinite Jump", "Infinite Jump geactiveerd!", 3)
end)

UniversalTab:AddButton("🎭 Reset Character", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
        Notify("Reset", "Character gereset!", 3)
    end
end)

UniversalTab:AddButton("📍 ESP Players (Zie spelers)", function()
    local function CreateESP(player)
        if player.Character and player ~= LocalPlayer then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.5
        end
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        CreateESP(player)
    end
    
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            wait(1)
            CreateESP(player)
        end)
    end)
    
    Notify("ESP", "Player ESP geactiveerd!", 3)
end)

UniversalTab:AddButton("🔆 FullBright (Zie in donker)", function()
    local Lighting = game:GetService("Lighting")
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    Notify("FullBright", "FullBright geactiveerd!", 3)
end)

UniversalTab:AddButton("🎯 Remove Fog", function()
    local Lighting = game:GetService("Lighting")
    Lighting.FogEnd = 100000
    for i, v in pairs(Lighting:GetDescendants()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
    Notify("Remove Fog", "Fog verwijderd!", 3)
end)

-- ==================== MOVEMENT TAB ====================
local MovementTab = Window:CreateTab("Movement", "🏃")

MovementTab:AddLabel("🚀 Bewegings Scripts")

local flyEnabled = false
MovementTab:AddButton("🚁 Fly Toggle", function()
    flyEnabled = not flyEnabled
    
    local function Fly()
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0
        
        local mouse = LocalPlayer:GetMouse()
        
        local function FlyFunc()
            local bg = Instance.new("BodyGyro", LocalPlayer.Character.HumanoidRootPart)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = LocalPlayer.Character.HumanoidRootPart.CFrame
            
            local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            
            repeat wait()
                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0.1,0)
                end
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            until not flyEnabled
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
        end
        
        mouse.KeyDown:Connect(function(key)
            if key:lower() == "w" then
                ctrl.f = 1
            elseif key:lower() == "s" then
                ctrl.b = -1
            elseif key:lower() == "a" then
                ctrl.l = -1
            elseif key:lower() == "d" then
                ctrl.r = 1
            end
        end)
        
        mouse.KeyUp:Connect(function(key)
            if key:lower() == "w" then
                ctrl.f = 0
            elseif key:lower() == "s" then
                ctrl.b = 0
            elseif key:lower() == "a" then
                ctrl.l = 0
            elseif key:lower() == "d" then
                ctrl.r = 0
            end
        end)
        
        FlyFunc()
    end
    
    if flyEnabled then
        Fly()
        Notify("Fly", "Fly geactiveerd! Gebruik WASD om te vliegen.", 5)
    else
        Notify("Fly", "Fly gedeactiveerd!", 3)
    end
end)

MovementTab:AddButton("🎯 Teleport to Mouse", function()
    LocalPlayer:GetMouse().Button1Down:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer:GetMouse().Hit + Vector3.new(0, 7, 0)
        end
    end)
    Notify("Teleport", "Klik met je muis om te teleporteren!", 3)
end)

-- ==================== GAME SPECIFIC TAB ====================
local GameSpecificTab = Window:CreateTab("Game Scripts", "🎮")

GameSpecificTab:AddLabel("🎲 Game-Specifieke Scripts")

-- Detect specific games and load scripts
if GameId == 2753915549 or GameId == 4442272183 then
    -- Blox Fruits
    GameSpecificTab:AddLabel("")
    GameSpecificTab:AddLabel("🌊 Blox Fruits Gedetecteerd!")
    GameSpecificTab:AddButton("⚔️ Auto Farm", function()
        Notify("Blox Fruits", "Auto Farm script zou hier komen", 3)
    end)
    GameSpecificTab:AddButton("💪 Level Farm", function()
        Notify("Blox Fruits", "Level Farm script zou hier komen", 3)
    end)
    
elseif GameId == 6516141723 then
    -- Doors
    GameSpecificTab:AddLabel("")
    GameSpecificTab:AddLabel("🚪 Doors Gedetecteerd!")
    GameSpecificTab:AddButton("🔦 Entity ESP", function()
        Notify("Doors", "Entity ESP script zou hier komen", 3)
    end)
    GameSpecificTab:AddButton("🗝️ Key ESP", function()
        Notify("Doors", "Key ESP script zou hier komen", 3)
    end)
    
elseif GameId == 286090429 then
    -- Arsenal
    GameSpecificTab:AddLabel("")
    GameSpecificTab:AddLabel("🔫 Arsenal Gedetecteerd!")
    GameSpecificTab:AddButton("🎯 Aimbot", function()
        Notify("Arsenal", "Aimbot script zou hier komen", 3)
    end)
    GameSpecificTab:AddButton("📦 ESP", function()
        Notify("Arsenal", "ESP script zou hier komen", 3)
    end)
    
elseif GameId == 155615604 then
    -- Prison Life
    GameSpecificTab:AddLabel("")
    GameSpecificTab:AddLabel("🔒 Prison Life Gedetecteerd!")
    GameSpecificTab:AddButton("🗝️ Auto Escape", function()
        Notify("Prison Life", "Auto Escape script zou hier komen", 3)
    end)
    GameSpecificTab:AddButton("🔫 Get All Guns", function()
        Notify("Prison Life", "Get Guns script zou hier komen", 3)
    end)
    
elseif GameId == 920587237 then
    -- Adopt Me
    GameSpecificTab:AddLabel("")
    GameSpecificTab:AddLabel("🐾 Adopt Me Gedetecteerd!")
    GameSpecificTab:AddButton("💰 Auto Collect Money", function()
        Notify("Adopt Me", "Auto Collect script zou hier komen", 3)
    end)
    GameSpecificTab:AddButton("🏠 Auto Age", function()
        Notify("Adopt Me", "Auto Age script zou hier komen", 3)
    end)
    
else
    -- Unknown Game
    GameSpecificTab:AddLabel("")
    GameSpecificTab:AddLabel("❓ Geen specifieke scripts voor deze game.")
    GameSpecificTab:AddLabel("   Gebruik de Universal scripts!")
    GameSpecificTab:AddLabel("")
    GameSpecificTab:AddButton("📋 Copy Game ID", function()
        setclipboard(tostring(GameId))
        Notify("Game ID", "Game ID gekopieerd: " .. GameId, 3)
    end)
end

-- ==================== PLAYER TAB ====================
local PlayerTab = Window:CreateTab("Player", "👤")

PlayerTab:AddLabel("👤 Speler Aanpassingen")

PlayerTab:AddButton("🎨 Rainbow Character", function()
    local function RainbowCharacter()
        while wait(0.1) do
            if LocalPlayer.Character then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
            end
        end
    end
    spawn(RainbowCharacter)
    Notify("Rainbow", "Rainbow Character geactiveerd!", 3)
end)

PlayerTab:AddButton("👁️ God Mode (Mogelijk)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Name = "1"
        local l = LocalPlayer.Character["1"]:Clone()
        l.Parent = LocalPlayer.Character
        l.Name = "Humanoid"
        wait(0.1)
        LocalPlayer.Character["1"]:Destroy()
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
        LocalPlayer.Character.Animate.Disabled = true
        wait(0.1)
        LocalPlayer.Character.Animate.Disabled = false
        Notify("God Mode", "God Mode mogelijk geactiveerd!", 3)
    end
end)

PlayerTab:AddButton("🎒 Remove Accessories", function()
    for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
        if v:IsA("Accessory") then
            v:Destroy()
        end
    end
    Notify("Accessories", "Accessories verwijderd!", 3)
end)

-- ==================== CREDITS TAB ====================
local CreditsTab = Window:CreateTab("Credits", "ℹ️")

CreditsTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
CreditsTab:AddLabel("🎮 Inovoproductions Game Hub")
CreditsTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
CreditsTab:AddLabel("")
CreditsTab:AddLabel("👨‍💻 Ontwikkelaar: Inovoproductions")
CreditsTab:AddLabel("📅 Versie: 1.0.0")
CreditsTab:AddLabel("🌟 Status: Beta")
CreditsTab:AddLabel("")
CreditsTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
CreditsTab:AddLabel("🙏 Bedankt voor het gebruiken!")
CreditsTab:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
CreditsTab:AddLabel("")

CreditsTab:AddButton("📋 Discord (Voorbeeld)", function()
    setclipboard("discord.gg/inovoproductions")
    Notify("Discord", "Discord link gekopieerd!", 3)
end)

CreditsTab:AddButton("💙 Join Discord Server", function()
    Notify("Discord", "Open Discord en plak de link!", 3)
end)

print("🎮 Inovoproductions Hub fully loaded!")

