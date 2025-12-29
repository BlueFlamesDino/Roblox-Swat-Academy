--Provides only extra functionality and driving
local module = {}

type Constrait = {
	steers: boolean,
	instance: Instance,
}

function module.new()
	local vehicle = {}

	vehicle.steerAngle = 30

	vehicle._constraits = {}
	vehicle._seat = nil

	--Makes all motor constraints gain AngularVelocity
	function vehicle.acelerate(speed)
		for identifier: string, object: Constrait in pairs(vehicle._constraits) do
			if not object.steers then
				object.instance.AngularVelocity = speed
			end
		end
	end
	--Makes all servo constraints steer to a TargetAngle
	function vehicle.steer(steer)
		for identifier: string, object: Constrait in pairs(vehicle._constraits) do
			if object.steers then
				object.instance.TargetAngle = vehicle.steerAngle * steer
			end
		end
	end
	--Will then recognize constraint provided. If it's a servo then steers should be true, motor false.
	function vehicle.setConstrait(hingeInstance: HingeConstraint, steers: boolean, identifier: string)
		local constrait: Constrait = { ["steers"] = steers, ["instance"] = hingeInstance }
		vehicle._constraits[identifier] = constrait
	end

	function vehicle.setDriveSeat(seatInstance: Seat | VehicleSeat) end

	return vehicle
end

return module
