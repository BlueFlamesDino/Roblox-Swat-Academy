--Provides only extra functionality and driving
local module = {}

function module.new()
	local vehicle = {}

	function vehicle.drive()
		print("Driving")
	end

	function vehicle.setWheel(motorInstance: HingeConstraint, identifier: string) end

	function vehicle.setSeat(seatInstance: Seat | VehicleSeat, identifier: string) end

	return vehicle
end

return module
