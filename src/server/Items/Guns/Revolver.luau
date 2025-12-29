local module = {}
local ParentClass = require(script.Parent)

function module.new()
	local Revolver = ParentClass.new()

	return Revolver
end

return module
