local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "1254GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Text = "1254GUI"
title.TextScaled = true

local buttonNames = {
	"Avatar Spam"
}

for i, name in ipairs(buttonNames) do
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, (i * 45))
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.TextColor3 = Color3.new(1, 1, 1)

	btn.MouseButton1Click:Connect(function()
		if name == "Avatar Spam" then
			for j = 1, 20 do
				local img = Instance.new("ImageLabel", gui)
				img.Size = UDim2.new(0, 100, 0, 100)
				img.Position = UDim2.new(math.random(), 0, math.random(), 0)
				img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=1000296817&width=420&height=420&format=png"
				img.BackgroundTransparency = 1
				game.Debris:AddItem(img, 5)
			end
		end
	end)
end

