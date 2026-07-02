local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

if CoreGui:FindFirstChild("FEGO") then
	CoreGui["FEGO"]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FEGO"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9999
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 180, 0, 130)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -65)
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
TitleBar.Size = UDim2.new(1, 0, 0, 36)
TitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 14)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "FEGO HUB"
TitleLabel.TextColor3 = Color3.fromRGB(170, 110, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = TitleBar

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0.85, 0, 0, 1)
Divider.Position = UDim2.new(0.075, 0, 0, 44)
Divider.BackgroundColor3 = Color3.fromRGB(60, 30, 100)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

local PetFrame = Instance.new("Frame")
PetFrame.Name = "PetFrame"
PetFrame.Size = UDim2.new(0, 180, 0, 220)
PetFrame.Position = UDim2.new(0.5, 10, 0.5, -110)
PetFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
PetFrame.BorderSizePixel = 0
PetFrame.Active = true
PetFrame.Draggable = true
PetFrame.Visible = false
PetFrame.Parent = ScreenGui

local PetCorner = Instance.new("UICorner")
PetCorner.CornerRadius = UDim.new(0, 14)
PetCorner.Parent = PetFrame

local PetStroke = Instance.new("UIStroke")
PetStroke.Color = Color3.fromRGB(120, 60, 200)
PetStroke.Thickness = 1.5
PetStroke.Transparency = 0.2
PetStroke.Parent = PetFrame

local PetTitleBar = Instance.new("Frame")
PetTitleBar.Size = UDim2.new(1, 0, 0, 36)
PetTitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
PetTitleBar.BorderSizePixel = 0
PetTitleBar.Parent = PetFrame

local PetTitleCorner = Instance.new("UICorner")
PetTitleCorner.CornerRadius = UDim.new(0, 14)
PetTitleCorner.Parent = PetTitleBar

local PetTitleFix = Instance.new("Frame")
PetTitleFix.Size = UDim2.new(1, 0, 0, 12)
PetTitleFix.Position = UDim2.new(0, 0, 1, -12)
PetTitleFix.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
PetTitleFix.BorderSizePixel = 0
PetTitleFix.Parent = PetTitleBar

local PetTitleLabel = Instance.new("TextLabel")
PetTitleLabel.Size = UDim2.new(1, 0, 1, 0)
PetTitleLabel.BackgroundTransparency = 1
PetTitleLabel.Text = "PETS"
PetTitleLabel.TextColor3 = Color3.fromRGB(170, 110, 255)
PetTitleLabel.TextSize = 15
PetTitleLabel.Font = Enum.Font.GothamBold
PetTitleLabel.Parent = PetTitleBar

local PetDivider = Instance.new("Frame")
PetDivider.Size = UDim2.new(0.85, 0, 0, 1)
PetDivider.Position = UDim2.new(0.075, 0, 0, 44)
PetDivider.BackgroundColor3 = Color3.fromRGB(60, 30, 100)
PetDivider.BorderSizePixel = 0
PetDivider.Parent = PetFrame

local function CreateButton(name, text, yPos, parent)
	local Button = Instance.new("TextButton")
	Button.Name = name
	Button.Size = UDim2.new(0.86, 0, 0, 34)
	Button.Position = UDim2.new(0.07, 0, 0, yPos)
	Button.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
	Button.Text = text
	Button.TextColor3 = Color3.fromRGB(200, 200, 210)
	Button.Font = Enum.Font.GothamSemibold
	Button.TextSize = 12
	Button.AutoButtonColor = false
	Button.Parent = parent

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = Button

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(50, 30, 80)
	stroke.Thickness = 1
	stroke.Parent = Button

	return Button
end

local FreezeBtn = CreateButton("FreezeBtn", "[Y] FREEZE  OFF", 52, MainFrame)
local DisappearBtn = CreateButton("DisappearBtn", "[G] DISAPPEAR  OFF", 90, MainFrame)

local HydraBtn = CreateButton("HydraBtn", "[1] HYDRA  OFF", 52, PetFrame)
local CannelloniBtn = CreateButton("CannelloniBtn", "[2] DRAGON CANN.  OFF", 90, PetFrame)
local GingerBtn = CreateButton("GingerBtn", "[3] GINGER GERAT  OFF", 128, PetFrame)

