-- 1254GUI v1.3 - Girişte Müzik Oynatmalı
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"
gui.ResetOnSpawn = false

-- Giriş müziği
local girişMüzik = Instance.new("Sound", gui)
girişMüzik.SoundId = "rbxassetid://142376088"
girişMüzik.Volume = 1
girişMüzik.Looped = false
girişMüzik:Play()

-- GUI Başlık
local title = Instance.new("TextLabel", gui)
title.Size = UDim2.new(0, 300, 0, 40)
title.Position = UDim2.new(0.5, -150, 0.1, 0)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.Text = "1254GUI"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true

-- Ana Panel
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.1, 50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

-- Buton oluşturma fonksiyonu
local function createButton(text, yPos, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, yPos)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(callback)
end

-- Özellikler
createButton("Jumpscare", 10, function()
	local img = Instance.new("ImageLabel", gui)
	img.Size = UDim2.new(0, 0, 0, 0)
	img.Position = UDim2.new(0.5, 0, 0.5, 0)
	img.AnchorPoint = Vector2.new(0.5, 0.5)
	img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=4974544635&width=420&height=420&format=png"
	img.BackgroundTransparency = 1
	img.ZIndex = 10

	local sound = Instance.new("Sound", img)
	sound.SoundId = "rbxassetid://5410086218"
	sound.Volume = 1
	sound:Play()

	game:GetService("TweenService"):Create(img, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {Size = UDim2.new(1, 0, 1, 0)}):Play()
	wait(2)
	img:Destroy()
end)

createButton("Fly", 50, function()
	local hrp = char:WaitForChild("HumanoidRootPart")
	local bv = Instance.new("BodyVelocity", hrp)
	bv.Velocity = Vector3.new(0, 0, 0)
	bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	game:GetService("UserInputService").InputBegan:Connect(function(i)
		if i.KeyCode == Enum.KeyCode.Space then
			bv.Velocity = Vector3.new(0, 50, 0)
		end
	end)
end)

createButton("Speed", 90, function()
	char:WaitForChild("Humanoid").WalkSpeed = 100
end)

createButton("Beleş Para", 130, function()
	local lbl = Instance.new("TextLabel", gui)
	lbl.Size = UDim2.new(0, 200, 0, 50)
	lbl.Position = UDim2.new(0.5, -100, 0.5, -25)
	lbl.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	lbl.Text = "+1000000$"
	lbl.TextColor3 = Color3.new(0, 0, 0)
	lbl.TextScaled = true
	game:GetService("TweenService"):Create(lbl, TweenInfo.new(0.5), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
	wait(2)
	lbl:Destroy()
end)

createButton("Gizli Mod", 170, function()
	frame.Visible = not frame.Visible
end)

-- RGB Efekti
spawn(function()
	while wait(0.1) do
		frame.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
	end
end)
