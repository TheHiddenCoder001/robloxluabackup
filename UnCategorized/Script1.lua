id1 = "rbxassetid://3445788051"
id2 = "rbxassetid://4782250127"
id3 = "rbxassetid://4774879706"
id4 = "rbxassetid://2763936707"
--if game.Name ~= "A Bizarre Day" then
--id1 = "rbxassetid://4639551633"
--id2 = "rbxassetid://4639725706"
--id3 = "rbxassetid://4639554383"
--end
Anim3 = Instance.new("Animation")
Anim3.AnimationId = id1 -- abd not modded
Anim4 = Instance.new("Animation")
Anim4.AnimationId = id4 -- EEE
--Anim3.AnimationId = "rbxassetid://4639551633" -- abd modded
Anim2 = Instance.new("Animation")
Anim2.AnimationId = "rbxassetid://188632011"
local mouse = game.Players.LocalPlayer:GetMouse()
game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(h)
	if h:IsA("LocalScript") then
		h:Destroy()
		print("yikes")
	end
end)
repeat
	wait(0.5)
until game.Players.LocalPlayer.Character.Humanoid
--_G.track3 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim3)
--_G.track2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim2)
delay(0,function()
	while true do
		wait(0.5)
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("h") == nil then
			local h = Instance.new("Weld",game.Players.LocalPlayer.Character)
			h.Name = "h"
			print('_G.hhhh')
			wait(1.5)
			print("_G.hhhhh")
			game.ReplicatedStorage.Block:FireServer(true)
			_G.track3 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim3)
			_G.track2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim2)
			_G.track4 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim4)
		end
	end
end)
local grabbed = false
local barrage = false
local nou = false
local debounce = false
hitsounds = {"rbxassetid://545219984","rbxassetid://4137216950","rbxassetid://166423137","rbxassetid://4164190231","rbxassetid://147722227"}
_G.makehitbox = function(part,damage)
		local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
		hitbox1.CFrame = part.CFrame
		hitbox1.Name = "hitbox"
		hitbox1.Anchored = false
		hitbox1.CanCollide = false
		local weld = Instance.new("WeldConstraint",hitbox1)
		weld.Part0 = hitbox1
		weld.Part1 = part
		hitbox1.Size = part.Size
		hitbox1.Transparency = 0
		hitbox1.Color = Color3.new(0,0,0)
		game.Debris:AddItem(hitbox1,.15)
		local touch1 = hitbox1.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
				if debounce == false then
					debounce = true
					print(hit.Parent.Name)
					delay(0.001,function()debounce = false end)
					game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
					game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, damage, 0.3, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*25+Vector3.new(0,10,0),"rbxassetid://241837157", 0.2 ,Color3.new(1, 1, 1), "rbxassetid://1202656211", 1, 1)
					hitbox1:Destroy()
 
				end
			elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
				if debounce == false then
					debounce = true
					print(hit.Parent.Parent.Name)
					delay(0.001,function()debounce = false end)
					game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
					game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, damage, 0.3, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*25+Vector3.new(0,10,0),"rbxassetid://241837157", 0.2 ,Color3.new(1, 1, 1), "rbxassetid://1202656211", 1, 1)
					hitbox1:Destroy()
				end
			end
		end)
		--delay(.1,function()if hitbox1 then hitbox1:Destroy() end end)
end
 _G.func = function()
game.ReplicatedStorage.Jump:FireServer(BrickColor.new("Black"))
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Right Arm"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Right Arm"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Right Arm"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local hitbox2 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox2.CFrame = game.Players.LocalPlayer.Character["Left Arm"].CFrame
	hitbox2.Name = "hitbox"
	hitbox2.Anchored = false
	hitbox2.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox2)
	weld.Part0 = hitbox2
	weld.Part1 = game.Players.LocalPlayer.Character["Left Arm"]
	hitbox2.Size = game.Players.LocalPlayer.Character["Left Arm"].Size*1.5
	hitbox2.Massless = true
	hitbox2.Transparency = 1
	hitbox2.Color = Color3.new(0,0,0)
 
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if (hit.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				print(hit.Parent.Name)
				debounce = true
				delay(0,function()debounce = false end)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 8.255, 0.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.1 ,Color3.new(1, 1, 1), hitsounds[1], 1, 2)
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0,function()debounce = false end)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 8.255, 0.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.1 ,Color3.new(1, 1, 1), hitsounds[1], 1, 2)
			end
		end
	end)
	local touch2 = hitbox2.Touched:Connect(function(hit)
		if (hit.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				print(hit.Parent.Name)
				debounce = true
				delay(0,function()debounce = false end)
				--game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 12.8, 0.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-1+Vector3.new(0,0,0), 0.05, hitsounds[1], 1, 2)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 8.255, 0.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.1 ,Color3.new(1, 1, 1), hitsounds[1], 1, 2)
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0,function()debounce = false end)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 8.255, 0.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.1 ,Color3.new(1, 1, 1), hitsounds[1], 1, 2)
			end
		end
	end)
	barrage = not barrage
    if barrage then
		delay(0,function()
			while barrage do
				wait(0)
				if barrage then
					game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(.1,.1,.1),Vector3.new(math.random(500,1000)/1000,math.random(7,10)/10,math.random(500,1000)/1000),BrickColor.new("Black"))
				else
					break
				end
			end
		end)
                _G.track3:Play(.1, 1, 2.5)
 
 
	else
 
		_G.track3:Stop()
		wait(0.1)
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
			if v.Name == "hitbox" then
				v:Destroy()
			end
		end
    end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
