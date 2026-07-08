-- FEGO HUB v3.2 XENO
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local LP = Players.LocalPlayer
local Cam = workspace.CurrentCamera

if LP.PlayerGui:FindFirstChild("FEGO") then
	LP.PlayerGui.FEGO:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "FEGO"
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999
gui.Parent = LP.PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 200, 0, 280)
main.Position = UDim2.new(0.5, -100, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = false
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(1, 0, 0, 36)
bar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
bar.BorderSizePixel = 0
bar.Parent = main
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 14)

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "FEGO HUB v3.2"
label.TextColor3 = Color3.fromRGB(170, 110, 255)
label.TextSize = 15
label.Font = Enum.Font.GothamBold
label.Parent = bar

local tabM = Instance.new("TextButton")
tabM.Size = UDim2.new(0.45, 0, 0, 28)
tabM.Position = UDim2.new(0.03, 0, 0, 44)
tabM.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
tabM.Text = "MAIN"
tabM.TextColor3 = Color3.new(1, 1, 1)
tabM.Font = Enum.Font.GothamBold
tabM.TextSize = 13
tabM.AutoButtonColor = false
tabM.Parent = main
Instance.new("UICorner", tabM).CornerRadius = UDim.new(0, 8)

local tabP = Instance.new("TextButton")
tabP.Size = UDim2.new(0.45, 0, 0, 28)
tabP.Position = UDim2.new(0.52, 0, 0, 44)
tabP.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
tabP.Text = "PETS"
tabP.TextColor3 = Color3.fromRGB(200, 200, 210)
tabP.Font = Enum.Font.GothamBold
tabP.TextSize = 13
tabP.AutoButtonColor = false
tabP.Parent = main
Instance.new("UICorner", tabP).CornerRadius = UDim.new(0, 8)

local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -80)
content.Position = UDim2.new(0, 0, 0, 80)
content.BackgroundTransparency = 1
content.ClipsDescendants = true
content.Parent = main

local mainTab = Instance.new("Frame")
mainTab.Size = UDim2.new(1, 0, 1, 0)
mainTab.BackgroundTransparency = 1
mainTab.Parent = content

local petsTab = Instance.new("Frame")
petsTab.Size = UDim2.new(1, 0, 1, 0)
petsTab.BackgroundTransparency = 1
petsTab.Visible = false
petsTab.Parent = content

local function makeBtn(text, y, parent)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0.86, 0, 0, 28)
	b.Position = UDim2.new(0.07, 0, 0, y)
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

local btnFreeze = makeBtn("[Y] FREEZE OFF", 0, mainTab)
local btnDisap = makeBtn("[G] DISAPPEAR OFF", 34, mainTab)
local btnSpin = makeBtn("[X] SPIN OFF", 68, mainTab)
local btnFlip = makeBtn("[B] FLIP OFF", 102, mainTab)
local btnDestr = makeBtn("[V] DESTRUCT OFF", 136, mainTab)

local btnHydra = makeBtn("[1] HYDRA OFF", 0, petsTab)
local btnCann = makeBtn("[2] DRAGON CANN OFF", 34, petsTab)
local btnGing = makeBtn("[3] GINGER OFF", 68, petsTab)
local btnCol = makeBtn("[C] COLOURS OFF", 102, petsTab)

local function setBtn(b, on)
	b.Text = on and string.gsub(b.Text, "OFF", "ON") or string.gsub(b.Text, "ON", "OFF")
	b.BackgroundColor3 = on and Color3.fromRGB(30, 110, 50) or Color3.fromRGB(28, 28, 38)
	b.TextColor3 = on and Color3.fromRGB(180, 255, 180) or Color3.fromRGB(200, 200, 210)
end

tabM.MouseButton1Click:Connect(function()
	mainTab.Visible = true
	petsTab.Visible = false
	tabM.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
	tabP.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
end)

tabP.MouseButton1Click:Connect(function()
	mainTab.Visible = false
	petsTab.Visible = true
	tabP.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
	tabM.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
end)

local state = {
	freeze = false,
	disappear = false,
	spin = false,
	flip = false,
	destruct = false,
	hydra = false,
	cannelloni = false,
	ginger = false,
	colors = false,
}

local spinOffs = {}
local flipOffs = {}
local spinT = 0
local colorT = 0

btnFreeze.MouseButton1Click:Connect(function()
	state.freeze = not state.freeze
	setBtn(btnFreeze, state.freeze)
end)

btnDisap.MouseButton1Click:Connect(function()
	state.disappear = not state.disappear
	setBtn(btnDisap, state.disappear)
end)

btnSpin.MouseButton1Click:Connect(function()
	state.spin = not state.spin
	if not state.spin then
		for o, c in pairs(spinOffs) do
			pcall(function() o.CFrame = c end)
		end
		spinOffs = {}
		spinT = 0
	end
	setBtn(btnSpin, state.spin)
end)

btnFlip.MouseButton1Click:Connect(function()
	state.flip = not state.flip
	if not state.flip then
		for o, c in pairs(flipOffs) do
			pcall(function() o.CFrame = c end)
		end
		flipOffs = {}
	end
	setBtn(btnFlip, state.flip)
end)

btnDestr.MouseButton1Click:Connect(function()
	state.destruct = not state.destruct
	setBtn(btnDestr, state.destruct)
end)

