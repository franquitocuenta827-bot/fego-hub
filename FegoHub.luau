local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

if LocalPlayer.PlayerGui:FindFirstChild("FEGO") then
	LocalPlayer.PlayerGui["FEGO"]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FEGO"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9999
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 215)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -107)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 60, 200)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.2
MainStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 14)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 14)
TitleFix.Position = UDim2.new(0, 0, 1, -14)
TitleFix.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "FEGO HUB"
TitleLabel.TextColor3 = Color3.fromRGB(170, 110, 255)
TitleLabel.TextSize = 17
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = TitleBar

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0.85, 0, 0, 1)
Divider.Position = UDim2.new(0.075, 0, 0, 48)
Divider.BackgroundColor3 = Color3.fromRGB(60, 30, 100)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

local function CreateButton(name, text, yPos)
	local Button = Instance.new("TextButton")
	Button.Name = name
	Button.Size = UDim2.new(0.86, 0, 0, 36)
	Button.Position = UDim2.new(0.07, 0, 0, yPos)
	Button.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
	Button.Text = text
	Button.TextColor3 = Color3.fromRGB(200, 200, 210)
	Button.Font = Enum.Font.GothamSemibold
	Button.TextSize = 13
	Button.AutoButtonColor = false
	Button.Parent = MainFrame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = Button

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(50, 30, 80)
	stroke.Thickness = 1
	stroke.Parent = Button

	return Button
end

local FreezeBtn = CreateButton("FreezeBtn", "[Y] FREEZE  OFF", 56)
local DisappearBtn = CreateButton("DisappearBtn", "[G] DISAPPEAR  OFF", 100)
local DragonBtn = CreateButton("DragonBtn", "[J] DISAPPEAR DRAGON  OFF", 144)

local function UpdateButtonStyle(btn, active)
	btn.Text = active and string.gsub(btn.Text, "OFF", "ON") or string.gsub(btn.Text, "ON", "OFF")
	btn.BackgroundColor3 = active and Color3.fromRGB(30, 110, 50) or Color3.fromRGB(28, 28, 38)
	btn.TextColor3 = active and Color3.fromRGB(180, 255, 180) or Color3.fromRGB(200, 200, 210)
end

local freezeActive = false
local disappearActive = false
local dragonActive = false

local function hasDragonName(obj)
	local checkNames = {"dragon canelloni", "dragon", "canelloni"}
	local name = string.lower(obj.Name)
	for _, v in pairs(checkNames) do
		if string.find(name, v) then
			return true
		end
	end
	if obj:IsA("BasePart") or obj:IsA("MeshPart") then
		for _, child in pairs(obj:GetChildren()) do
			if child:IsA("BillboardGui") or child:IsA("SurfaceGui") then
				for _, label in pairs(child:GetDescendants()) do
					if label:IsA("TextLabel") then
						local text = string.lower(label.Text)
						if string.find(text, "dragon") or string.find(text, "canelloni") then
							return true
						end
					end
				end
			end
		end
	end
	return false
end

local function setAllTransparency(obj, value)
	if obj:IsA("BasePart") or obj:IsA("MeshPart") then
		obj.LocalTransparencyModifier = value
		obj.Transparency = value
		obj.CastShadow = value < 1
	elseif obj:IsA("Decal") or obj:IsA("Texture") then
		obj.Transparency = value
	elseif obj:IsA("SpecialMesh") or obj:IsA("BlockMesh") or obj:IsA("CylinderMesh") then
		-- meshes dont have transparency directly
	elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
		obj.Enabled = value < 1
	elseif obj:IsA("Sound") then
		obj.Volume = value < 1 and 1 or 0
	end
end

