--Provides only extra functionality and driving
local module = {}

type Wheel = {
	steerable: boolean,
	instance: Instance,
}

function module.new()
	local vehicle = {}

	vehicle.steerAngle = 30

	vehicle._wheels = {}
	vehicle._seats = {}

	function vehicle.acelerate(speed)
		print("acelerating")
	end

	function vehicle.steer(steer)
		for identifier: string, object: Wheel in pairs(vehicle._wheels) do
			if object.steerable then
				object.instance.TargetAngle = vehicle.steerAngle * steer
			end
		end
	end

	function vehicle.setWheel(motorInstance: HingeConstraint, steerable: boolean, identifier: string)
		local wheel: Wheel = { ["steerable"] = steerable, ["instance"] = motorInstance }
		vehicle._wheels[identifier] = wheel
	end

	function vehicle.setSeat(seatInstance: Seat | VehicleSeat, identifier: string) end

	return vehicle
end

return module
