local network = {}

local component = require("component")
local json = require("json")
local env = require("env")

local internet = component.internet

function network.serverPOST(route, table_)
  local uri = env.serverUrl .. route
 	local headers = {["Content-Type"] = "application/json", ["X-Secret"] = env.secret }
  local req = internet.request(uri, json.encode(table_), headers, "POST")

  req.finishConnect()
  local status, message, _ = req.response()
  print(json.encode({
    status = status,
    message = message,
  }))
end

return network