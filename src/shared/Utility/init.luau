local module = {}

function module.getInstanceFromWorkspace(attribute: string, value)
	for index, instance in game.Workspace:GetDescendants() do
		if instance:GetAttribute(attribute) == value then
			return instance
		end
	end
	print("Function could not find instance with attribute or checked value of the attribute")
	return nil
end

return module
