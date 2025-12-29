local module = {}

function module.new()
	local player = {}

	player.rbxPlayer = nil
	player.inventory = {}
	player.equipped = {}

	return player
end

return module
