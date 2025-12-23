local module = {}
module.Entities = {}

function module.create(id: string, entity: {}?)
	return {
		["id"] = id,
	}
end

function module.add(entity: {}, parent: string?)
	if parent then
		module.Entities[parent][entity.id] = entity
	else
		module.Entities[entity.id] = entity
	end
end

function module.remove(entityid: {}, parent: string?)
	if parent then
		module.Entities[parent][entityid] = nil
	else
		module.Entities[entityid] = nil
	end
end

return module
