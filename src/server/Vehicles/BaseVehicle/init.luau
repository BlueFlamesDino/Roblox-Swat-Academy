--Provides only extra functionality and driving
local module = {}

function module.new()
	local vehicle = {}

	vehicle._wheels = {}

	function vehicle.acelerate(speed)
		print("acelerating")
	end

	function vehicle.steer(steer)
		print("steering")
	end

	function vehicle.setWheel(motorInstance: HingeConstraint, steerable: boolean, identifier: string)
		vehicle._wheels[identifier] = { ["steerable"] = steerable }
	end

	function vehicle.setSeat(seatInstance: Seat | VehicleSeat, identifier: string) end

	return vehicle
end

return module
