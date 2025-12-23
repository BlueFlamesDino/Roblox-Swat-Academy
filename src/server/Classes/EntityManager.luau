--May be wanted in the future
local module = {}
module.Entities = {}

function module.create(id: string, entity: {}?)
	if not entity then
		return {
			["id"] = id,
			["Interactions"] = {},
		}
	else
		entity.id = id
		entity.Interactions = {}
		return entity
	end
end

function module.add(entity: {}, parent: string?)
	if parent then
		module.Entities[parent][entity.id] = entity
	else
		module.Entities[entity.id] = entity
	end
end

function module.remove(entityid: string, parent: string?)
	if parent then
		module.Entities[parent][entityid] = nil
	else
		module.Entities[entityid] = nil
	end
end

function module.interact(entityid: string, interaction) end

return module
