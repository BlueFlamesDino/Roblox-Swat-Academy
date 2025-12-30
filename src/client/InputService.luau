local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

return UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then
		return
	end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		ReplicatedStorage.RojoShared.RemoteEvent:FireServer({ ["Group"] = "Input", ["Message"] = input.KeyCode })
	else
		ReplicatedStorage.RojoShared.RemoteEvent:FireServer({
			["Group"] = "Input",
			["Message"] = input.UserInputType.Name,
		})
	end
end)
