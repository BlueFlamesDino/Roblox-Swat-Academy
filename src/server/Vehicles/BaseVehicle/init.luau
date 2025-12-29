--Provides only extra functionality and driving
local module = {}

function module.new()
	local vehicle = {}

	function vehicle.drive()
		print("I'm Driving Bro")
	end

	function vehicle.setWheel(servoInstance: HingeConstraint, identifier: string) end

	function vehicle.setSeat(seatInstance: Seat, identifier: string) end

	return vehicle
end

return module
