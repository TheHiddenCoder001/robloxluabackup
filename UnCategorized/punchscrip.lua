--Discord:gabkiu#9778, hire me for custom scripts
-- V2 FE KILL Punch Made by gabkiu Discord:gabkiu#9778, updated with the UI lib that I made.
local Classes = loadstring(game:HttpGet('https://pastebin.com/raw/2muvijsJ',true))()

local Tab = Classes.Tab(game.CoreGui)

local Enabled_Box = Classes.Checkbox(Tab,true)
local Anim_Box = Classes.Checkbox(Tab,true)
local Kill_Box  = Classes.Checkbox(Tab,true)
local Power_Label = Classes.Label(Tab)
local Power_Slider = Classes.Slider(Tab)
local Punch_Text = Classes.TextBox(Tab)

local Keys = {
	Punch = "f",
	Previous_Mode = "z",
	Next_Mode = "x",
}

Tab.Titulo.Text = "Punch UI v2"

Enabled_Box.Titulo.Text = "Punch Enabled"
Anim_Box.Titulo.Text = "Animations"
Kill_Box.Titulo.Text = "Kill Cam"

Power_Slider:SetarMaximo(50000)
Power_Slider:SetarIntervalo(10)
Power_Slider:SetarPadrao(30000)

Punch_Text.Titulo.Text = "Punch Key"
Punch_Text.Box.Text = Keys.Punch
Punch_Text.Mudou = function(Valor)
    Punch_Key = Valor
end
Power_Slider.Mudou = function(Valor)
	local Txt = "Power: " .. Valor
	if Valor >= 49000 then
		Txt = "Power: INF"
	end
	Power_Label.Text = Txt
end
Power_Label.Text = "Power: " .. 25000
Punch_Text.Box:GetPropertyChangedSignal("Text"):Connect(function()
    wait()
    local txt = Punch_Text.Box.Text
    if txt:len() > 1 then
        Punch_Text.Box.Text = txt:sub(2,2)
    end
   Keys.Punch = Punch_Text.Box.Text:lower()
end)
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local StarterGui = game:GetService("StarterGui")
local Character = Player.Character or workspace:WaitForChild(Player.Name)
local CAM = false
local GuiHidden = false
local PunchingEnabled = true
local AnimationsId = {
	R6 = "rbxassetid://204062532",
	R15 = "rbxassetid://846744780"
}
local function NewAnimation(ID)
	local Animation = Instance.new("Animation")
	Animation.AnimationId = ID
	return Animation
end
local R15Animation = NewAnimation(AnimationsId.R15)
local R6Animation = NewAnimation(AnimationsId.R6)

local function GetAnimation(Humanoid)
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		return Humanoid:LoadAnimation(R15Animation)
	else
		return Humanoid:LoadAnimation(R6Animation)
	end
end
local keysf = {
	"Push","Fling","Kill","Void"
}
local function UpdateText()
	MLabel.Text = keysf[Current_Mode]
end
local CamIN = false
local function DoCam(Part)
	CamIN = true
	local Camera = workspace.CurrentCamera
	Camera.CameraSubject = Part
	wait(1.85)
	Camera.CameraSubject = Player.Character:FindFirstChild("Head")
	CamIN = false
end
local Punching = false
local function Punch()
    if not Enabled_Box.Estado then
        return
    end
    if Punching then
        return  
    end
	Punching = true
	local Humanoid = Character.Humanoid
	local RootPart = Character.PrimaryPart
    Humanoid:UnequipTools()
    Player.Character.Humanoid:ChangeState(11)
    wait()
	local Tool = Player.Backpack:FindFirstChildOfClass("Tool")
    if Tool == nil then   
        local Args = {
            Title = "PUNCH SCRIPT",
            Text = "ERROR, You need a tool.",
            Icon = "http://www.roblox.com/asset/?id=41363725",
            Duration = 7,
        }
        StarterGui:SetCore("SendNotification",Args)
        return
    end
	local AnimationId
	local AnimationTrack = GetAnimation(Humanoid)
	if Anim_Box.Estado then
		AnimationTrack:Play()
    end           
    wait()
    Player.Character.Humanoid:ChangeState(11)
	local OriginalGrip = Tool.GripPos
	Tool.Parent = Player.Character
    local Power = Power_Slider.Valor
    local PowerY = Power/2
    if Power == 50000 then
        Power = math.huge
        PowerY = math.huge
    end		
	Tool.GripPos = Vector3.new(Power,PowerY,Power)
	wait(0.35)

	Tool.GripPos = OriginalGrip	
	game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
	wait()
	Punching = false
end
local function Next_Mode()
	local Next = Current_Mode + 1
	if Next > #Power_Modes then
		Current_Mode = 1
	else
		Current_Mode = Next
	end
	UpdateText()
end
local DownKeys = {}
local function KeyDown(Key)
	if Key == Keys.Punch then
		Punch()
	end
end
Mouse.KeyDown:Connect(KeyDown)
local function hand(what)
	if game:GetService("Players"):GetPlayerFromCharacter(what.Parent) then
			if Kill_Box.Estado and Punching and not CamIN then
				DoCam(what.Parent:FindFirstChild("Head") or what)
			end
	end
end
Player.CharacterAdded:Connect(function()
	Character = Player.Character
	wait(1)
	local Hand = Character:FindFirstChild("RightHand") or Character:FindFirstChild("Right Arm")
	if Hand then
		Hand.Touched:Connect(hand)
	end
end)
wait()
local Hand = Character:FindFirstChild("RightHand") or Character:FindFirstChild("Right Arm")
if Hand then
	Hand.Touched:Connect(hand)
end
game:GetService("RunService").RenderStepped:Connect(function()
    if Punching then
        Player.Character.Humanoid:ChangeState(11)
    end
end)
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "SCRIPT",Text = "By gabkiu (gabkiu#9778) press J to hide!",Duration = 15})
Character.Animate.toolnone.ToolNoneAnim.AnimationId = "000000"