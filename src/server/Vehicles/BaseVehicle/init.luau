--Provides only extra functionality and driving
local module = {}

type Constraint = {
	steers: boolean,
	instance: Instance,
}

function module.new()
	local vehicle = {}

	vehicle.steerAngle = 30

	vehicle._constraints = {}
	vehicle._seat = nil

	--Makes all motor constraints gain AngularVelocity
	function vehicle.acelerate(speed)
		for identifier: string, object: Constraint in pairs(vehicle._constraints) do
			if not object.steers then
				object.instance.AngularVelocity = speed
			end
		end
	end
	--Makes all servo constraints steer to a TargetAngle
	function vehicle.steer(steer)
		for identifier: string, object: Constraint in pairs(vehicle._constraints) do
			if object.steers then
				object.instance.TargetAngle = vehicle.steerAngle * steer
			end
		end
	end
	--Will then recognize constraint provided. If it's a servo then steers should be true, motor false.
	function vehicle.setConstraint(hingeInstance: HingeConstraint, steers: boolean, identifier: string)
		local constraint: Constraint = { ["steers"] = steers, ["instance"] = hingeInstance }
		vehicle._constraints[identifier] = constraint
	end

	function vehicle.setDriveSeat(seatInstance: Seat | VehicleSeat) end

	return vehicle
end

return module
