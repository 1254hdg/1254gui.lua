-- 1254GUI by 1254hdg
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"
gui.ResetOnSpawn = false

-- Gizli Mod Tuşu (Mobil için bir buton)
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 120, 0, 40)
openBtn.Position = UDim2.new(0, 10, 0.9, -50)
openBtn.Text = "Open 1254GUI"
openBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
openBtn.TextColor3 = Color3.new(0, 0, 0)

-- Ana GUI Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 400)
frame.Position = UDim2.new(0.5, -160, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false
frame.Parent = gui

-- Başlık
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "1254GUI by 1254hdg"
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true

-- RGB Efekti
spawn(function()
	while true do
		for hue = 0, 1, 0.01 do
			title.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
			wait(0.05)
		end
	end
end)

-- Buton Oluşturucu
local function createButton(text, y, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Position = UDim2.new(0.05, 0, 0, y)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(callback)
end

-- Özellikler
createButton("Jumpscare", 50, function()
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

createButton("Fake Ban", 90, function()
	local ban = Instance.new("TextLabel", gui)
	ban.Size = UDim2.new(1, 0, 1, 0)
	ban.BackgroundColor3 = Color3.new(0, 0, 0)
	ban.Text = "You are permanently banned from this game.\nReason: 1254GUI detected."
	ban.TextColor3 = Color3.new(1, 0, 0)
	ban.TextScaled = true
	wait(3)
	ban:Destroy()
end)

createButton("Fly", 130, function()
	local char = player.Character
	if char then
		char.HumanoidRootPart.Anchored = not char.HumanoidRootPart.Anchored
	end
end)

createButton("Speed", 170, function()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then
		hum.WalkSpeed = 100
	end
end)

createButton("Beleş Para", 210, function()
	local cash = Instance.new("BillboardGui", player.Character.Head)
	cash.Size = UDim2.new(0, 100, 0, 50)
	cash.AlwaysOnTop = true
	local label = Instance.new("TextLabel", cash)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = "+1000000$"
	label.TextColor3 = Color3.new(0, 1, 0)
	wait(3)
	cash:Destroy()
end)

createButton("Play Music", 250, function()
	local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
	sound.SoundId = "rbxassetid://142376088" -- Beğendiğin şarkı
	sound.Volume = 1
	sound.Looped = false
	sound:Play()
end)

-- Avatar Spam
createButton("Avatar Spam", 290, function()
	for i = 1, 10 do
		local img = Instance.new("ImageLabel", gui)
		img.Size = UDim2.new(0, 100, 0, 100)
		img.Position = UDim2.new(math.random(), 0, math.random(), 0)
		img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=4974544635&width=420&height=420&format=png"
		img.BackgroundTransparency = 1
		game:GetService("Debris"):AddItem(img, 2)
	end
end)

-- Aç-Kapat Butonu
openBtn.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)