end
 _G.strong = function()
 game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(5,6,5),Vector3.new(1,1,1),BrickColor.new("Black"))
 --game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(1,1,1),Vector3.new(1,1,1),BrickColor.new("Black"))
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Right Arm"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Right Arm"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Right Arm"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://218504594"
	--Anim.Looped = true
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(0.001,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 95, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*300+Vector3.new(0,50,0),"rbxassetid://241837157", 0.2 ,Color3.new(1, 1, 1), hitsounds[2], 1, 10)
				hitbox1:Destroy()
 
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0.001,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 95, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*300+Vector3.new(0,50,0),"rbxassetid://241837157", 0.2 ,Color3.new(1, 1, 1), hitsounds[2], 1, 10)
				hitbox1:Destroy()
			end
		end
	end)
    track:Play(.1, 1, 2)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	wait(0.4)
	if hitbox1 then
		hitbox1:Destroy()
	end
end
 
_G.lepunch = function()
game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(0.2,0.2,0.2),Vector3.new(0.2,0.2,0.2),BrickColor.new("Black"))
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Left Arm"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Left Arm"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Left Arm"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local Anim = Instance.new("Animation")
	Anim.AnimationId = id3
	--Anim.Looped = true
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(0.001,function()debounce = false end)
				--:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 12, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*10+Vector3.new(0,0,0),"rbxassetid://241837157", 0.03 ,Color3.new(1, 1, 1), hitsounds[1], 1, 1)
				hitbox1:Destroy()
 
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0.001,function()debounce = false end)
				--game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 12, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*10+Vector3.new(0,0,0),"rbxassetid://241837157", 0.03 ,Color3.new(1, 1, 1), hitsounds[1], 1, 1)
				hitbox1:Destroy()
			end
		end
	end)
	if id3 == "rbxassetid://4639554383" then
    	track:Play(.1, 1, 2.5)
	else
		track:Play(.1, 1, 1.5)
	end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	wait(0.5)
	if hitbox1 then
		hitbox1:Destroy()
	end
end
_G.hhh = false
 
_G.func2 = function()
--game.ReplicatedStorage.Jump:FireServer(BrickColor.new("Black"))
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"]
	hitbox1.Size = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local hitbox2 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox2.CFrame = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].CFrame
	hitbox2.Name = "hitbox"
	hitbox2.Anchored = false
	hitbox2.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox2)
	weld.Part0 = hitbox2
	weld.Part1 = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"]
	hitbox2.Size = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].Size*1.5
	hitbox2.Massless = true
	hitbox2.Transparency = 1
	hitbox2.Color = Color3.new(0,0,0)
 
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if (hit.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				print(hit.Parent.Name)
				debounce = true
				delay(0,function()debounce = false end)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 9.655, 1.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.4 ,Color3.new(1, 1, 0), "rbxassetid://1202656211", 1, 2)
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0,function()debounce = false end)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 9.655, 1.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.4 ,Color3.new(1, 1, 0), "rbxassetid://1202656211", 1, 2)
			end
		end
	end)
	local touch2 = hitbox2.Touched:Connect(function(hit)
		if (hit.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				print(hit.Parent.Name)
				debounce = true
				delay(0,function()debounce = false end)
				--game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 12.8, 0.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-1+Vector3.new(0,0,0), 0.05, hitsounds[1], 1, 2)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 9.655, 1.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.4 ,Color3.new(1, 1, 0), "rbxassetid://1202656211", 1, 2)
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0,function()debounce = false end)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 9.655, 1.8, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,0,0),"rbxassetid://241837157", 0.4 ,Color3.new(1, 1, 0), "rbxassetid://1202656211", 1, 2)
			end
		end
	end)
	barrage = not barrage
	game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],0.4)
	game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],0.4)
	game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],0.4)
    if barrage then
		--[[delay(0,function()
			while barrage do
				wait(0)
				if barrage then
					game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(.1,.1,.1),Vector3.new(math.random(500,1000)/10000,math.random(7,10)/100,math.random(500,1000)/10000),BrickColor.new("Black"))
				else
					break
				end
			end
		end)]]
                _G.track4:Play(.1, 1, 2)
 
 
	else
	game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],1)
	game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],1)
	game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],1)
		_G.track4:Stop()
		wait(0.1)
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
			if v.Name == "hitbox" then
				v:Destroy()
			end
		end
    end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
