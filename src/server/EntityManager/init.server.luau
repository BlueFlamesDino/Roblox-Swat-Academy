local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
--Entities
local Guns = require(script.Guns)
local PlayerEntity = require(script.Players)
--Containers
local PLAYERS = {}

--Handle Player joining
Players.PlayerAdded:Connect(function(rbxplayer)
	PLAYERS[rbxplayer.UserId] = PlayerEntity.create(rbxplayer)
	local player = PLAYERS[rbxplayer.UserId]

	rbxplayer.CharacterAdded:Wait()
	player.Inventory[1] = Guns.create(rbxplayer)

	--print(PLAYERS)
end)

--Handle Player leaving
Players.PlayerRemoving:Connect(function(player, reason)
	PLAYERS[player.UserId] = nil
	--print(player.Name .. " left because " .. reason.Name, PLAYERS)
end)
