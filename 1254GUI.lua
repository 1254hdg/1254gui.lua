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
	"Jumpscare",
	"Fake Ban",
	"Flip Screen",
	"Play Music"
}

for i, name in ipairs(buttons) do
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, (i - 1) * 35 + 10)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)

	btn.MouseButton1Click:Connect(function()
		if name == "Jumpscare" then
			local img = Instance.new("ImageLabel", gui)
			img.Size = UDim2.new(1, 0, 1, 0)
			img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=1000296817&width=420&height=420&format=png"
			img.BackgroundTransparency = 1
			local sound = Instance.new("Sound", img)
			sound.SoundId = "rbxassetid://5410086218"
			sound:Play()
			wait(2)
			img:Destroy()

		elseif name == "Fake Ban" then
			local banFrame = Instance.new("Frame", gui)
			banFrame.Size = UDim2.new(1, 0, 1, 0)
			banFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			local banText = Instance.new("TextLabel", banFrame)
			banText.Size = UDim2.new(1, 0, 1, 0)
			banText.Text = "You are permanently banned.\nReason: 1254GUI detected."
			banText.TextColor3 = Color3.new(1, 0, 0)
			banText.TextScaled = true

		elseif name == "Flip Screen" then
			local cam = workspace.CurrentCamera
			cam.CFrame = cam.CFrame * CFrame.Angles(0, 0, math.rad(180))

		elseif name == "Play Music" then
			local s = Instance.new("Sound", gui)
			s.SoundId = "rbxassetid://142376088"
			s.Volume = 1
			s.Looped = false
			s:Play()
		end
	end)
end
