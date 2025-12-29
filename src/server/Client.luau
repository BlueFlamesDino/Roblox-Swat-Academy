local module = {}

type client = {
	player: Player,
	inventory: {},
	equipped: {},
}

function module.new(player: Player): client
	local client: client = {}

	client.player = player
	client.inventory = {}
	client.equipped = {}

	return client
end

return module