btnHydra.MouseButton1Click:Connect(function()
	state.hydra = not state.hydra
	setBtn(btnHydra, state.hydra)
end)

btnCann.MouseButton1Click:Connect(function()
	state.cannelloni = not state.cannelloni
	setBtn(btnCann, state.cannelloni)
end)

btnGing.MouseButton1Click:Connect(function()
	state.ginger = not state.ginger
	setBtn(btnGing, state.ginger)
end)

btnCol.MouseButton1Click:Connect(function()
	state.colors = not state.colors
	setBtn(btnCol, state.colors)
end)

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	local k = input.KeyCode
	if k == Enum.KeyCode.R then
		main.Visible = not main.Visible
	elseif k == Enum.KeyCode.Y then
		state.freeze = not state.freeze
		setBtn(btnFreeze, state.freeze)
	elseif k == Enum.KeyCode.G then
		state.disappear = not state.disappear
		setBtn(btnDisap, state.disappear)
	elseif k == Enum.KeyCode.X then
		state.spin = not state.spin
		if not state.spin then
			for o, c in pairs(spinOffs) do
				pcall(function() o.CFrame = c end)
			end
			spinOffs = {}
			spinT = 0
		end
		setBtn(btnSpin, state.spin)
	elseif k == Enum.KeyCode.B then
		state.flip = not state.flip
		if not state.flip then
			for o, c in pairs(flipOffs) do
				pcall(function() o.CFrame = c end)
			end
			flipOffs = {}
		end
		setBtn(btnFlip, state.flip)
	elseif k == Enum.KeyCode.V then
		state.destruct = not state.destruct
		setBtn(btnDestr, state.destruct)
	elseif k == Enum.KeyCode.One then
		state.hydra = not state.hydra
		setBtn(btnHydra, state.hydra)
	elseif k == Enum.KeyCode.Two then
		state.cannelloni = not state.cannelloni
		setBtn(btnCann, state.cannelloni)
	elseif k == Enum.KeyCode.Three then
		state.ginger = not state.ginger
		setBtn(btnGing, state.ginger)
	elseif k == Enum.KeyCode.C then
		state.colors = not state.colors
		setBtn(btnCol, state.colors)
	end
end)

spawn(function()
	while gui.Parent do
		wait(0.3)
		pcall(function()
			local mid = Cam.ViewportSize.X / 2

			for _, vf in pairs(LP.PlayerGui:GetDescendants()) do
				if vf:IsA("ViewportFrame") then
					local ok, absPos = pcall(function() return vf.AbsolutePosition.X end)
					local ok2, absSize = pcall(function() return vf.AbsoluteSize.X end)
					if ok and ok2 then
						local isOpp = (absPos + absSize / 2) > mid
						if isOpp then
							pcall(function() vf.BackgroundTransparency = 1 end)

							for _, obj in pairs(vf:GetDescendants()) do
								pcall(function()
									if obj:IsA("BasePart") or obj:IsA("MeshPart") then
										local nm = string.lower(obj.Name)

										if state.disappear then
											obj.Transparency = 1
											obj.LocalTransparencyModifier = 1
										end

										if state.hydra and string.find(nm, "hydra") then
											obj.Transparency = 1
											obj.LocalTransparencyModifier = 1
										end

										if state.cannelloni and string.find(nm, "cannelloni") then
											obj.Transparency = 1
											obj.LocalTransparencyModifier = 1
										end

										if state.ginger and (string.find(nm, "ginger") or string.find(nm, "brainrot")) then
											obj.Transparency = 1
											obj.LocalTransparencyModifier = 1
										end

										if state.freeze then
											obj.Anchored = true
										end

										if state.spin then
											if not spinOffs[obj] then
												spinOffs[obj] = obj.CFrame
											end
											obj.CFrame = spinOffs[obj] * CFrame.Angles(0, math.rad(spinT * 100), 0)
										end

										if state.flip then
											if not flipOffs[obj] then
												flipOffs[obj] = obj.CFrame
											end
											obj.CFrame = flipOffs[obj] * CFrame.Angles(math.rad(180), 0, 0)
										end

										if state.colors then
											obj.Color = Color3.fromHSV(colorT % 1, 1, 1)
										end
									end
								end)
							end

							if state.spin then spinT = spinT + 0.1 end
							if state.colors then colorT = colorT + 0.05 end
							if not state.spin then
								for o, c in pairs(spinOffs) do
									pcall(function() o.CFrame = c end)
								end
								spinOffs = {}
							end
							if not state.flip then
								for o, c in pairs(flipOffs) do
									pcall(function() o.CFrame = c end)
								end
								flipOffs = {}
							end
						end
					end
				end
			end

			if state.destruct then
				for _, g in pairs(LP.PlayerGui:GetDescendants()) do
					pcall(function()
						if g:IsA("GuiButton") then
							local okT, txt = pcall(function() return g.Text end)
							local okN, nm = pcall(function() return g.Name end)
							local t = okT and string.lower(txt or "") or ""
							local n = okN and string.lower(nm or "") or ""
							if string.find(t, "aceptar") or string.find(t, "cancel") or string.find(t, "listo") or string.find(t, "accept") or string.find(n, "aceptar") or string.find(n, "cancel") then
								g.Visible = false
								g.Active = false
								g.BackgroundTransparency = 1
								g.Size = UDim2.new(0, 0, 0, 0)
							end
						end
					end)
				end
			end
		end)
	end
end)
