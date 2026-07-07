local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local VERSION = "2.25"

if LocalPlayer.PlayerGui:FindFirstChild("FEGO") then
	LocalPlayer.PlayerGui["FEGO"]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FEGO"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9999
ScreenGui.Parent = LocalPlayer.PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 280)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 36)
TitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 14)

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "FEGO HUB v" .. VERSION
TitleLabel.TextColor3 = Color3.fromRGB(170, 110, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = TitleBar

local TabMain = Instance.new("TextButton")
TabMain.Size = UDim2.new(0.45, 0, 0, 28)
TabMain.Position = UDim2.new(0.03, 0, 0, 44)
TabMain.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
TabMain.Text = "MAIN"
TabMain.TextColor3 = Color3.new(1, 1, 1)
TabMain.Font = Enum.Font.GothamBold
TabMain.TextSize = 13
TabMain.AutoButtonColor = false
TabMain.Parent = MainFrame
Instance.new("UICorner", TabMain).CornerRadius = UDim.new(0, 8)

local TabPets = Instance.new("TextButton")
TabPets.Size = UDim2.new(0.45, 0, 0, 28)
TabPets.Position = UDim2.new(0.52, 0, 0, 44)
TabPets.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
TabPets.Text = "PETS"
TabPets.TextColor3 = Color3.fromRGB(200, 200, 210)
TabPets.Font = Enum.Font.GothamBold
TabPets.TextSize = 13
TabPets.AutoButtonColor = false
TabPets.Parent = MainFrame
Instance.new("UICorner", TabPets).CornerRadius = UDim.new(0, 8)

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -80)
ContentFrame.Position = UDim2.new(0, 0, 0, 80)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame

local MainContent = Instance.new("Frame")
MainContent.Size = UDim2.new(1, 0, 1, 0)
MainContent.BackgroundTransparency = 1
MainContent.Parent = ContentFrame

local PetsContent = Instance.new("Frame")
PetsContent.Size = UDim2.new(1, 0, 1, 0)
PetsContent.BackgroundTransparency = 1
PetsContent.Visible = false
PetsContent.Parent = ContentFrame

local function CreateButton(text, yPos, parent)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0.86, 0, 0, 28)
	b.Position = UDim2.new(0.07, 0, 0, yPos)
	b.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
	b.Text = text
	b.TextColor3 = Color3.fromRGB(200, 200, 210)
	b.Font = Enum.Font.GothamSemibold
	b.TextSize = 11
	b.AutoButtonColor = false
	b.Parent = parent
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
	return b
end

local FreezeBtn = CreateButton("[Y] FREEZE  OFF", 0, MainContent)
local DisappearBtn = CreateButton("[G] DISAPPEAR  OFF", 34, MainContent)
local SpinBtn = CreateButton("[X] SPIN  OFF", 68, MainContent)
local FlipBtn = CreateButton("[B] FLIP  OFF", 102, MainContent)
local DestructBtn = CreateButton("[V] DESTRUCT  OFF", 136, MainContent)

local HydraBtn = CreateButton("[1] HYDRA  OFF", 0, PetsContent)
local CannelloniBtn = CreateButton("[2] DRAGON CANN.  OFF", 34, PetsContent)
local GingerBtn = CreateButton("[3] GINGER GERAT  OFF", 68, PetsContent)
local ColorsBtn = CreateButton("[C] COLOURS  OFF", 102, PetsContent)

local function ToggleBtn(btn, state)
	btn.Text = state and string.gsub(btn.Text, "OFF", "ON") or string.gsub(btn.Text, "ON", "OFF")
	btn.BackgroundColor3 = state and Color3.fromRGB(30, 110, 50) or Color3.fromRGB(28, 28, 38)
	btn.TextColor3 = state and Color3.fromRGB(180, 255, 180) or Color3.fromRGB(200, 200, 210)
end

TabMain.MouseButton1Click:Connect(function()
	MainContent.Visible = true
	PetsContent.Visible = false
	TabMain.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
	TabPets.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
end)

TabPets.MouseButton1Click:Connect(function()
	MainContent.Visible = false
	PetsContent.Visible = true
	TabPets.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
	TabMain.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
end)

