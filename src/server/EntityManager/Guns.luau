local module = {}
module.__index = module

function module.create()
	local self = setmetatable({}, module)

	self.Gun = {} --Table that'll hold gun information
	self.Owner = nil --Player that has this gun
	self.Tool = nil

	return self
end

function module:setOwner(player: Player)
	self.Owner = player
end

function module:shoot(origin: CFrame, target: CFrame)
	return workspace:Raycast(origin.Position, target.Position)
end

return module
