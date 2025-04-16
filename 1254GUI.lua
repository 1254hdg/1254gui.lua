-- 1254GUI by 1254hdg (Mobil Uyumlu ve Gelişmiş)
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"
gui.ResetOnSpawn = false

-- Gizli Mod: G tuşu ile aç/kapat
local UIS = game:GetService("UserInputService")
gui.Enabled = false
UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.G then
		gui.Enabled = not gui.Enabled
	end
end)

-- Loading
local loading = Instance.new("TextLabel", gui)
loading.Size = UDim2.new(1, 0, 1, 0)
loading.BackgroundColor3 = Color3.new(0, 0, 0)
loading.Text = "1254GUI Loading..."
loading.TextColor3 = Color3.new(1, 1, 1)
loading.TextScaled = true
wait(2)
loading:Destroy()

-- Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 420)
frame.Position = UDim2.new(0.5, -160, 0.5, -210)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Başlık (RGB)
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "1254GUI by 1254hdg"
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

spawn(function()
	local hue = 0
	while true do
		hue = (hue + 0.01) % 1
		title.TextColor3 = Color3.fromHSV(hue, 1, 1)
		wait(0.05)
	end
end)

-- Buton Fonksiyonu
local function createButton(name, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, (#frame:GetChildren() - 1) * 35)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(callback)
end

-- Fly
createButton("Fly", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/1254hdg/flyspeed/main/fly.lua"))()
end)

-- Speed
createButton("Speed", function()
	player.Character.Humanoid.WalkSpeed = 100
end)

-- Beleş Para
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

-- Müzik
createButton("Müzik Oynat", function()
	local s = Instance.new("Sound", gui)
	s.SoundId = "rbxassetid://142376088" -- Sevdiğin şarkı
	s.Volume = 1
	s.Looped = false
	s:Play()
end)

-- Avatar Spam (Sadece Senin Ekranında)
createButton("Avatar Herkese", function()
	for _, v in pairs(game.Players:GetPlayers()) do
		if v.Character and v.Character:FindFirstChild("HumanoidDescription") then
			local desc = Instance.new("HumanoidDescription")
			desc:ApplyDescription(player.Character.Humanoid:GetAppliedDescription())
			v.Character.Humanoid:ApplyDescription(desc)
		end
	end
end)
