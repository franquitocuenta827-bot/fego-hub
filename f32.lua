-- FEGO HUB v3.2 - XENO
local P=game:GetService("Players")
local U=game:GetService("UserInputService")
local LP=P.LocalPlayer
local C=workspace.CurrentCamera

if LP.PlayerGui:FindFirstChild("FEGO")then LP.PlayerGui.FEGO:Destroy()end

local S=Instance.new("ScreenGui")
S.Name="FEGO"
S.ResetOnSpawn=false
S.DisplayOrder=9999
S.Parent=LP.PlayerGui

local MF=Instance.new("Frame")
MF.Size=UDim2.new(0,200,0,280)
MF.Position=UDim2.new(0.5,-100,0.5,-140)
MF.BackgroundColor3=Color3.fromRGB(18,18,24)
MF.BorderSizePixel=0
MF.Active=true
MF.Draggable=true
MF.Visible=false
MF.Parent=S
Instance.new("UICorner",MF).CornerRadius=UDim.new(0,14)

local TB=Instance.new("Frame")
TB.Size=UDim2.new(1,0,0,36)
TB.BackgroundColor3=Color3.fromRGB(10,10,14)
TB.BorderSizePixel=0
TB.Parent=MF
Instance.new("UICorner",TB).CornerRadius=UDim.new(0,14)

local TF=Instance.new("Frame")
TF.Size=UDim2.new(1,0,0,12)
TF.Position=UDim2.new(0,0,1,-12)
TF.BackgroundColor3=Color3.fromRGB(10,10,14)
TF.BorderSizePixel=0
TF.Parent=TB

local TL=Instance.new("TextLabel")
TL.Size=UDim2.new(1,0,1,0)
TL.BackgroundTransparency=1
TL.Text="FEGO HUB v3.2"
TL.TextColor3=Color3.fromRGB(170,110,255)
TL.TextSize=15
TL.Font=Enum.Font.GothamBold
TL.Parent=TB

local TM=Instance.new("TextButton")
TM.Size=UDim2.new(0.45,0,0,28)
TM.Position=UDim2.new(0.03,0,0,44)
TM.BackgroundColor3=Color3.fromRGB(80,40,140)
TM.Text="MAIN"
TM.TextColor3=Color3.new(1,1,1)
TM.Font=Enum.Font.GothamBold
TM.TextSize=13
TM.AutoButtonColor=false
TM.Parent=MF
Instance.new("UICorner",TM).CornerRadius=UDim.new(0,8)

local TP=Instance.new("TextButton")
TP.Size=UDim2.new(0.45,0,0,28)
TP.Position=UDim2.new(0.52,0,0,44)
TP.BackgroundColor3=Color3.fromRGB(28,28,38)
TP.Text="PETS"
TP.TextColor3=Color3.fromRGB(200,200,210)
TP.Font=Enum.Font.GothamBold
TP.TextSize=13
TP.AutoButtonColor=false
TP.Parent=MF
Instance.new("UICorner",TP).CornerRadius=UDim.new(0,8)

local CF=Instance.new("Frame")
CF.Size=UDim2.new(1,0,1,-80)
CF.Position=UDim2.new(0,0,0,80)
CF.BackgroundTransparency=1
CF.ClipsDescendants=true
CF.Parent=MF

local MC=Instance.new("Frame")
MC.Size=UDim2.new(1,0,1,0)
MC.BackgroundTransparency=1
MC.Parent=CF

local PC=Instance.new("Frame")
PC.Size=UDim2.new(1,0,1,0)
PC.BackgroundTransparency=1
PC.Visible=false
PC.Parent=CF

local function CB(t,y,p)
	local b=Instance.new("TextButton")
	b.Size=UDim2.new(0.86,0,0,28)
	b.Position=UDim2.new(0.07,0,0,y)
	b.BackgroundColor3=Color3.fromRGB(28,28,38)
	b.Text=t
	b.TextColor3=Color3.fromRGB(200,200,210)
	b.Font=Enum.Font.GothamSemibold
	b.TextSize=11
	b.AutoButtonColor=false
	b.Parent=p
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
	return b
end

local FB=CB("[Y] FREEZE OFF",0,MC)
local DB=CB("[G] DISAPPEAR OFF",34,MC)
local SB=CB("[X] SPIN OFF",68,MC)
local FLB=CB("[B] FLIP OFF",102,MC)
local DEB=CB("[V] DESTRUCT OFF",136,MC)
local HB=CB("[1] HYDRA OFF",0,PC)
local CB2=CB("[2] DRAGON CANN OFF",34,PC)
local GB=CB("[3] GINGER OFF",68,PC)
local CLB=CB("[C] COLOURS OFF",102,PC)

local function TG(b,s)
	b.Text=s and string.gsub(b.Text,"OFF","ON")or string.gsub(b.Text,"ON","OFF")
	b.BackgroundColor3=s and Color3.fromRGB(30,110,50)or Color3.fromRGB(28,28,38)
	b.TextColor3=s and Color3.fromRGB(180,255,180)or Color3.fromRGB(200,200,210)
end

TM.MouseButton1Click:Connect(function()MC.Visible=true PC.Visible=false TM.BackgroundColor3=Color3.fromRGB(80,40,140)TP.BackgroundColor3=Color3.fromRGB(28,28,38)end)
TP.MouseButton1Click:Connect(function()MC.Visible=false PC.Visible=true TP.BackgroundColor3=Color3.fromRGB(80,40,140)TM.BackgroundColor3=Color3.fromRGB(28,28,38)end)

