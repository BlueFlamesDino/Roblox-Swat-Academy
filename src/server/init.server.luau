local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Game code is put here
local Utility = require(ReplicatedStorage.RojoShared.Utility)

-- Classes
local classCopCar = require(script.Vehicles.CopCar)
local classClient = require(script.Client)
-- Containers
local Clients = {}

local car1 = classCopCar.new()

Players.PlayerAdded:Connect(function(player)
	Clients[player.UserId] = classClient.new(player)

	local client = Clients[player.UserId]
end)
Players.PlayerRemoving:Connect(function(player, reason)
	Clients[player.UserId] = nil
end)
