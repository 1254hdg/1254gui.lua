-- 1254GUI Script (Eğlence Amaçlı)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- GUI oluşturma
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"
gui.ResetOnSpawn = false
gui.Enabled = false -- Gizli mod: F tuşu ile açılır

-- GUI aç/kapa (Gizli Mod: F tuşu)
UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F then
		gui.Enabled = not gui.Enabled
	end
end)

-- Ana Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 400)
frame.Position = UDim2.new(0.5, -160, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Başlık
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "1254GUI"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.FredokaOne
title.TextScaled = true

-- Buton oluşturucu
local function createButton(text, yPos, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Position = UDim2.new(0, 10, 0, yPos)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true

	-- RGB efekti
	task.spawn(function()
		while true do
			for i = 0, 1, 0.01 do
				btn.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
				task.wait()
			end
		end
	end)

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

createButton("Avatar Spam", 90, function()
	for i = 1, 20 do
		local img = Instance.new("ImageLabel", gui)
		img.Size = UDim2.new(0, 100, 0, 100)
		img.Position = UDim2.new(math.random(), 0, math.random(), 0)
		img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=4974544635&width=420&height=420&format=png"
		img.BackgroundTransparency = 1
		game:GetService("Debris"):AddItem(img, 3)
	end
end)

createButton("Flip Screen", 130, function()
	local camera = workspace.CurrentCamera
	camera.CFrame = camera.CFrame * CFrame.Angles(0, 0, math.rad(180))
end)

createButton("Fly (E)", 170, function()
	-- Basit Fly
	local flying = false
	local bp = Instance.new("BodyPosition")
	bp.MaxForce = Vector3.new(0, 0, 0)

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.E then
			flying = not flying
			if flying then
				local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					bp.Parent = hrp
					bp.MaxForce = Vector3.new(400000, 400000, 400000)
					while flying and hrp and bp.Parent do
						bp.Position = hrp.Position + Vector3.new(0, 10, 0)
						task.wait()
					end
				end
			else
				bp:Destroy()
			end
		end
	end)
end)

createButton("Speed x3", 210, function()
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = 48 end
end)

createButton("Beleş Para", 250, function()
	local cash = Instance.new("TextLabel", gui)
	cash.Size = UDim2.new(0, 200, 0, 50)
	cash.Position = UDim2.new(0.5, -100, 0.5, -25)
	cash.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	cash.Text = "+999999 Cash!"
	cash.TextScaled = true
	cash.TextColor3 = Color3.new(1, 1, 1)
	game:GetService("Debris"):AddItem(cash, 2)
end)

createButton("Play Music", 290, function()
	local sound = Instance.new("Sound", gui)
	sound.SoundId = "rbxassetid://142376088" -- Sevdiğin şarkı
	sound.Volume = 1
	sound.Looped = true
	sound:Play()
end)
