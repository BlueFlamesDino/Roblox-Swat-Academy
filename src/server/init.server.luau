local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
--[[
What is this script?
-This script holds the game's logic.
]]
local InstanceRefrence = require(ReplicatedStorage.RojoShared.InstanceRefrences)
local Utility = require(InstanceRefrence.RStorage.Modules.Utility) --General Utility functions, may be of use.
-- Classes --
local classVehicle = require(script.Vehicles.BaseVehicle)
local classClient = require(script.Client)
-- Containers --
local Clients = {}

local Car = classVehicle.new()
local ExampleCar: Part = InstanceRefrence.Workspace.ExampleCar

for index, instance: Instance in ExampleCar:GetChildren() do
	if not instance:IsA("Part") then
		continue
	end
	local constraint = instance:WaitForChild("WheelMotor", 1)
	if constraint then
		Car.setConstraint(constraint, false, instance.Name)
	end
end
print(Car._constraints)
Car.acelerate(5)
RunService.Heartbeat:Connect(function(delta)
	Car.applyFriction(0.5 * delta)
end)
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