end
 
_G.strong2 = function()
	--if game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch") then
	--	game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch"):Play()
	--end
	game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(0.02,0.02,0.02),Vector3.new(0.02,0.02,0.02),game.Players.LocalPlayer.Character.Stand["Stand Right Arm"])
	 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
		 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
			 v.Anchored = false
		 end
	end
		local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
		hitbox1.CFrame = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].CFrame
		hitbox1.Name = "hitbox"
		hitbox1.Anchored = false
		hitbox1.CanCollide = false
		local weld = Instance.new("WeldConstraint",hitbox1)
		weld.Part0 = hitbox1
		game.Players.LocalPlayer.Character.Stand["Stand Head"].Transparency = 0.3
		game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],0.3)
		game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].Transparency = 0.3 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],0)
		weld.Part1 = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"]
		hitbox1.Size = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"]*.6
		hitbox1.Transparency = 1
		hitbox1.Color = Color3.new(0,0,0)
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://2876975825"
		--Anim.Looped = true
		local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		local touch1 = hitbox1.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
				if debounce == false then
					debounce = true
					print(hit.Parent.Name)
					delay(0.001,function()debounce = false end)
					game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
					game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 95, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*200+Vector3.new(0,80,0),"rbxassetid://241837157",1 ,Color3.new(1, 1, 0), "rbxassetid://1202656211", 1, 1)
					hitbox1:Destroy()
 
				end
			elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
				if debounce == false then
					debounce = true
					print(hit.Parent.Parent.Name)
					delay(0.001,function()debounce = false end)
					game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
					game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 95, 0.4, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*200+Vector3.new(0,80,0),"rbxassetid://241837157", 1 ,Color3.new(1, 1, 0), "rbxassetid://1202656211", 1, 1)
					hitbox1:Destroy()
				end
			end
		end)
		--if id3 == "rbxassetid://4639554383" then
	    	track:Play(.1, 1, 2)
		--else
			--track:Play(.1, 1, 1.5)
		--end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	local y = 1
	delay(0.4,function()game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],1)  game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],y)  end)
		wait(0.6)
		_G.hhh = not _G.hhh
		if hitbox1 then
			hitbox1:Destroy()
		end
end
 
_G.lepunch2 = function()
	--if game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch") then
	--	game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch"):Play()
	--end
	--game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(0.02,0.02,0.02),Vector3.new(0.02,0.02,0.02),BrickColor.new("Black"))
	 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
		 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
			 v.Anchored = false
		 end
	end
		local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
		if _G.hhh then hitbox1.CFrame = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].CFrame elseif not _G.hhh then hitbox1.CFrame = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].CFrame end
		hitbox1.Name = "hitbox"
		hitbox1.Anchored = false
		hitbox1.CanCollide = false
		local weld = Instance.new("WeldConstraint",hitbox1)
		weld.Part0 = hitbox1
		game.Players.LocalPlayer.Character.Stand["Stand Head"].Transparency = 0.3
		game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],0.3)
		if _G.hhh then game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].Transparency = 0.3 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],0) elseif not _G.hhh then game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].Transparency = 0.3 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],0) end
		if _G.hhh then weld.Part1 = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"] elseif not _G.hhh then weld.Part1 = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"] end
		if _G.hhh then hitbox1.Size = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].Size*1.5 elseif not _G.hhh then hitbox1.Size = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].Size*1.5 end		hitbox1.Massless = true
		hitbox1.Transparency = 1
		hitbox1.Color = Color3.new(0,0,0)
		local Anim = Instance.new("Animation")
		if _G.hhh then Anim.AnimationId = "rbxassetid://2876963057" elseif not _G.hhh then Anim.AnimationId = "rbxassetid://2876963877" end-- Anim.AnimationId
		--Anim.Looped = true
		local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		local touch1 = hitbox1.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
				if debounce == false then
					debounce = true
					print(hit.Parent.Name)
					delay(0.001,function()debounce = false end)
					--:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
					game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 16, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*20+Vector3.new(0,0,0),"rbxassetid://241837157", 0.3 ,Color3.new(1, 1, 0), hitsounds[1], 1, 1)
					hitbox1:Destroy()
 
				end
			elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
				if debounce == false then
					debounce = true
					print(hit.Parent.Parent.Name)
					delay(0.001,function()debounce = false end)
					--game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
					game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 16, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*20+Vector3.new(0,0,0),"rbxassetid://241837157", 0.3 ,Color3.new(1, 1, 0), hitsounds[1], 1, 1)
					hitbox1:Destroy()
				end
			end
		end)
		--if id3 == "rbxassetid://4639554383" then
	    	track:Play(.1, 1, 1.2)
		--else
			--track:Play(.1, 1, 1.5)
		--end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	local y = 0
	delay(0.3,function()game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],1) if _G.hhh then for i = 1,10 do wait(0) y = y+0.1  game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],y) end elseif not _G.hhh then for i = 1,10 do wait(0) y = y+0.1  game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],y) end end end)
		wait(0.4)
		_G.hhh = not _G.hhh
		if hitbox1 then
			hitbox1:Destroy()
		end
