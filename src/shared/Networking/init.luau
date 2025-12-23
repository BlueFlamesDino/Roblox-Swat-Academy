local module = {}

local RemoteEvent = script:FindFirstChild("Remote")
local Event = script:FindFirstChild("Event")

function module.send(information: {}, id: string, to: "Server" | "Client") end

return module
