local module = {}
local useClass = require(script.Parent.BaseVehicle)

function module.new()
	local CopCar = useClass.new()

	CopCar.drive()

	return CopCar
end

return module
