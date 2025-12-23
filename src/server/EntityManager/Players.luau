local module = {}

function module.create(player: Player)
	local self = {}

	self.Player = player --In-Game Player refrence
	self.Inventory = {} --Inventory for the player
	self.Data = {} --Save data for the player

	return self
end

return module
