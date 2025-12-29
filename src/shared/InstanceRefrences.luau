local ReplicatedStorage = game:GetService("ReplicatedStorage")
--Module script to be used for eaiser edit of instance refrences, will make edits to refrencing things in the workspace for all scripts into 1 edit.

--ReplicatedStorage instances
local RStorage = {
	["Modules"] = {
		["Utility"] = ReplicatedStorage.RojoShared.Utility,
	},
}
--Workspace instances
local work = {}

local module = {
	["RStorage"] = RStorage,
	["Workspace"] = work,
}

return module
