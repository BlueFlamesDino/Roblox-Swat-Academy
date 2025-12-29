local module = {}
local useClass = require(script.Parent.BaseVehicle)

function module.new()
	local CopCar = useClass.new()

	return CopCar
end

return module
