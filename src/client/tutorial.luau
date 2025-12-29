local module = {}

function module.new()
	local tutorial = {}

	function tutorial.Print()
		print("I'm a tutorial")
	end

	return tutorial
end

return module
