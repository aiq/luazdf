local t = require "taptest"
local iscallable = require "iscallable"

t( iscallable( 0 ),              false )
t( iscallable( "" ),             false )
t( iscallable( true ),           false )
t( iscallable( {} ),             false )
t( iscallable( function() end ),  true )

local calltab_a = {}
setmetatable( calltab_a, { __call = function() end } )

t( iscallable( calltab_a ), true )

local calltab_b = {}
setmetatable( calltab_b, { __call = calltab_a } )

t( iscallable( calltab_b ), true )

local rectab_a = {}
local rectab_b = {}
setmetatable( rectab_a, { __call = rectab_b } )
setmetatable( rectab_b, { __call = rectab_a } )

t( iscallable( rectab_b ), false )

t()