local freezeOn = false
local disappearOn = false
local spinOn = false
local flipOn = false
local destructOn = false
local hydraOn = false
local cannelloniOn = false
local gingerOn = false
local colorsOn = false
local spinOffs = {}
local flipOffs = {}
local spinT = 0
local colorT = 0

FreezeBtn.MouseButton1Click:Connect(function() freezeOn = not freezeOn; ToggleBtn(FreezeBtn, freezeOn) end)
DisappearBtn.MouseButton1Click:Connect(function() disappearOn = not disappearOn; ToggleBtn(DisappearBtn, disappearOn) end)
HydraBtn.MouseButton1Click:Connect(function() hydraOn = not hydraOn; ToggleBtn(HydraBtn, hydraOn) end)
CannelloniBtn.MouseButton1Click:Connect(function() cannelloniOn = not cannelloniOn; ToggleBtn(CannelloniBtn, cannelloniOn) end)
GingerBtn.MouseButton1Click:Connect(function() gingerOn = not gingerOn; ToggleBtn(GingerBtn, gingerOn) end)
ColorsBtn.MouseButton1Click:Connect(function() colorsOn = not colorsOn; ToggleBtn(ColorsBtn, colorsOn) end)

SpinBtn.MouseButton1Click:Connect(function()
	spinOn = not spinOn
	if not spinOn then
		for o, c in pairs(spinOffs) do pcall(function() o.CFrame = c end) end
		spinOffs = {}
		spinT = 0
	end
	ToggleBtn(SpinBtn, spinOn)
end)

FlipBtn.MouseButton1Click:Connect(function()
	flipOn = not flipOn
	if not flipOn then
		for o, c in pairs(flipOffs) do pcall(function() o.CFrame = c end) end
		flipOffs = {}
	end
	ToggleBtn(FlipBtn, flipOn)
end)

DestructBtn.MouseButton1Click:Connect(function()
	destructOn = not destructOn
	ToggleBtn(DestructBtn, destructOn)
end)

UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	local k = input.KeyCode
	if k == Enum.KeyCode.R then MainFrame.Visible = not MainFrame.Visible
	elseif k == Enum.KeyCode.Y then freezeOn = not freezeOn; ToggleBtn(FreezeBtn, freezeOn)
	elseif k == Enum.KeyCode.G then disappearOn = not disappearOn; ToggleBtn(DisappearBtn, disappearOn)
	elseif k == Enum.KeyCode.X then
		spinOn = not spinOn
		if not spinOn then for o, c in pairs(spinOffs) do pcall(function() o.CFrame = c end) end; spinOffs = {}; spinT = 0 end
		ToggleBtn(SpinBtn, spinOn)
	elseif k == Enum.KeyCode.B then
		flipOn = not flipOn
		if not flipOn then for o, c in pairs(flipOffs) do pcall(function() o.CFrame = c end) end; flipOffs = {} end
		ToggleBtn(FlipBtn, flipOn)
	elseif k == Enum.KeyCode.V then
		destructOn = not destructOn
		ToggleBtn(DestructBtn, destructOn)
	elseif k == Enum.KeyCode.One then hydraOn = not hydraOn; ToggleBtn(HydraBtn, hydraOn)
	elseif k == Enum.KeyCode.Two then cannelloniOn = not cannelloniOn; ToggleBtn(CannelloniBtn, cannelloniOn)
	elseif k == Enum.KeyCode.Three then gingerOn = not gingerOn; ToggleBtn(GingerBtn, gingerOn)
	elseif k == Enum.KeyCode.C then colorsOn = not colorsOn; ToggleBtn(ColorsBtn, colorsOn)
	end
end)

local function isVisibleOpponent(obj)
	local ok, pos = pcall(function()
		return obj.AbsolutePosition.X + obj.AbsoluteSize.X / 2
	end)
	if not ok then return false end
	local mid = Camera.ViewportSize.X / 2
	return pos > mid
end

local function hasText(obj, keyword)
	local ok1, txt = pcall(function() return string.lower(obj.Text) end)
	if ok1 and txt and string.find(txt, keyword) then return true end
	local ok2, nm = pcall(function() return string.lower(obj.Name) end)
	if ok2 and nm and string.find(nm, keyword) then return true end
	return false
