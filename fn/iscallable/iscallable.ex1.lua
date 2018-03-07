
local tt = require 'taptest'
local ic = require 'iscallable'

tt( ic(0),              false )
tt( ic(''),             false )
tt( ic(true),           false )
tt( ic({}),             false )
tt( ic(function() end), true )

local calltab_a = {}
setmetatable(calltab_a, {__call = function() end})

tt( ic(calltab_a),      true )

local calltab_b = {}
setmetatable(calltab_b, {__call = calltab_a})

tt( ic(calltab_b),      true )

local rectab_a = {}
local rectab_b = {}
setmetatable(rectab_a, {__call = rectab_b } )
setmetatable(rectab_b, {__call = rectab_a} )

tt( ic(rectab_b),       false )

tt( )