end
 
_G.pos = nil
--_G.connection = nil
_G.control = function()
grabbed = not grabbed
	--if game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch") then
	--	game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch"):Play()
	--end
	--game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(0.02,0.02,0.02),Vector3.new(0.02,0.02,0.02),BrickColor.new("Black"))
	 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
		 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
			 v.Anchored = false
		 end
	end
		local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
		if _G.hhh then hitbox1.CFrame = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].CFrame elseif not _G.hhh then hitbox1.CFrame = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].CFrame end
		hitbox1.Name = "hitbox"
		hitbox1.Anchored = false
		hitbox1.CanCollide = false
		local weld = Instance.new("WeldConstraint",hitbox1)
		weld.Part0 = hitbox1
		game.Players.LocalPlayer.Character.Stand["Stand Head"].Transparency = 0.3
		game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],0.3)
		if _G.hhh then game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].Transparency = 0.3 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],0) elseif not _G.hhh then game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].Transparency = 0.3 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],0) end
		if _G.hhh then weld.Part1 = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"] elseif not _G.hhh then weld.Part1 = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"] end
		if _G.hhh then hitbox1.Size = game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].Size*1.5 elseif not _G.hhh then hitbox1.Size = game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].Size*1.5 end		hitbox1.Massless = true
		hitbox1.Transparency = 1
		hitbox1.Color = Color3.new(0,0,0)
		local Anim = Instance.new("Animation")
		if _G.hhh then Anim.AnimationId = "rbxassetid://2876963057" elseif not _G.hhh then Anim.AnimationId = "rbxassetid://2876963877" end-- Anim.AnimationId
		--Anim.Looped = true
		local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				--[[_G.connection = Instance.new("Part",hit.Parent)
				_G.connection.CFrame = hit.Parent["HumanoidRootPart"].CFrame
				_G.connection.Name = "hitbox"
				_G.connection.Anchored = false
				_G.connection.CanCollide = false
				local weld = Instance.new("WeldConstraint",_G.connection)
				weld.Part0 = _G.connection
				weld.Part1 = hit.Parent["HumanoidRootPart"]
				_G.connection.Size = hit.Parent["HumanoidRootPart"].Size*2
				_G.connection.Massless = true
				_G.connection.Transparency = 1
				_G.connection.Color = Color3.new(0,0,0)
				_G.connection.Touched:Connect(function(hit2)
					if hit2.Parent:FindFirstChild("Humanoid") and hit2.Parent ~= hit.Parent then
						print(hit.Parent.Name.." hitted "..hit2.Parent.Name)
						game:GetService("ReplicatedStorage").Knock:FireServer(hit2.Parent.Humanoid, hit2.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
						game:GetService("ReplicatedStorage").Damage:FireServer(hit2.Parent.Humanoid, hit2.Parent.HumanoidRootPart.CFrame, (hit.Velocity*1.5).magnitude, 0.1, hit.Velocity*2 , "rbxassetid://241837157", 0, Color3.new(0, 0, 0), "rbxassetid://4137216950", 0, 0)
					elseif hit2.Parent.Parent:FindFirstChild("Humanoid") and hit2.Parent.Parent ~= hit.Parent then
						print(hit.Parent.Name.." hitted "..hit2.Parent.Parent.Name)
						game:GetService("ReplicatedStorage").Knock:FireServer(hit2.Parent.Parent.Humanoid, hit2.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
						game:GetService("ReplicatedStorage").Damage:FireServer(hit2.Parent.Parent.Humanoid, hit2.Parent.Parent.HumanoidRootPart.CFrame, (hit.Velocity*1.5).magnitude, 0.1, hit.Velocity*2 , "rbxassetid://241837157", 0, Color3.new(0, 0, 0), "rbxassetid://4137216950", 0, 0)
					end
				end)]]
				delay(0.1,function()debounce = false end)
				while grabbed do
					wait(0.01)
					_G.pos = mouse.Hit
					if grabbed then
						game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 0.01, 0.1,((_G.pos.p)-hit.Parent.HumanoidRootPart.Position)*1.4, "rbxassetid://241837157", 0, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 0)
						--game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 0.01, 0.1, ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position+game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*10)-hit.Parent.HumanoidRootPart.Position)*1.5, 0, hitsounds[1], 1, 0)
					else
						--_G.connection:Destroy()
						--game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 20, 0.05, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*50, 0, hitsounds[1], 1, 0)
						break
					end
				end
				hitbox1:Destroy()
			end
		end
		end)
		--if id3 == "rbxassetid://4639554383" then
	    	track:Play(.1, 1, 1.2)
		--else
			--track:Play(.1, 1, 1.5)
		--end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	local y = 0
	delay(0.3,function()game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],1) if _G.hhh then for i = 1,10 do wait(0) y = y+0.1  game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],y) end elseif not _G.hhh then for i = 1,10 do wait(0) y = y+0.1  game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],y) end end end)
		wait(0.4)
		_G.hhh = not _G.hhh
		if hitbox1 then
			hitbox1:Destroy()
		end
