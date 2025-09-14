queue_on_teleport(game:HttpGet('https://raw.githubusercontent.com/qianchengawa/dM2-lF9-pY3-sF3-eA8.aN5-bB5-cD8-yA0-bR4-/refs/heads/main/iB3%3DnU1.oI6.lO6%3CzX8%25eH0%7DfX5%23oR9_lL4%3BpY0-.lua'))
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/qian-cheng-awa/Rayfield/refs/heads/main/Main.lua'))()
local Window = Rayfield:CreateWindow({
	Name = 'STBB',
	Icon = 0,
	LoadingTitle = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
	LoadingSubtitle = 'by 牢大',
	Theme = 'Default',
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	ConfigurationSaving = {
		Enabled = false,
	},
})
local diff = isfile('TDM/STBBAutoFarm/Dif.json') and readfile('TDM/STBBAutoFarm/Dif.json') or 'Zombie'
local Player = game:GetService('Players').LocalPlayer
local Tab = Window:CreateTab('主要', 'camera')
local val = isfile('TDM/STBBAutoFarm/Toggle.json') and readfile('TDM/STBBAutoFarm/Toggle.json') == 'true' or false
lTab:CreateToggle({
	Name = '自动挂机v1',
	CurrentValue = val,
	Flag = 'Toggle1',
	Callback = function(Value)
		val = Value
		writefile('TDM/STBBAutoFarm/Toggle.json', tostring(Value))
		if game.PlaceId == 18816546575 then
			if val then
				task.spawn(function()
					repeat
						game:GetService('RunService').RenderStepped:Wait()
					until (game:GetService('Players').LocalPlayer.PlayerGui.Play.Enabled and workspace.Voteing.Value) or workspace.Mode.Value ~= ''
					game:GetService('ReplicatedStorage'):WaitForChild('Vote'):FireServer(diff)
					game:GetService('ReplicatedStorage'):WaitForChild('GetReadyRemote'):FireServer('1',true)
				end)
			end
		elseif game.PlaceId == 18845414266 then
			if val then
				game:GetService('ReplicatedStorage'):WaitForChild('MainHandler'):FireServer({'CreateRoom','','1145141919'})
				task.wait(1)
				game:GetService('ReplicatedStorage'):WaitForChild('MainHandler'):FireServer({'Start'})
			end
		end
	end,
})



Tab:CreateDropdown({
	Name = '选择难度',
	Options = {
		'BossRush',
		'Christmas',
		'Hard',
		'Hell',
		'Insane',
		'Nightmare',
		'Normal',
		'ThunderStorm',
		'VeryHard',
		'Zombie',
	},
	CurrentOption = {diff},
	MultipleOptions = false,
	Flag = 'Dropdown1',
	Callback = function(Options)
		diff = unpack(Options)
		writefile('TDM/STBBAutoFarm/Dif.json', tostring(unpack(Options)))
	end,
})

local waves = isfile('TDM/STBBAutoFarm/Wave.json') and tonumber(readfile('TDM/STBBAutoFarm/Wave.json')) or math.huge
Tab:CreateInput({
	Name = '多少波自动重开',
	CurrentValue = tostring(waves),
	PlaceholderText = '',
	RemoveTextAfterFocusLost = false,
	Flag = 'Input1',
	Callback = function(Text)
		waves = tonumber(Text)
		writefile('TDM/STBBAutoFarm/Wave.json', tostring(tonumber(Text)))
	end,
})

local distance = isfile('TDM/STBBAutoFarm/Distance.json') and readfile('TDM/STBBAutoFarm/Distance.json') or 10
Tab:CreateSlider({
	Name = "距离",
	Range = {-100, 100},
	Increment = 10,
	Suffix = "m",
	CurrentValue = distance,
	Flag = "Slider1",
	Callback = function(Value)
		distance = Value
		writefile('TDM/STBBAutoFarm/Distance.json', tostring(Value))
	end,
})

local autodistance = isfile('TDM/STBBAutoFarm/AutoDistance.json') and readfile('TDM/STBBAutoFarm/AutoDistance.json') == "true" or false
Tab:CreateToggle({
	Name = '自动距离',
	CurrentValue = autodistance,
	Flag = 'Toggle1',
	Callback = function(Value)
		autodistance = Value
		writefile('TDM/STBBAutoFarm/AutoDistance.json', tostring(Value))
	end,
})

