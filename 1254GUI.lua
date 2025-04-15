local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 350)
frame.Position = UDim2.new(0.5, -150, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

-- Başlık (1254GUI yazısı)
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "1254GUI"
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

-- RGB Efekti
task.spawn(function()
	while true do
		for i = 0, 1, 0.01 do
			frame.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
			wait(0.05)
		end
	end
end)

-- Gizli Mod (RightShift ile aç/kapat)
local UIS = game:GetService("UserInputService")
local isVisible = true

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
		isVisible = not isVisible
		frame.Visible = isVisible
	end
end)

-- Butonlar
local buttons = {
	{"Jumpscare", function()
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
	end},
	{"Fake Ban", function()
		local banFrame = Instance.new("Frame", gui)
		banFrame.Size = UDim2.new(1, 0, 1, 0)
		banFrame.BackgroundColor3 = Color3.new(0, 0, 0)
		local banText = Instance.new("TextLabel", banFrame)
		banText.Size = UDim2.new(1, 0, 1, 0)
		banText.Text = "You are permanently banned from this game.\nReason: 1254GUI detected."
		banText.TextColor3 = Color3.new(1, 0, 0)
		banText.TextScaled = true
	end},
	{"Flip Screen", function()
		local camera = workspace.CurrentCamera
		camera.CFrame = camera.CFrame * CFrame.Angles(0, 0, math.rad(180))
	end},
	{"Play Music", function()
		local s = Instance.new("Sound", gui)
		s.SoundId = "rbxassetid://142376088"
		s.Volume = 1
		s:Play()
	end}
}

for i, data in ipairs(buttons) do
	local name, func = data[1], data[2]
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, (i - 1) * 35 + 50)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSans
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(func)
end
