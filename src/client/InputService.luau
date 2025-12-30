local UserInputService = game:GetService("UserInputService")
return function()
	UserInputService.InputChanged:Connect(function(input, gameProcessedEvent)
		if gameProcessedEvent then
			return
		end
	end)
end
