-- Blank file for test
local env = require("env")
local event = require("event")
local network = require("Network")

-- Check that ENV variables are set
-- If not, exit early
if not env.serverUrl or not env.secret then
  print("Please set ENV variables in env.lua")
  os.exit()
end

local function sendStatsToServer()
  network.serverPOST("log", {
    data="Test Message",
  })
end

local eventId = event.timer(15, sendStatsToServer, math.huge)

-- Loop until interrupted
while true do
  if event.pull() == "interrupted" then
    event.cancel(eventId)
    break
  end
end
