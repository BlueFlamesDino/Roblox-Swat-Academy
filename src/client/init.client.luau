local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Input, GUI, etc code is put here
local Utility = require(ReplicatedStorage.RojoShared.Utility)

local function test()
	print("is studio")
end

Utility.wrapDevCode(test)
