local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage.RojoShared.Networking.ToolActivation

local connect = nil
Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child: Tool)
	if not child:IsA("Tool") then
		return
	end
	connect = child.Activated:Connect(function()
		remoteEvent:FireServer()
	end)
end)
