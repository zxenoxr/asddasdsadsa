local Luminosity = loadstring(game:HttpGet("https://raw.githubusercontent.com/iHavoc101/Genesis-Studios/main/UserInterface/Luminosity.lua", true))()
local Window = Luminosity.new("StealTime UI", "v1.18", 4370345701)
local Tab1 = Window.Tab("Main", 6026568198)
local Folder = Tab1.Folder("Steal Time", "[-] Made by kiatupk8 [-]")
local Tab2 = Window.Tab("Misc", 6026568198)
local loopws = false
local reaching = false
local spinning = false
local Folder1 = Tab2.Folder("Infinite Yield, ESP, Etc", "[-] Made by blacknikeynigger46 [-]")
local function niggers()
    print('Giving Nigger Forcefield')
    game.Players.LocalPlayer.Character.Humanoid.Health = 1000
    ff = Instance.new("ForceField", game.Players.LocalPlayer.Character)
    ff.Visible = true
    print('Gave Nigger Forcefield')
    print('Giving Nigger MaxHealth')
    warn('Failed To Give Nigger MaxHealth')
end
niggers()
Folder.Toggle("Fast Walkspeed", function(Status)
    if Status == true then
        loopws = true
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
        Humanoid.WalkSpeed = 45
    else
        loopws = false
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
        Humanoid.WalkSpeed = 16
    end
end)

Folder1.Toggle("Infinite Yield", function(Status)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
Folder1.Toggle("ESP (XRAY)", function(Status)
    local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(4, 7, 4)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = true
Box.Visible = true

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 20
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local Update
	local UpdateNameTag = function()
		if not pcall(function()
			v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
			t.Tag.Text = v.Name .. "\n" .. ((maxh ~= 0 and tostring(math.floor((h / maxh) * 100))) or "0") .. "%  " .. tostring(h) .. "/" .. tostring(maxh)
		end) then
			Update:Disconnect()
		end
	end
	UpdateNameTag()
	Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	v.Changed:Connect(function(prop)
		if prop == "TeamColor" then
			UnloadCharacter(v)
			wait()
			LoadCharacter(v)
		end
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
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
    if Status == true then
            reaching = true
    local active = true
    local trueActive = true
    local reachType = "Sphere"
    local dmgEnabled = true
    local visualizerEnabled = false

    local visualizer = Instance.new("Part")
    visualizer.BrickColor = BrickColor.Blue()
    visualizer.Transparency = 0.6
    visualizer.Anchored = true
    visualizer.CanCollide = false
    visualizer.Size = Vector3.new(0.5,0.5,0.5)
    visualizer.BottomSurface = Enum.SurfaceType.Smooth
    visualizer.TopSurface = Enum.SurfaceType.Smooth

    repeat wait() until game.Players.LocalPlayer
    ScreenGui.Parent = game:GetService("CoreGui")
    game:GetService("UserInputService").InputBegan:connect(function(inp,gpe)
	if gpe then return end
	if inp.KeyCode == Enum.KeyCode.R then
		ScreenGui.Enabled = not ScreenGui.Enabled
	end
end)
 
local plr = game.Players.LocalPlayer
 
local function onHit(hit,handle)
    local victim = hit.Parent:FindFirstChildOfClass("Humanoid")
	    if victim and victim.Parent.Name ~= game.Players.LocalPlayer.Name then
		if dmgEnabled then
	        for _,v in pairs(hit.Parent:GetChildren()) do
	            if v:IsA("Part") then
	                firetouchinterest(v,handle,0)
	                firetouchinterest(v,handle,1)
	            end
			end
		else
			firetouchinterest(hit,handle,0)
			firetouchinterest(hit,handle,1)
		end
    end
end
 
local function getWhiteList()
    local wl = {}
    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= plr then
            local char = v.Character
            if char then
                for _,q in pairs(char:GetChildren()) do
                    if q:IsA("Part") then
                        table.insert(wl,q)
                    end
                end
            end
        end
    end
    return wl
end
 
game:GetService("RunService").RenderStepped:connect(function()
    if not active or not trueActive then return end
	local s = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
	if not s then visualizer.Parent = nil end
    if s then
        local handle = s:FindFirstChild("Handle") or s:FindFirstChildOfClass("Part")
		if handle then
			if visualizerEnabled then
				visualizer.Parent = workspace
			else
				visualizer.Parent = nil
			end
			local reach = tonumber(TextBox.Text)
			if reach then
				if reachType == "Sphere" then
					visualizer.Shape = Enum.PartType.Ball
					visualizer.Material = Enum.Material.ForceField
					visualizer.Transparency = 0
					visualizer.Size = Vector3.new(reach,reach,reach)
					visualizer.CFrame = handle.CFrame
		            for _,v in pairs(game.Players:GetPlayers()) do
		                local hrp = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
		                if hrp and handle then
		                    local mag = (hrp.Position-handle.Position).magnitude
		                    if mag <= reach then
		                        onHit(hrp,handle)
		                    end
		                end
					end
				elseif reachType == "Line" then
					local origin = (handle.CFrame*CFrame.new(0,0,-2)).p
		    		local ray = Ray.new(origin,handle.CFrame.lookVector*-reach)
					local p,pos = workspace:FindPartOnRayWithWhitelist(ray,getWhiteList())
					visualizer.Shape = Enum.PartType.Block
					visualizer.Size = Vector3.new(1,0.8,reach)
					visualizer.CFrame = handle.CFrame*CFrame.new(0,0,(reach/2)+2)
		    		if p then
		    		    onHit(p,handle)
		    		else
		    		    for _,v in pairs(handle:GetTouchingParts()) do
		    		        onHit(v,handle)
		    		    end
		    		end
				end
			end
        end
    end
end)
        else
            reaching = false
            active = false
        end
end)

local spinnerConnection = nil
local bambam = nil

Folder.Toggle("Spinner", function(Status)
    if Status == true then
        spinning = true
        power = 1400
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
            spinning = false
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
if Input.KeyCode == Enum.KeyCode.Q then
Window:Toggle()
end
end)
while task.wait(5) do
    print('Checking Settings')
    if loopws == true then
        print('set walkspeed again')
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
        Humanoid.WalkSpeed = 45
    end
    if reaching == true then
        print('set reach again')
        Folder.Toggle("Reach")
    end
    if spinning == true then
        print('set spin again')
        Folder.Toggle("Spinner")
    end
end
