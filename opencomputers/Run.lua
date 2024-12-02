-- Blank file for test
local event = require("event")
local network = require("src/network")

local function sendStatsToServer()
  network.serverPOST({
    data="Test Message",
  }, "log")
end

event.timer(15, sendStatsToServer, math.huge)

-- Loop until interrupted
while true do
  if event.poll() == "interrupted" then break; end;
end
