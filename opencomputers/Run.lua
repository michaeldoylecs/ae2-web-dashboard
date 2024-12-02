-- Blank file for test
local event = require("event")
local network = require("Network")

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
