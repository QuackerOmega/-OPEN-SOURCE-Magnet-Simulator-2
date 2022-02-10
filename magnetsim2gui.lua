game.StarterGui:SetCore("SendNotification", {Title = "Script By QuackerOmega", Text = "https://github.com/QuackerOmega", Icon = "", Duration = 3})


-- ui
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/29436/luascripts/main/Venyx-UI-Library.lua"))()
local ui = UI.new("Magnet Sim 2 | made by QuackerOmega")

-- first page
local tab = ui:Tab("Main")
local section = tab:Section("Stuff")
local section2 = tab:Section("Upgrades and Shops")
local areas = tab:Section("Areas")

-- misc1
local misc = ui:Tab("Misc")
local misc1 = misc:Section("Misc")

--creds
local credpage = ui:Tab("Credits")
local creds = credpage:Section("Credits")

-- script
section:Toggle("Auto Collect", false, function(value)
    spawn(function()
    getgenv().a2col = value
    while true do
    if not getgenv().a2col then break end
        for i,v in pairs(game:GetService("Workspace").Coins:GetDescendants()) do
            if v.ClassName == "Model" then
                v.Base.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,4,0)
            end
        end
    wait(.1)
    end
    end)
end)

section:Toggle("Auto Collect (coins from pets)", false, function(value)
    spawn(function()
    getgenv().collect = value
    while true do
    if not getgenv().collect then break end
        for i,v in pairs(game:GetService("Workspace")["_PlayerCoins"]:GetDescendants()) do
            if v.ClassName == "Model" then
                if v.Parent.Name == game.Players.LocalPlayer.Name then
                    v.Base.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,4,0)
                end
            end
        end
    wait(.2)
    end
    end)
end)

section:Toggle("Auto Farm", false, function(value)
    spawn(function()
    getgenv().autofarm = value
    while true do
    if not getgenv().autofarm then break end
        game:GetService('Players').LocalPlayer.CameraMaxZoomDistance = math.huge

        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer


        function GetClosest()
            local Character = LocalPlayer.Character
            local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
            if not (Character or HumanoidRootPart) then return end

            local TargetDistance = math.huge
            local Target

            for i,v in pairs(game:GetService("Workspace").CollectibleCoins:GetDescendants()) do
                if v.ClassName == "Model" then
                    local Targetpos = v.Base.CFrame
                    local mag = (HumanoidRootPart.Position - Targetpos.Position).magnitude
                    if mag <= TargetDistance then
                        TargetDistance = mag
                        Target = v
                    end
                end
            end
            return Target
        end

        local A_1 = GetClosest()
        local A_2 = "All"
        local A_3 = "AddPetToStack"
        local Event = game:GetService("ReplicatedStorage").Events.PetEvents.Collect
        Event:InvokeServer(A_1, A_2, A_3)
    wait(.2)
    end
    end)
end)