end

local function findTextInDescendants(parent, keyword)
	for _, child in pairs(parent:GetDescendants()) do
		local ok, txt = pcall(function() return string.lower(child.Text) end)
		if ok and txt and string.find(txt, keyword) then return child end
		local ok2, nm = pcall(function() return string.lower(child.Name) end)
		if ok2 and nm and string.find(nm, keyword) then return child end
	end
	return nil
end

RunService.Heartbeat:Connect(function()
	pcall(function()
		for _, vf in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
			if vf:IsA("ViewportFrame") then
				if isVisibleOpponent(vf) then
					vf.BackgroundTransparency = 1
				end
			end
		end
		if destructOn then
			for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
				pcall(function()
					if gui:IsA("GuiButton") then
						if hasText(gui, "aceptar") or hasText(gui, "cancel") or hasText(gui, "listo") or hasText(gui, "ready") or hasText(gui, "accept") then
							gui.Visible = false
							gui.Active = false
							gui.BackgroundTransparency = 1
							gui.Size = UDim2.new(0, 0, 0, 0)
							if gui:IsA("TextButton") then
								gui.TextTransparency = 1
							end
						end
					end
				end)
			end
			for _, vf in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
				if vf:IsA("ViewportFrame") then
					if isVisibleOpponent(vf) then
						vf.BackgroundTransparency = 1
						for _, obj in pairs(vf:GetDescendants()) do
							pcall(function()
								if obj:IsA("BasePart") or obj:IsA("MeshPart") then
									obj.Transparency = 1
									obj.LocalTransparencyModifier = 1
									obj.Size = Vector3.new(0.001, 0.001, 0.001)
								end
							end)
						end
					end
				end
			end
		end
		for _, vf in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
			if vf:IsA("ViewportFrame") then
				local opp = isVisibleOpponent(vf)
				if opp then
					if disappearOn then
						vf.BackgroundTransparency = 1
						for _, obj in pairs(vf:GetDescendants()) do
							pcall(function()
								if obj:IsA("BasePart") or obj:IsA("MeshPart") then
									obj.Transparency = 1
									obj.LocalTransparencyModifier = 1
								end
								if obj:IsA("Decal") or obj:IsA("Texture") then
									obj.Transparency = 1
								end
							end)
						end
					elseif not destructOn then
						vf.BackgroundTransparency = 0
					end
				end
				if opp then
					if freezeOn then spinT = spinT + 0.1 end
					if colorsOn then colorT = colorT + 0.05 end
				end
				for _, obj in pairs(vf:GetDescendants()) do
					pcall(function()
						local isPart = obj:IsA("BasePart") or obj:IsA("MeshPart")
						local nm = string.lower(obj.Name)
						local isHydra = hydraOn and string.find(nm, "hydra")
						local isCann = cannelloniOn and string.find(nm, "cannelloni")
						local isGing = gingerOn and string.find(nm, "ginger gerat")
						local isPet = isHydra or isCann or isGing
						if opp then
							if isPet then obj.Transparency = 1; obj.LocalTransparencyModifier = 1 end
							if not disappearOn and freezeOn and isPart then obj.Anchored = true end
							if spinOn and isPart then
								if not spinOffs[obj] then spinOffs[obj] = obj.CFrame end
								obj.CFrame = spinOffs[obj] * CFrame.Angles(0, math.rad(spinT * 100), 0)
							end
							if flipOn and isPart then
								if not flipOffs[obj] then flipOffs[obj] = obj.CFrame end
								obj.CFrame = flipOffs[obj] * CFrame.Angles(math.rad(180), 0, 0)
							end
							if colorsOn and isPart then
								obj.Color = Color3.fromHSV(colorT % 1, 1, 1)
							end
						end
					end)
				end
				if not spinOn then for o, c in pairs(spinOffs) do pcall(function() o.CFrame = c end) end; spinOffs = {} end
				if not flipOn then for o, c in pairs(flipOffs) do pcall(function() o.CFrame = c end) end; flipOffs = {} end
			end
		end
	end)
end)