end
 
 
_G.kick2 = function()
	--if game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch") then
	--	game.Players.LocalPlayer.Character.Stand.StandHumanoidRooPart:FindFirstChild("Punch"):Play()
	--end
	game.ReplicatedStorage.StrongPunch:FireServer(Vector3.new(0.02,0.02,0.02),Vector3.new(0.02,0.02,0.02),game.Players.LocalPlayer.Character.Stand["Stand Right Leg"])
	 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
		 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
			 v.Anchored = false
		 end
	end
		game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],0.3)
		--game.Players.LocalPlayer.Character.Stand["Stand Right Leg"].Transparency = 0.3 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Leg"],0.3)
		game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],0.3)
		game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],0.3)
		_G.makehitbox(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],15)
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://3893841692"
		--Anim.Looped = true
		local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		--if id3 == "rbxassetid://4639554383" then
	    	track:Play(.1, 1, 2)
		--else
			--track:Play(.1, 1, 1.5)
		--end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	local y = 1
		--game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],1)  game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Leg"],y)  
		wait(0.1)
		_G.makehitbox(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],25)
		wait(0.1)
		_G.makehitbox(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],35)
		wait(0.1)
		_G.makehitbox(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],45)
		--_G.hhh = not _G.hhh
		delay(0.1,function() game.Players.LocalPlayer.Character.Stand["Stand Right Arm"].Transparency = 1 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Right Arm"],1)
		game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].Transparency = 1 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Left Arm"],1) game.Players.LocalPlayer.Character.Stand["Stand Left Arm"].Transparency = 1 game.ReplicatedStorage.Transparency:FireServer(game.Players.LocalPlayer.Character.Stand["Stand Head"],1) end)
 
end
 
_G.grab = function()
grabbed = not grabbed
--game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(0.2,0.2,0.2),Vector3.new(0.2,0.2,0.2),BrickColor.new("Black"))
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Left Arm"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Left Arm"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Left Arm"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local Anim = Instance.new("Animation")
	Anim.AnimationId = id3
	--Anim.Looped = true
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(1,function()debounce = false end)
				while grabbed do
					wait(0.01)
					if grabbed then
						game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 0.01, 0.1, ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position+game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*5)-hit.Parent.HumanoidRootPart.Position)*1, "rbxassetid://241837157", 0, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 0)
						--game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 0.01, 0.1, ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position+game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*10)-hit.Parent.HumanoidRootPart.Position)*1.5, 0, hitsounds[1], 1, 0)
					else
						--game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 20, 0.05, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*50, 0, hitsounds[1], 1, 0)
						break
					end
				end
				hitbox1:Destroy()
			end
		end
	end)
    if id3 == "rbxassetid://4639554383" then
    	track:Play(.1, 1, 2)
	else
		track:Play(.1, 1, 1)
	end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	wait(0.5)
	if hitbox1 then
		hitbox1:Destroy()
	end
end
 
_G.kick = function()
game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(1,2,1),Vector3.new(.2,.4,.2),BrickColor.new("Black"))
  for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Right Leg"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Right Leg"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Right Leg"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local Anim = Instance.new("Animation")
	Anim.AnimationId = id2
	--Anim.Looped = true
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(0.001,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 65, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*280+Vector3.new(0,250,0),"rbxassetid://241837157", 0.2 ,Color3.new(1, 1, 1), "rbxassetid://314390675", 1, 2)
				hitbox1:Destroy()
 
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0.001,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 65, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*125+Vector3.new(0,150,0),"rbxassetid://241837157", 0.2 ,Color3.new(1, 1, 1), "rbxassetid://314390675", 1, 2)
				hitbox1:Destroy()
			end
		end
	end)
    track:Play(.1, 1, 3)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	wait(0.3)
	if hitbox1 then
		hitbox1:Destroy()
	end