local function UpdateButtonStyle(btn, active)
	btn.Text = active and string.gsub(btn.Text, "OFF", "ON") or string.gsub(btn.Text, "ON", "OFF")
	btn.BackgroundColor3 = active and Color3.fromRGB(30, 110, 50) or Color3.fromRGB(28, 28, 38)
	btn.TextColor3 = active and Color3.fromRGB(180, 255, 180) or Color3.fromRGB(200, 200, 210)
end

local freezeActive = false
local disappearActive = false
local hydraActive = false
local cannelloniActive = false
local gingerActive = false

local function matchesPet(obj, petName)
	local name = string.lower(obj.Name)
	if string.find(name, petName) then
		return true
	end
	if obj:IsA("BasePart") or obj:IsA("MeshPart") then
		for _, child in pairs(obj:GetChildren()) do
			if child:IsA("BillboardGui") or child:IsA("SurfaceGui") then
				for _, label in pairs(child:GetDescendants()) do
					if label:IsA("TextLabel") then
						if string.find(string.lower(label.Text), petName) then
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
	elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
		obj.Enabled = value < 1
	elseif obj:IsA("Sound") then
		obj.Volume = value < 1 and 1 or 0
	end
end

local function hideModel(obj)
	setAllTransparency(obj, 1)
	if obj:IsA("Model") then
		for _, part in pairs(obj:GetDescendants()) do
			setAllTransparency(part, 1)
		end
	end
end

local function isAnyPetActive()
	return hydraActive or cannelloniActive or gingerActive
end

local function shouldHide(obj)
	if hydraActive and matchesPet(obj, "hydra") then return true end
	if cannelloniActive and matchesPet(obj, "cannelloni") then return true end
	if gingerActive and matchesPet(obj, "ginger gerat") then return true end
	return false
end

local function scanViewport(v)
	for _, obj in pairs(v:GetDescendants()) do
		if shouldHide(obj) then
			hideModel(obj)
		end
		local parent = obj.Parent
		while parent and parent ~= v do
			if shouldHide(parent) then
				setAllTransparency(obj, 1)
				break
			end
			parent = parent.Parent
		end
		if disappearActive then
			setAllTransparency(obj, 1)
		end
		if freezeActive then
			if obj:IsA("BasePart") or obj:IsA("MeshPart") then
				obj.Anchored = true
			elseif obj:IsA("Animator") then
				for _, track in pairs(obj:GetPlayingAnimationTracks()) do
					track:AdjustSpeed(0)
				end
			elseif obj:IsA("Humanoid") then
				obj.WalkSpeed = 0
				obj.JumpPower = 0
			end
		end
	end
end

RunService.Heartbeat:Connect(function()
	if isAnyPetActive() or disappearActive or freezeActive then
		for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
			if v:IsA("ViewportFrame") then
				scanViewport(v)
			end
		end
	end
end)

HydraBtn.MouseButton1Click:Connect(function()
	hydraActive = not hydraActive
	UpdateButtonStyle(HydraBtn, hydraActive)
end)

CannelloniBtn.MouseButton1Click:Connect(function()
	cannelloniActive = not cannelloniActive
	UpdateButtonStyle(CannelloniBtn, cannelloniActive)
end)

GingerBtn.MouseButton1Click:Connect(function()
	gingerActive = not gingerActive
	UpdateButtonStyle(GingerBtn, gingerActive)
end)

FreezeBtn.MouseButton1Click:Connect(function()
	freezeActive = not freezeActive
	UpdateButtonStyle(FreezeBtn, freezeActive)
end)

DisappearBtn.MouseButton1Click:Connect(function()
	disappearActive = not disappearActive
	UpdateButtonStyle(DisappearBtn, disappearActive)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.R then
		MainFrame.Visible = not MainFrame.Visible
		PetFrame.Visible = not PetFrame.Visible
	elseif input.KeyCode == Enum.KeyCode.Y then
		freezeActive = not freezeActive
		UpdateButtonStyle(FreezeBtn, freezeActive)
	elseif input.KeyCode == Enum.KeyCode.G then
		disappearActive = not disappearActive
		UpdateButtonStyle(DisappearBtn, disappearActive)
	elseif input.KeyCode == Enum.KeyCode.One then
		hydraActive = not hydraActive
		UpdateButtonStyle(HydraBtn, hydraActive)
	elseif input.KeyCode == Enum.KeyCode.Two then
		cannelloniActive = not cannelloniActive
		UpdateButtonStyle(CannelloniBtn, cannelloniActive)
	elseif input.KeyCode == Enum.KeyCode.Three then
		gingerActive = not gingerActive
		UpdateButtonStyle(GingerBtn, gingerActive)
	end
end)
