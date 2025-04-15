-- 1254GUI by 1254hdg - Local Phone GUI Script
local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"
gui.ResetOnSpawn = false

-- Gizli mod için başlangıçta görünmez
gui.Enabled = false

-- Gizli mod: Z tuşuna basınca GUI aç/kapat
UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Z then
		gui.Enabled = not gui.Enabled
	end
end)

-- Ana çerçeve
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 400)
frame.Position = UDim2.new(0.5, -160, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- RGB Başlık
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "1254GUI by 1254hdg"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.BackgroundTransparency = 1

-- RGB animasyonu
task.spawn(function()
	while true do
		local r = math.random()
		local g = math.random()
		local b = math.random()
		title.TextColor3 = Color3.new(r, g, b)
		wait(0.1)
	end
end)

-- Buton fonksiyonu
local function createButton(text, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, (#frame:GetChildren() - 1) * 45 + 10)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(callback)
end

-- Jumpscare
createButton("Jumpscare", function()
	local img = Instance.new("ImageLabel", gui)
	img.Size = UDim2.new(1, 0, 1, 0)
	img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=4974544635&width=420&height=420&format=png"
	img.BackgroundTransparency = 1
	local sound = Instance.new("Sound", img)
	sound.SoundId = "rbxassetid://5410086218"
	sound.Volume = 1
	sound:Play()
	wait(2)
	img:Destroy()
end)

-- Avatar Spam
createButton("Avatar Spam", function()
	for i = 1, 10 do
		local img = Instance.new("ImageLabel", gui)
		img.Size = UDim2.new(0, 100, 0, 100)
		img.Position = UDim2.new(math.random(), 0, math.random(), 0)
		img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=4974544635&width=420&height=420&format=png"
		img.BackgroundTransparency = 1
		game.Debris:AddItem(img, 2)
	end
end)

-- Fly
createButton("Fly", function()
	local bp = Instance.new("BodyPosition", char.PrimaryPart)
	bp.MaxForce = Vector3.new(100000, 100000, 100000)
	bp.Position = char.PrimaryPart.Position
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
			bp.Position = char.PrimaryPart.Position + Vector3.new(0, 50, 0)
		end
	end)
end)

-- Speed
createButton("Speed Boost", function()
	humanoid.WalkSpeed = 100
end)

-- Beleş Para (Sahte gösterim)
createButton("Beleş Para", function()
	local coins = Instance.new("TextLabel", gui)
	coins.Size = UDim2.new(0, 200, 0, 50)
	coins.Position = UDim2.new(0.5, -100, 0, 0)
	coins.Text = "Money: 999,999,999"
	coins.TextScaled = true
	coins.TextColor3 = Color3.new(1, 1, 0)
	coins.BackgroundTransparency = 1
	game.Debris:AddItem(coins, 5)
end)

-- Flip Screen
createButton("Flip Screen", function()
	local cam = workspace.CurrentCamera
	cam.CFrame = cam.CFrame * CFrame.Angles(0, 0, math.rad(180))
end)

-- Play Music
createButton("Play Music", function()
	local s = Instance.new("Sound", player:WaitForChild("PlayerGui"))
	s.SoundId = "rbxassetid://142376088"
	s.Volume = 1
	s:Play()
end)