local fOn=false
local dOn=false
local sOn=false
local flOn=false
local deOn=false
local hOn=false
local cOn=false
local gOn=false
local clOn=false
local sO={}
local fO={}
local sT=0
local cT=0

FB.MouseButton1Click:Connect(function()fOn=not fOn TG(FB,fOn)end)
DB.MouseButton1Click:Connect(function()dOn=not dOn TG(DB,dOn)end)
HB.MouseButton1Click:Connect(function()hOn=not hOn TG(HB,hOn)end)
CB2.MouseButton1Click:Connect(function()cOn=not cOn TG(CB2,cOn)end)
GB.MouseButton1Click:Connect(function()gOn=not gOn TG(GB,gOn)end)
CLB.MouseButton1Click:Connect(function()clOn=not clOn TG(CLB,clOn)end)
SB.MouseButton1Click:Connect(function()
	sOn=not sOn
	if not sOn then for o,c in pairs(sO)do pcall(function()o.CFrame=c end)end sO={} sT=0 end
	TG(SB,sOn)
end)
FLB.MouseButton1Click:Connect(function()
	flOn=not flOn
	if not flOn then for o,c in pairs(fO)do pcall(function()o.CFrame=c end)end fO={} end
	TG(FLB,flOn)
end)
DEB.MouseButton1Click:Connect(function()deOn=not deOn TG(DEB,deOn)end)

U.InputBegan:Connect(function(i,g)
	if g then return end
	local k=i.KeyCode
	if k==Enum.KeyCode.R then MF.Visible=not MF.Visible
	elseif k==Enum.KeyCode.Y then fOn=not fOn TG(FB,fOn)
	elseif k==Enum.KeyCode.G then dOn=not dOn TG(DB,dOn)
	elseif k==Enum.KeyCode.X then
		sOn=not sOn
		if not sOn then for o,c in pairs(sO)do pcall(function()o.CFrame=c end)end sO={} sT=0 end
		TG(SB,sOn)
	elseif k==Enum.KeyCode.B then
		flOn=not flOn
		if not flOn then for o,c in pairs(fO)do pcall(function()o.CFrame=c end)end fO={} end
		TG(FLB,flOn)
	elseif k==Enum.KeyCode.V then deOn=not deOn TG(DEB,deOn)
	elseif k==Enum.KeyCode.One then hOn=not hOn TG(HB,hOn)
	elseif k==Enum.KeyCode.Two then cOn=not cOn TG(CB2,cOn)
	elseif k==Enum.KeyCode.Three then gOn=not gOn TG(GB,gOn)
	elseif k==Enum.KeyCode.C then clOn=not clOn TG(CLB,clOn)
	end
end)

spawn(function()
	while true do
		wait(0.2)
		pcall(function()
			local mid=C.ViewportSize.X/2
			local desc=LP.PlayerGui:GetChildren()

			for _,vf in pairs(desc)do
				if vf:IsA("ViewportFrame")then
					local ok,x=pcall(function()return vf.AbsolutePosition.X end)
					local ok2,sx=pcall(function()return vf.AbsoluteSize.X end)
					if ok and ok2 then
						local isOpp=(x+sx/2)>mid
						if isOpp then
							pcall(function()vf.BackgroundTransparency=1 end)

							if deOn then
								for _,g in pairs(desc)do
									pcall(function()
										if g:IsA("GuiButton")then
											local okT,txt=pcall(function()return g.Text end)
											local okN,nm=pcall(function()return g.Name end)
											local t=okT and string.lower(txt or"")or""
											local n=okN and string.lower(nm or"")or""
											if string.find(t,"aceptar")or string.find(t,"cancel")or string.find(t,"listo")or string.find(t,"accept")or string.find(n,"aceptar")or string.find(n,"cancel")then
												g.Visible=false
												g.Active=false
												g.BackgroundTransparency=1
												g.Size=UDim2.new(0,0,0,0)
											end
										end
									end)
								end
							end

							for _,obj in pairs(vf:GetChildren())do
								pcall(function()
									if obj:IsA("BasePart")or obj:IsA("MeshPart")then
										local nm=string.lower(obj.Name)
										if dOn then
											obj.Transparency=1
											obj.LocalTransparencyModifier=1
										end
										if hOn and string.find(nm,"hydra")then obj.Transparency=1 obj.LocalTransparencyModifier=1 end
										if cOn and string.find(nm,"cannelloni")then obj.Transparency=1 obj.LocalTransparencyModifier=1 end
										if gOn and(string.find(nm,"ginger")or string.find(nm,"brainrot"))then obj.Transparency=1 obj.LocalTransparencyModifier=1 end
										if fOn then obj.Anchored=true end
										if sOn then
											if not sO[obj]then sO[obj]=obj.CFrame end
											obj.CFrame=sO[obj]*CFrame.Angles(0,math.rad(sT*100),0)
										end
										if flOn then
											if not fO[obj]then fO[obj]=obj.CFrame end
											obj.CFrame=fO[obj]*CFrame.Angles(math.rad(180),0,0)
										end
										if clOn then
											obj.Color=Color3.fromHSV(cT%1,1,1)
										end
									end
								end)
							end

							if sOn then sT=sT+0.1 end
							if clOn then cT=cT+0.05 end
							if not sOn then for o,c in pairs(sO)do pcall(function()o.CFrame=c end)end sO={} end
							if not flOn then for o,c in pairs(fO)do pcall(function()o.CFrame=c end)end fO={} end
						end
					end
				end
			end
		end)
	end
end)