end
 
_G.freeze = function()
game.ReplicatedStorage.PlayerStrongPunch:FireServer(Vector3.new(.1,.1,.1),Vector3.new(1,1,1),BrickColor.new("Cyan"))
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Right Arm"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Right Arm"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Right Arm"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://3681052896"
	--Anim.Looped = true
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(0.001,function()debounce = false end)
				--game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 20, 29, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0.01+Vector3.new(0,0,0),"rbxassetid://241837157", 0.12 ,Color3.new(0, 0, 1), "rbxassetid://268249319", 1, 6)
				hitbox1:Destroy()
 
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0.001,function()debounce = false end)
				--game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 20, 29, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0.01+Vector3.new(0,0,0),"rbxassetid://241837157", 0.12 ,Color3.new(0, 0, 1), "rbxassetid://268249319", 1, 6)
				hitbox1:Destroy()
			end
		end
	end)
    track:Play(.1, 1, 4)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	wait(0.6)
	if hitbox1 then
		hitbox1:Destroy()
	end
end
 
_G.bonk = function()
game.ReplicatedStorage.PlayerStrongPunch2:FireServer(Vector3.new(0.1,0.1,0.1),Vector3.new(0.5,0.5,0.5),BrickColor.new("Black"))
 
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Right Arm"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Right Arm"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Right Arm"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://184574340"
	--Anim.Looped = true
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(0.001,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 25, 10, Vector3.new(0,-200,0),"rbxassetid://241837157", 0.8 ,Color3.new(1, 1, 1), hitsounds[4], 1, 50)
				hitbox1:Destroy()
 
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0.001,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 25, 10, Vector3.new(0,-200,0),"rbxassetid://241837157", 0.8 ,Color3.new(1, 1, 1), hitsounds[4], 1, 50)
				hitbox1:Destroy()
			end
		end
	end)
    track:Play(.1, 1, 7)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	wait(0.3)
	if hitbox1 then
		hitbox1:Destroy()
	end
end
 
_G.spin = function()
	game.ReplicatedStorage.Jump:FireServer(BrickColor.new("Black"))
 
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 38
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Torso"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Torso"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Torso"].Size*1.5
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(0.4,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 25, 0.1, Vector3.new(0,150,0), 0.4, hitsounds[5], 1, 50)
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(0.4,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 25, 0.1, Vector3.new(0,150,0), 0.4, hitsounds[5], 1, 50)
			end
		end
	end)
	local e = true
	delay(0,function()
		while e == true do
			wait(0)
			if e == true then
				if _G.track2.IsPlaying == false then
		    	_G.track2:Play(.1, 5, 3)
				end	
			else
			break
			end
		end	
	end)
	wait(2)
	e = false
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	if hitbox1 then
		hitbox1:Destroy()
	end
end
 
_G.backstab = function()
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://181525546"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
 
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 2
	local hitbox1 = Instance.new("Part",game.Players.LocalPlayer.Character)
	hitbox1.CFrame = game.Players.LocalPlayer.Character["Torso"].CFrame
	hitbox1.Name = "hitbox"
	hitbox1.Anchored = false
	hitbox1.CanCollide = false
	local weld = Instance.new("WeldConstraint",hitbox1)
	weld.Part0 = hitbox1
	weld.Part1 = game.Players.LocalPlayer.Character["Torso"]
	hitbox1.Size = game.Players.LocalPlayer.Character["Torso"].Size+Vector3.new(0,6,0)
	hitbox1.Massless = true
	hitbox1.Transparency = 1
	hitbox1.Color = Color3.new(0,0,0)
	local touch1 = hitbox1.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= game.Players.LocalPlayer.Name then
			if debounce == false then
				debounce = true
				print(hit.Parent.Name)
				delay(1,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Humanoid, hit.Parent.HumanoidRootPart.CFrame, 75, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-200,"rbxassetid://241837157", 0.8 ,Color3.new(1, 1, 1), hitsounds[5], 1, 50)
			end
		elseif (hit.Parent.Parent:FindFirstChild("Humanoid"))and hit.Parent.Parent.Name ~= game.Players.LocalPlayer.Name and not hit.Parent:IsA("Accessory") then
			if debounce == false then
				debounce = true
				print(hit.Parent.Parent.Name)
				delay(1,function()debounce = false end)
				game:GetService("ReplicatedStorage").Knock:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 1, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), "rbxassetid://241837157", 1, Color3.new(1, 0, 0), "rbxassetid://4137216950", 0.8, 100)
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Parent.Parent.Humanoid, hit.Parent.Parent.HumanoidRootPart.CFrame, 75, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*-200,"rbxassetid://241837157", 0.8 ,Color3.new(1, 1, 1), hitsounds[5], 1, 50)
			end
		end
	end)
	track:Play(.1, 5, 10)
	wait(0.4)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	if hitbox1 then
		hitbox1:Destroy()
	end
