-- 1254GUI by 1254hdg (Mobil Uyumlu)
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"
gui.ResetOnSpawn = false

-- Gizli Mod: GUI 'G' tuşu ile aç/kapanır
local UIS = game:GetService("UserInputService")
gui.Enabled = false
UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.G then
		gui.Enabled = not gui.Enabled
	end
end)

-- Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 380)
frame.Position = UDim2.new(0.5, -160, 0.5, -190)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- RGB Başlık
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "1254GUI by 1254hdg"
title.TextScaled = true
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold

-- RGB efekti
spawn(function()
	local hue = 0
	while true do
		hue = (hue + 0.01) % 1
		title.TextColor3 = Color3.fromHSV(hue, 1, 1)
		wait(0.05)
	end
end)

-- Buton Fonksiyonu
local yOffset = 45
local function createButton(name, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, yOffset)
	yOffset = yOffset + 35
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(callback)
end

-- Fonksiyonlar
createButton("Fly", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/1254hdg/flyspeed/main/fly.lua"))()
end)

createButton("Speed", function()
	player.Character.Humanoid.WalkSpeed = 100
end)

createButton("Beleş Para", function()
	local leader = player:FindFirstChild("leaderstats")
	if leader then
		for _, stat in pairs(leader:GetChildren()) do
			if stat:IsA("IntValue") then
				stat.Value = stat.Value + 999999
			end
		end
	end
end)

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

createButton("Müzik Oynat", function()
	local s = Instance.new("Sound", gui)
	s.SoundId = "rbxassetid://142376088"
	s.Volume = 1
	s.Looped = false
	s:Play()
end)

createButton("Avatarımı Herkese Uygula", function()
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player and plr.Character then
			for _, part in pairs(plr.Character:GetChildren()) do
				if part:IsA("Accessory") or part:IsA("Shirt") or part:IsA("Pants") or part:IsA("BodyColors") then
					part:Destroy()
				end
			end

			local cloneChar = player.Character:Clone()
			for _, item in pairs(cloneChar:GetChildren()) do
				if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") or item:IsA("BodyColors") then
					item:Clone().Parent = plr.Character
				end
			end
		end
	end
end)
