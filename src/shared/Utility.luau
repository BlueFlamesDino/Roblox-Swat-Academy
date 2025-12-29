local RunService = game:GetService("RunService")
local module = {}

-- Searches the workspace for a instance with an attribute, if the value matches return it
function module.getInstanceFromAttribute(attribute: string, value): Instance
	for index, instance in game.Workspace:GetDescendants() do
		if instance:GetAttribute(attribute) == value then
			return instance
		end
	end
	print("Function could not find instance with attribute or checked value of the attribute")
	return nil
end
--Will run provided function if script is run in roblox studio
function module.wrapDevCode(func)
	if not RunService:IsStudio() then
		return
	end
	func()
end

return module