section:Toggle("Auto Sell", false, function(value)
    spawn(function()
    getgenv().sell = value
    while true do
    if not getgenv().sell then break end
        for i,v in pairs(game:GetService("Workspace").Rings:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                if v.Parent.Parent.Name == "Sellx18" then
                    local head = game.Players.LocalPlayer.Character.Head
                    firetouchinterest(head, v.Parent, 0)
                    wait()
                    firetouchinterest(head, v.Parent, 1)
                end
            end
        end
    wait(.3)
    end
    end)
end)

section:Button("Equip Best Pets", function()
    spawn(function()  
        local Event = game:GetService("ReplicatedStorage").Events.PetEvents.EquipBest
        Event:FireServer()
    end)
end)

section2:Button("Open Magnet Shop", function()
    spawn(function()  
        for i,v in pairs(game:GetService("Workspace")["_UpgradeRings"]:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                if v.Parent.Parent.Name == "Magnet" then
                    local head = game.Players.LocalPlayer.Character.Head
                    firetouchinterest(head, v.Parent, 0)
                    wait()
                    firetouchinterest(head, v.Parent, 1)
                end
            end
        end
    end)
end)

section2:Toggle("Auto Upgrade Speed ", false, function(value)
    spawn(function()  
    getgenv().sped = value
    while true do
    if not getgenv().sped then break end
        local Event = game:GetService("ReplicatedStorage").Events.GameEvents.UpgradeSpeed
        Event:FireServer()
    wait()
    end
    end)
end)

section2:Toggle("Auto Upgrade Storage ", false, function(value)
    spawn(function()  
    getgenv().strg = value
    while true do
    if not getgenv().strg then break end
        local Event = game:GetService("ReplicatedStorage").Events.GameEvents.UpgradeStorage
        Event:FireServer()
    wait()
    end
    end)
end)

areas:Button("Open Gate 1 Menu", function()
    for i,v in pairs(game:GetService("Workspace")["_Gates"].Gate1.GateTouch:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            local head = game.Players.LocalPlayer.Character.Head
            firetouchinterest(head, v.Parent, 0)
            wait()
            firetouchinterest(head, v.Parent, 1)
        end
    end
end)

areas:Button("Open Gate 2 Menu", function()
    for i,v in pairs(game:GetService("Workspace")["_Gates"].Gate2.GateTouch:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            local head = game.Players.LocalPlayer.Character.Head
            firetouchinterest(head, v.Parent, 0)
            wait()
            firetouchinterest(head, v.Parent, 1)
        end
    end
end)

areas:Button("Open Gate 3 Menu", function()
    for i,v in pairs(game:GetService("Workspace")["_Gates"].Gate3.GateTouch:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            local head = game.Players.LocalPlayer.Character.Head
            firetouchinterest(head, v.Parent, 0)
            wait()
            firetouchinterest(head, v.Parent, 1)
        end
    end
end)

areas:Button("Open Gate 4 Menu", function()
    for i,v in pairs(game:GetService("Workspace")["_Gates"].Gate4.GateTouch:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            local head = game.Players.LocalPlayer.Character.Head
            firetouchinterest(head, v.Parent, 0)
            wait()
            firetouchinterest(head, v.Parent, 1)
        end
    end
end)

areas:Button("Open Gate 5 Menu", function()
    for i,v in pairs(game:GetService("Workspace")["_Gates"].Gate5.GateTouch:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            local head = game.Players.LocalPlayer.Character.Head
            firetouchinterest(head, v.Parent, 0)
            wait()
            firetouchinterest(head, v.Parent, 1)
        end
    end
end)

areas:Button("Open Gate 6 Menu", function()
    for i,v in pairs(game:GetService("Workspace")["_Gates"].Gate6.GateTouch:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            local head = game.Players.LocalPlayer.Character.Head
            firetouchinterest(head, v.Parent, 0)
            wait()
            firetouchinterest(head, v.Parent, 1)
        end
    end
end)

areas:Button("Open Gate 7 Menu", function()
    for i,v in pairs(game:GetService("Workspace")["_Gates"].Gate7.GateTouch:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            local head = game.Players.LocalPlayer.Character.Head
            firetouchinterest(head, v.Parent, 0)
            wait()
            firetouchinterest(head, v.Parent, 1)
        end
    end
end)

misc1:Slider("WalkSpeed", 16, 500, 0, function(value)
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

misc1:Slider("Jump", 0, 500, 60, function(value)
	spawn(function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
    end)
end)

misc1:Button("[RTHRO] Titan (kinda works?)", function()
    spawn(function()
        --Shit ass script made by failedmite57926

        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Character = LocalPlayer.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        local function rm()
            for i,v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.Name == "Handle" or v.Name == "Head" then
                        if Character.Head:FindFirstChild("OriginalSize") then
                            Character.Head.OriginalSize:Destroy()
                        end
                    else
                        for i,cav in pairs(v:GetDescendants()) do
                            if cav:IsA("Attachment") then
                                if cav:FindFirstChild("OriginalPosition") then
                                    cav.OriginalPosition:Destroy()  
                                end
                            end
                        end
                        if v:FindFirstChild("AvatarPartScaleType") then
                            v:FindFirstChild("AvatarPartScaleType"):Destroy()
                        end
                    end
                end
            end
        end

        rm()
        wait(0.5)
        Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
        wait(1)

        rm()
        wait(0.5)
        Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
        wait(1)

        rm()
        wait(0.5)
        Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
        wait(1)

        rm()
        wait(0.5)
        Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
        wait(1)

        rm()
        wait(0.5)
        Humanoid:FindFirstChild("HeadScale"):Destroy()
        wait(1)
    end)
end)

creds:Button("This Open Sourced Script Was Made By QuackerOmega", function()
    setclipboard("https://github.com/QuackerOmega")
    print("https://github.com/QuackerOmega")
end)

creds:Button("Venyx Mod By .az#8040", function()
    setclipboard("https://github.com/QuackerOmega")
    print("https://github.com/29436")
end)

creds:Button("Titan Script Originally By failedmite57926", function()
    print()
end)
