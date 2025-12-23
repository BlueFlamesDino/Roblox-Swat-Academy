local ReplicatedStorage = game:GetService("ReplicatedStorage")
local module = {}

function module.create(Owner: Player)
	local gun = {}

	local connections = {}

	-- function self:setOwner(player: Player)
	-- 	self.Owner = player
	-- end

	function gun:setTool(tool: Tool)
		--self.Tool:Destroy()
		self.Tool = tool
		if connections[1] then
			connections[1]:Disconnect()
		end
		connections[1] = ReplicatedStorage.RojoShared.Networking.ToolActivation.OnServerEvent:Connect(function(player)
			local result = gun:shoot()
		end)
	end

	function gun:destroy()
		gun.Tool:Destroy()
		for i, c in connections do
			c:Disconnect()
		end
		gun = nil
	end

	function gun:shoot(origin: CFrame, target: CFrame)
		print("Shoot")
		return false
		--return workspace:Raycast(origin.Position, target.Position)
	end

	gun.Gun = {} --Table that'll hold gun information
	gun.Owner = Owner --Player that has this gun
	gun:setTool(Instance.new("Tool", Owner.Backpack))
	gun.Tool.Name = "Gun"

	return gun
end

return module