end
 
 
_G.destroy = function()
	game.ReplicatedStorage.Jump:FireServer(BrickColor.new("Black"))
 
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do
	 if v:IsA("Part" or "MeshPart" or "UnionOperation") then
		 v.Anchored = false
	 end
end
 
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://184574340"
	--Anim.Looped = true
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
 
    track:Play(.1, 1, 0.1)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	wait(10)
	track:Stop()
	for i,hit in ipairs(game.Players:GetChildren())do
		if hit.Character:FindFirstChild("Humanoid") and hit.Character:FindFirstChild("HumanoidRootPart") and hit.Character.Name ~= game.Players.LocalPlayer.Name then
				print(hit.Character.Name)
 
				game:GetService("ReplicatedStorage").Damage:FireServer(hit.Character:FindFirstChild("Humanoid"), hit.Character.HumanoidRootPart.CFrame, 95, 0.1, Vector3.new(0,500,0),"rbxassetid://241837157", 5 ,Color3.new(1, 1, 1), "rbxassetid://1839997944", 1, 100)
 
		end
	end
end
 
_G.nou = function()
	nou = not nou
	--game:GetService("ReplicatedStorage").Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, 10, 1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1+Vector3.new(0,1,0), 0.01, "rbxassetid://1233", 0.8, 100)
				if nou == true then
		game:GetService("ReplicatedStorage").Heal:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, game.Players.LocalPlayer.Character.Humanoid.MaxHealth+game.Players.LocalPlayer.Character.Humanoid.Health, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*100+Vector3.new(0,20,0), "rbxassetid://241837157", 1, Color3.new(0, 255, 0), "rbxassetid://4137216950", 1, 0)
		game:GetService("ReplicatedStorage").RTZ:FireServer(
			true
		)
 
		game:GetService("ReplicatedStorage").Deflect:FireServer(
			true
		)
		game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
			Text = "no u = true"; --The chat message
			Color = Color3.fromRGB(0, 255, 255); --Chat message color, defaults to white
			Font = Enum.Font.SourceSansBold; --Chat message font, defaults to SourceSansBold
			TextSize = 18 --Text size, defaults to 18
		})
	else
		game:GetService("ReplicatedStorage").Heal:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, game.Players.LocalPlayer.Character.Humanoid.MaxHealth+game.Players.LocalPlayer.Character.Humanoid.Health, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*100+Vector3.new(0,20,0), "rbxassetid://241837157", 1, Color3.new(0, 255, 0), "rbxassetid://4137216950", 1, 0)
		game:GetService("ReplicatedStorage").RTZ:FireServer(
			false
		)
 
		game:GetService("ReplicatedStorage").Deflect:FireServer(
			false
		)
		game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
			Text = "no u = false"; --The chat message
			Color = Color3.fromRGB(0, 255, 255); --Chat message color, defaults to white
			Font = Enum.Font.SourceSansBold; --Chat message font, defaults to SourceSansBold
			TextSize = 18 --Text size, defaults to 18
		})
	end
end
stand = 0
 
