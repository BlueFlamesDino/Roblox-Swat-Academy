local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--[[
What is this script?
-This script holds the game's logic.
]]

local Utility = require(ReplicatedStorage.RojoShared.Utility) --General Utility functions, may be of use.
-- Classes --
local classCopCar = require(script.Vehicles.CopCar)
local classClient = require(script.Client)
-- Containers --
local Clients = {}

--Player Handleling --
Players.PlayerAdded:Connect(function(player)
	Clients[player.UserId] = classClient.new(player)
	local client = Clients[player.UserId] --For eaiser syntax

	--temp
end)
Players.PlayerRemoving:Connect(function(player, reason)
	local client = Clients[player.UserId] --For eaiser syntax

	Clients[player.UserId] = nil --Delete the client
end)
