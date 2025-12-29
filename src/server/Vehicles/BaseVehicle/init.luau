--Provides only extra functionality and driving
local module = {}

type Constraint = {
	steers: boolean,
	instance: Instance,
}

function module.new()
	local vehicle = {}

	vehicle.steerAngle = 30
	vehicle._velocity = 0

	vehicle._constraints = {}
	vehicle._seat = nil

	--Makes all motor constraints gain AngularVelocity
	function vehicle.acelerate(speed: number)
		vehicle._velocity += speed
		for identifier: string, object: Constraint in pairs(vehicle._constraints) do
			if not object.steers then
				object.instance.AngularVelocity = vehicle._velocity
			end
		end
	end
	--Makes all motor constraints lose AngulerVelocity. Friction > 0 is more slowdown.
	function vehicle.applyFriction(friction: number)
		vehicle._velocity -= vehicle._velocity * friction
		for identifier: string, object: Constraint in pairs(vehicle._constraints) do
			if not object.steers then
				object.instance.AngularVelocity = vehicle._velocity
			end
		end
	end
	function vehicle.setVelocity(newVelocity: number)
		vehicle._velocity = newVelocity
		for identifier: string, object: Constraint in pairs(vehicle._constraints) do
			if not object.steers then
				object.instance.AngularVelocity = vehicle._velocity
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
