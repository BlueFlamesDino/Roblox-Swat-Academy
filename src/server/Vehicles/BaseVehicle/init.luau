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
	vehicle._seat = nil

	function vehicle.acelerate(speed)
		for identifier: string, object: Wheel in pairs(vehicle._wheels) do
			object.instance.AngularVelocity = speed
		end
	end

	function vehicle.steer(steer)
		for identifier: string, object: Wheel in pairs(vehicle._wheels) do
			if object.steerable then
				object.instance.TargetAngle = vehicle.steerAngle * steer
			end
		end
	end

	function vehicle.setWheel(hingeInstance: HingeConstraint, steerable: boolean, identifier: string)
		local wheel: Wheel = { ["steerable"] = steerable, ["instance"] = hingeInstance }
		vehicle._wheels[identifier] = wheel
	end

	function vehicle.setDriveSeat(seatInstance: Seat | VehicleSeat) end

	return vehicle
end

return module