pcall(function()
	game:GetService('Players').LocalPlayer.Idled:connect(function()
		local aaa = game:GetService("VirtualUser")
		aaa:CaptureController()
		aaa:ClickButton2(Vector2.new())
	end)
end)

if game.PlaceId == 18816546575 then
	local function reset()
		local charcter = game:GetService("Players").LocalPlayer.Character
		for i,v in ipairs(charcter:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
				v.CanQuery = false
				v.CanTouch = false
			end
		end
		if charcter:FindFirstChildOfClass("BodyVelocity") then
			charcter:FindFirstChildOfClass("BodyVelocity"):Destroy()
		end
		if charcter:FindFirstChildWhichIsA("BodyVelocity") then
			charcter:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
		end
		local ve = Instance.new("BodyVelocity",charcter.PrimaryPart)
		ve.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		ve.Velocity = Vector3.new(0,-10000,0)
	end
	if val then
		task.spawn(function()
			repeat
				game:GetService('RunService').RenderStepped:Wait()
			until (game:GetService('Players').LocalPlayer.PlayerGui.Play.Enabled and workspace.Voteing.Value) or workspace.Mode.Value ~= ''
			game:GetService('ReplicatedStorage'):WaitForChild('Vote'):FireServer(diff)
			game:GetService('ReplicatedStorage'):WaitForChild('GetReadyRemote'):FireServer('1',true)
		end)
	end
	game:GetService('RunService').RenderStepped:Connect(function()
		if val then
			if workspace.Wave.Value >= waves then
				game:GetService('TeleportService'):Teleport(18845414266,Player)
			end
			
			if workspace:FindFirstChild("TowerHealth") and workspace.TowerHealth.Value <= 10 then
				game:GetService('TeleportService'):Teleport(18845414266,Player)
			end
			
			local character = Player.Character
			
			if character.Humanoid.Health <= 1 then
				game:GetService('TeleportService'):Teleport(18845414266,Player)
			end
			local nearst
			if workspace.Living:FindFirstChild("transmitterToilet") then
				nearst = workspace.Living:FindFirstChild("transmitterToilet")
			else
				for i,v in ipairs(workspace.Living:GetChildren()) do
					if v:FindFirstChild('Humanoid') and v:FindFirstChild('AI') and not game:GetService("Players"):GetPlayerFromCharacter(v) and v.Humanoid.Health > 0 then
						if not nearst or nearst and (nearst:GetPivot().Position - character:GetPivot().Position).Magnitude > (v:GetPivot().Position - character:GetPivot().Position).Magnitude and v.Humanoid.Health > 0 then
							nearst = v
						end
					end
				end
			end
			if Player.Character.Humanoid.Health/Player.Character.Humanoid.MaxHealth <= 0.5 and not Player.Character:GetAttribute('Reseting') then
				reset()
			end
			if Player.Character.Humanoid.Health/Player.Character.Humanoid.MaxHealth > 0.5 and nearst and nearst.Parent and nearst.Humanoid.Health>0 then
				local pos,siz = character:GetBoundingBox()
				game:GetService('TweenService'):Create(character.HumanoidRootPart,TweenInfo.new((nearst:GetPivot().Position - character:GetPivot().Position).Magnitude/1000),{CFrame = CFrame.lookAt((nearst:GetPivot() * CFrame.new(0,0,autodistance and -siz.Z or distance)).Position,nearst:GetPivot().Position)}):Play()
			end
			game:GetService('ReplicatedStorage'):WaitForChild('LMB'):FireServer()
			game:GetService('ReplicatedStorage'):WaitForChild('SkipHelicopter'):FireServer()
		end
	end)
elseif game.PlaceId == 18845414266 then
	if val then
		game:GetService('ReplicatedStorage'):WaitForChild('MainHandler'):FireServer({'CreateRoom','','1145141919'})
		task.wait(1)
		game:GetService('ReplicatedStorage'):WaitForChild('MainHandler'):FireServer({'Start'})
	end
else
	game:GetService('TeleportService'):Teleport(18845414266,Player)
end
