local Luminosity = loadstring(game:HttpGet("https://raw.githubusercontent.com/iHavoc101/Genesis-Studios/main/UserInterface/Luminosity.lua", true))()
local Window = Luminosity.new("StealTime UI", "v1.18", 4370345701)
local Tab1 = Window.Tab("Tab 1", 6026568198)
local Folder = Tab1.Folder("Steal Time", "[-] Made by kiatupk8 [-]")

Folder.Toggle("Fast Walkspeed", function(Status)
    if Status == true then
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
        Humanoid.WalkSpeed = 45
    else
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
        Humanoid.WalkSpeed = 16
    end
end)

local isAutoJumping = false
local jumpInterval = 0.5

Folder.Toggle("Auto Jump", function(Status)
    if Status == true then
        isAutoJumping = true
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
        Humanoid.WalkSpeed = 45
    else
        isAutoJumping = false
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
        Humanoid.WalkSpeed = 16
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if isAutoJumping then
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(jumpInterval)
    end
end)


Folder.Toggle("Reach", function(Status)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then
        character = player.CharacterAdded:Wait()
    end
    local tool = character:FindFirstChildOfClass("Tool")
    if not tool then
        return
    end
    if Status == true then
        local newPart = tool.Handle:FindFirstChild("ExtendedHitbox")
        if not newPart then
            newPart = Instance.new("Part")
            newPart.Name = "ExtendedHitbox"
            newPart.Size = Vector3.new(10000, 10000, 10000)
            newPart.Anchored = false
            newPart.CanCollide = true
            newPart.Parent = tool.Handle
        end
    else
        local newPart = tool.Handle:FindFirstChild("ExtendedHitbox")
        if newPart then
            newPart:Destroy()
        end
    end
end)

local spinnerConnection = nil
local bambam = nil

Folder.Toggle("Spinner", function(Status)
    if Status == true then
        power = 800
        spinnerConnection = game:GetService('RunService').Stepped:Connect(function()
            game.Players.LocalPlayer.Character.Head.CanCollide = false
            game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
            game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        end) 
        bambam = Instance.new("BodyThrust")
        bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        bambam.Force = Vector3.new(power, 0, power)
        bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    else
        if spinnerConnection then
            spinnerConnection:Disconnect()
        end
        if bambam then
            bambam:Destroy()
        end
    end
end)


Folder.Toggle("Increase FOV", function(Status)
    if Status == true then
        game.Workspace.CurrentCamera.FieldOfView = 500
    else
        game.Workspace.CurrentCamera.FieldOfView = 70
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(Input)
if Input.KeyCode == Enum.KeyCode.F then
Window:Toggle()
end
end)
