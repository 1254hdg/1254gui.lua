-- 1254GUI by Özgür - Delta Uyumludur

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local guiVisible = false

-- GUI Oluştur
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "1254GUI"
gui.ResetOnSpawn = false
gui.Enabled = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0.5, -125, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- RGB Başlık
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "1254GUI"
title.TextScaled = true
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold

task.spawn(function()
	while true do
		title.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
		wait(0.1)
	end
end)

-- Buton Oluşturma
local function addButton(text, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, (#frame:GetChildren() - 1) * 35 + 10)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.Gotham
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(callback)
end

-- Özellikler
addButton("Fly (T)", function()
	local flying = false
	local vel = Instance.new("BodyVelocity")
	vel.Velocity = Vector3.zero
	vel.MaxForce = Vector3.new(99999,99999,99999)
	vel.P = 1250
	vel.Parent = char:WaitForChild("HumanoidRootPart")

	UserInputService.InputBegan:Connect(function(i)
		if i.KeyCode == Enum.KeyCode.T then
			flying = not flying
			vel.Velocity = flying and Vector3.new(0,50,0) or Vector3.zero
		end
	end)
end)

addButton("Speed", function()
	char:WaitForChild("Humanoid").WalkSpeed = 100
end)

addButton("Beleş Para", function()
	local fake = Instance.new("BillboardGui", player.Character.Head)
	fake.Size = UDim2.new(0, 200, 0, 50)
	fake.AlwaysOnTop = true
	local label = Instance.new("TextLabel", fake)
	label.Size = UDim2.new(1,0,1,0)
	label.Text = "+9999999$"
	label.TextColor3 = Color3.new(0,1,0)
	label.BackgroundTransparency = 1
	label.TextScaled = true
	wait(2)
	fake:Destroy()
end)

addButton("Jumpscare", function()
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

addButton("Play Music", function()
	local m = Instance.new("Sound", player.PlayerGui)
	m.SoundId = "rbxassetid://142376088" -- Seçtiğin müzik
	m.Volume = 1
	m:Play()
end)

-- Gizli Mod: F tuşuyla aç/kapat
UserInputService.InputBegan:Connect(function(input, processed)
	if not processed and input.KeyCode == Enum.KeyCode.F then
		guiVisible = not guiVisible
		gui.Enabled = guiVisible
	end
end
