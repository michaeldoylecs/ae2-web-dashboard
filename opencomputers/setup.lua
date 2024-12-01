-- credit https://github.com/DylanTaylor1/GTNH-Stocking

local shell = require('shell')
local args = {...}
local branch
local repo
local scripts = {
    'Run.lua',
}

-- BRANCH
if #args >= 1 then
    branch = args[1]
else
    branch = 'main'
end

-- REPO
if #args >= 2 then
    repo = args[2]
else
    repo = 'https://raw.githubusercontent.com/michaeldoylecs/ae2-web-dashboard/'
end

-- INSTALL
for i=1, #scripts do
    shell.execute(string.format('wget -f %s/refs/heads/%s/opencomputers/%s', repo, branch, scripts[i]))
end
