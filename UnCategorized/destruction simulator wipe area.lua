local function owo(model)
a = model:GetChildren()
for i = 1, #a do
if a[i]:IsA("Part") then
p = a[i]
game:GetService("ReplicatedStorage").Remotes.sellBricks:FireServer()
local A_1 = os.time()--how about next time you get a "remote key" that can handle the neutron style
local A_2 = game.Players.LocalPlayer.Backpack.Bomb.Stats
local A_3 = p.Position
local Event = game:GetService("ReplicatedStorage").Remotes.explodeBomb
Event:FireServer(A_1, A_2, A_3)
game.RunService.Heartbeat:Wait()
end
end
end
for i, v in pairs(workspace.Areas[game.Players.LocalPlayer.CurrentArea.Value]:GetChildren()) do
if v:IsA("Model") then
owo(v)
end
end