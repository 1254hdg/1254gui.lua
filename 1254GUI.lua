local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remotes = {
	Jumpscare = ReplicatedStorage:WaitForChild("Jumpscare"),
	FakeBan = ReplicatedStorage:WaitForChild("FakeBan"),
	Teleport = ReplicatedStorage:WaitForChild("Teleport"),
	FlipScreen = ReplicatedStorage:WaitForChild("FlipScreen"),
	PlayMusic = ReplicatedStorage:WaitForChild("PlayMusic")
}

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 300)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

local buttons = {
	{"Jumpscare", remotes.Jumpscare},
	{"Fake Ban", remotes.FakeBan},
	{"Flip Screen", remotes.FlipScreen},
	{"Teleport Out", remotes.Teleport},
	{"Play Music", remotes.PlayMusic}
}

for i, data in ipairs(buttons) do
	local name, remote = data[1], data[2]
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, (i - 1) * 35 + 10)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.MouseButton1Click:Connect(function()
		if name == "Play Music" then
			remote:FireServer("rbxassetid://142376088")
		else
			remote:FireServer()
		end
	end)
end

-- Avatarla Jumpscare
remotes.Jumpscare.OnClientEvent:Connect(function()
	local img = Instance.new("ImageLabel", gui)
	img.Size = UDim2.new(1, 0, 1, 0)
	img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=1000296817&width=420&height=420&format=png"
	img.BackgroundTransparency = 1
	local sound = Instance.new("Sound", img)
	sound.SoundId = "rbxassetid://5410086218"
	sound.Volume = 1
	sound:Play()
	wait(2)
	img:Destroy()
end)

remotes.FakeBan.OnClientEvent:Connect(function()
	local banFrame = Instance.new("Frame", gui)
	banFrame.Size = UDim2.new(1, 0, 1, 0)
	banFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	local banText = Instance.new("TextLabel", banFrame)
	banText.Size = UDim2.new(1, 0, 1, 0)
	banText.Text = "You are permanently banned from this game.\nReason: 1254GUI detected."
	banText.TextColor3 = Color3.new(1, 0, 0)
	banText.TextScaled = true
end)

remotes.FlipScreen.OnClientEvent:Connect(function()
	local camera = game.Workspace.CurrentCamera
	camera.CFrame = camera.CFrame * CFrame.Angles(0, 0, math.rad(180))
end)

remotes.PlayMusic.OnClientEvent:Connect(function(soundId)
	local s = Instance.new("Sound", player:WaitForChild("PlayerGui"))
	s.SoundId = soundId
	s.Volume = 1
	s.Looped = false
	s:Play()
end)

