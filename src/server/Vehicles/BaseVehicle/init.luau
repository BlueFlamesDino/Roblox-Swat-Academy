--Provides only extra functionality and driving
local module = {}

type Constrait = {
	steerable: boolean,
	instance: Instance,
}

function module.new()
	local vehicle = {}

	vehicle.steerAngle = 30

	vehicle._constraits = {}
	vehicle._seat = nil

	function vehicle.acelerate(speed)
		for identifier: string, object: Constrait in pairs(vehicle._constraits) do
			object.instance.AngularVelocity = speed
		end
	end

	function vehicle.steer(steer)
		for identifier: string, object: Constrait in pairs(vehicle._constraits) do
			if object.steerable then
				object.instance.TargetAngle = vehicle.steerAngle * steer
			end
		end
	end

	function vehicle.setConstrait(hingeInstance: HingeConstraint, steerable: boolean, identifier: string)
		local constrait: Constrait = { ["steerable"] = steerable, ["instance"] = hingeInstance }
		vehicle._constraits[identifier] = constrait
	end

	function vehicle.setDriveSeat(seatInstance: Seat | VehicleSeat) end

	return vehicle
end

return module
