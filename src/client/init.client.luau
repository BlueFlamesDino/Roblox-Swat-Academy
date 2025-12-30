local ReplicatedStorage = game:GetService("ReplicatedStorage")
--[[
What is this script?
-This script is for communicating to the server, controling gui elements, or any other client only functionality of the sort: If 
it can be done on the server, then do it on the server.
]]

local InstanceRefrence = require(ReplicatedStorage.RojoShared.InstanceRefrences)
local Utility = require(InstanceRefrence.RStorage.Modules.Utility)
require(script.InputService)

local function test()
	print("is studio")
end

Utility.wrapDevCode(test)