_G.freezeall = function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
	local x = 0
	local y = -1
	local z = 0
	for i = 1,80 do
		wait(0)
		z = z + 0.1
		if z <= 1 then
			x = x - 0.1
			y = y + 0.1
		elseif z <= 2 then
			x = x + 0.1
			y = y + 0.1
		elseif z <= 3 then
			x = x + 0.1
			y = y - 0.1
		elseif z <= 4 then
			x = x - 0.1
			y = y - 0.1
		end
		if z >= 5 then
		x = 0
		y = -1
		z = 0
		end
		local part = Instance.new("Part",workspace)
		part.Anchored = true
		part.Size = Vector3.new(1,1,1)
		part.CanCollide = false
		part.Transparency = 1
		game.Debris:AddItem(part,0.1)
		part.Position = game.Players.LocalPlayer.Character.Torso.Position+game.Players.LocalPlayer.Character.Torso.CFrame.LookVector*(x*10)+game.Players.LocalPlayer.Character.Torso.CFrame.RightVector*(y*10)
		game:GetService("ReplicatedStorage").Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid,part.CFrame, 0.01, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0+Vector3.new(0,0,0),"rbxassetid://241837157", 1.5 ,Color3.new(1, 0, 0), "rbxassetid://1839997944", 0.8, 1)
		local part = Instance.new("Part",workspace)
		part.Anchored = true
		part.Size = Vector3.new(1,1,1)
		part.CanCollide = false
		part.Transparency = 1
		game.Debris:AddItem(part,0.1)
		part.Position = game.Players.LocalPlayer.Character.Torso.Position+game.Players.LocalPlayer.Character.Torso.CFrame.UpVector*((-x*10)/2)+game.Players.LocalPlayer.Character.Torso.CFrame.RightVector*(-y*10)
		game:GetService("ReplicatedStorage").Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid,part.CFrame, 0.01, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0+Vector3.new(0,0,0),"rbxassetid://241837157", 1.5 ,Color3.new(1, 0, 0), "rbxassetid://1839997944", 0.8, 1)
	end
	wait(0.2)
	for i = 1,40 do
		--wait(0)
		z = z + 0.1
		if z <= 1 then
			x = x - 0.1
			y = y + 0.1
		elseif z <= 2 then
			x = x + 0.1
			y = y + 0.1
		elseif z <= 3 then
			x = x + 0.1
			y = y - 0.1
		elseif z <= 4 then
			x = x - 0.1
			y = y - 0.1
		end
		if z >= 5 then
		x = 0
		y = -1
		z = 0
		end
		local part = Instance.new("Part",workspace)
		part.Anchored = true
		part.Size = Vector3.new(1,1,1)
		part.CanCollide = false
		part.Transparency = 1
		game.Debris:AddItem(part,0.1)
		part.Position = game.Players.LocalPlayer.Character.Torso.Position+game.Players.LocalPlayer.Character.Torso.CFrame.LookVector*(x*10)+game.Players.LocalPlayer.Character.Torso.CFrame.RightVector*(y*10)
		game:GetService("ReplicatedStorage").Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid,part.CFrame, 0.01, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0+Vector3.new(0,0,0),"rbxassetid://241837157", 1.5 ,Color3.new(1, 0, 0), "rbxassetid://1839997944", 0.8, 1)
		local part = Instance.new("Part",workspace)
		part.Anchored = true
		part.Size = Vector3.new(1,1,1)
		part.CanCollide = false
		part.Transparency = 1
		game.Debris:AddItem(part,0.1)
		part.Position = game.Players.LocalPlayer.Character.Torso.Position+game.Players.LocalPlayer.Character.Torso.CFrame.UpVector*((-x*10)/2)+game.Players.LocalPlayer.Character.Torso.CFrame.RightVector*(-y*10)
		game:GetService("ReplicatedStorage").Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid,part.CFrame, 0.01, 0.1, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0+Vector3.new(0,0,0),"rbxassetid://241837157", 1.5 ,Color3.new(1, 0, 0), "rbxassetid://1839997944", 0.8, 1)
	end
	wait(1)
	for i,v in pairs(game.Players:GetChildren())do
		if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Block") and v.Name ~= game.Players.LocalPlayer.Name then
			game:GetService("ReplicatedStorage").Damage:FireServer(v.Character.Humanoid,game.Players.LocalPlayer.Character.Torso.CFrame, 10, 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0+Vector3.new(0,0.01,0),"rbxassetid://nil", 1,Color3.new(0,0,0), "rbxassetid://1839997944", 1, 1)
		end
	end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
 
end
 
local mouse = game.Players.LocalPlayer:GetMouse()
	_G.contc = mouse.KeyDown:Connect(function(key)
		if key == 'b' then
			if stand == 0 then
				_G.func()
			else
				_G.func2()
			end
		elseif key == 'j' then
			if stand == 0 then
				_G.strong()
			else
				_G.strong2()
			end
		elseif key == 'r' then
			if stand == 0 then
				_G.kick()
			else
				_G.kick2()
			end
		elseif key == 'e' then
			if stand == 0 then
				_G.lepunch()
			else
				_G.lepunch2()
			end
		elseif key == 't' then
			if stand == 0 then
				_G.grab()
			else
				_G.control()
			end
		elseif key == 'l' then
			--if stand == 0 then
				_G.freeze()
			--end
		elseif key == 'k' then
		--	if stand == 0 then
				_G.nou()
		--	end
		elseif key == 'h' then
			--if stand == 0 then
				_G.bonk()
			--end
		elseif key == '=' then
			if stand == 0 then
				_G.destroy()
			end
		elseif key == '-' then
			_G.spin()
			if stand == 0 then
				stand = 1
			else
				stand = 0
			end
		elseif key == 'x' then
			--if stand == 0 then
				_G.backstab()
			--end
		elseif key == 'p' then
			--if stand == 0 then
				game.Players.LocalPlayer.Character:MoveTo(mouse.Hit.p)
			--end
		elseif key == "f" then
			_G.freezeall()
		end
 
	end)
 
	print('h') -- 4774749466