local function applyToViewport(v)
	for _, obj in pairs(v:GetDescendants()) do
		if dragonActive and hasDragonName(obj) then
			setAllTransparency(obj, 1)
			if obj:IsA("Model") then
				for _, part in pairs(obj:GetDescendants()) do
					setAllTransparency(part, 1)
				end
			end
		elseif disappearActive then
			setAllTransparency(obj, 1)
		end
		if freezeActive then
			if obj:IsA("Animator") then
				for _, track in pairs(obj:GetPlayingAnimationTracks()) do
					track:AdjustSpeed(0)
				end
			elseif obj:IsA("Humanoid") then
				obj.WalkSpeed = 0
				obj.JumpPower = 0
			elseif obj:IsA("BasePart") or obj:IsA("MeshPart") then
				obj.Anchored = true
			end
		end
	end
end

local function applyAction(mode, state)
	for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
		if v:IsA("ViewportFrame") then
			if mode == "dragon" then
				for _, obj in pairs(v:GetDescendants()) do
					if hasDragonName(obj) then
						setAllTransparency(obj, state and 1 or 0)
						if obj:IsA("Model") then
							for _, part in pairs(obj:GetDescendants()) do
								setAllTransparency(part, state and 1 or 0)
							end
						end
					end
				end
			elseif mode == "disappear" then
				for _, obj in pairs(v:GetDescendants()) do
					setAllTransparency(obj, state and 1 or 0)
				end
			elseif mode == "freeze" then
				for _, obj in pairs(v:GetDescendants()) do
					if obj:IsA("Animator") then
						for _, track in pairs(obj:GetPlayingAnimationTracks()) do
							track:AdjustSpeed(state and 0 or 1)
						end
					elseif obj:IsA("Humanoid") then
						obj.WalkSpeed = state and 0 or 16
						obj.JumpPower = state and 0 or 50
					elseif obj:IsA("BasePart") or obj:IsA("MeshPart") then
						obj.Anchored = state
					end
				end
			end
		end
	end
end

FreezeBtn.MouseButton1Click:Connect(function()
	freezeActive = not freezeActive
	UpdateButtonStyle(FreezeBtn, freezeActive)
	applyAction("freeze", freezeActive)
end)

DisappearBtn.MouseButton1Click:Connect(function()
	disappearActive = not disappearActive
	UpdateButtonStyle(DisappearBtn, disappearActive)
	applyAction("disappear", disappearActive)
end)

DragonBtn.MouseButton1Click:Connect(function()
	dragonActive = not dragonActive
	UpdateButtonStyle(DragonBtn, dragonActive)
	applyAction("dragon", dragonActive)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.R then
		MainFrame.Visible = not MainFrame.Visible
	elseif input.KeyCode == Enum.KeyCode.Y then
		freezeActive = not freezeActive
		UpdateButtonStyle(FreezeBtn, freezeActive)
		applyAction("freeze", freezeActive)
	elseif input.KeyCode == Enum.KeyCode.G then
		disappearActive = not disappearActive
		UpdateButtonStyle(DisappearBtn, disappearActive)
		applyAction("disappear", disappearActive)
	elseif input.KeyCode == Enum.KeyCode.J then
		dragonActive = not dragonActive
		UpdateButtonStyle(DragonBtn, dragonActive)
		applyAction("dragon", dragonActive)
	end
end)

local lastApply = 0

LocalPlayer.PlayerGui.DescendantAdded:Connect(function(obj)
	if not obj:IsA("ViewportFrame") then return end
	local now = tick()
	if now - lastApply < 1 then return end
	lastApply = now
	task.wait(0.5)
	applyToViewport(obj)
end)

LocalPlayer.PlayerGui.DescendantAdded:Connect(function(obj)
	if not disappearActive then return end
	task.wait(0.1)
	if obj:IsA("TextLabel") or obj:IsA("TextButton") then
		local text = string.lower(obj.Text)
		if string.find(text, "brainrot") or string.find(text, "skibidi") or string.find(text, "rizz") then
			obj.Visible = false
		end
	end
	if obj:IsA("Frame") or obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
		local name = string.lower(obj.Name)
		if string.find(name, "brainrot") or string.find(name, "skibidi") then
			obj.Visible = false
		end
	end
end)
