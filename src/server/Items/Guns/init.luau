local module = {}
local ParentClass = require(script.Parent)

function module.new()
	local gun = ParentClass.new()

	return gun
end

return module
