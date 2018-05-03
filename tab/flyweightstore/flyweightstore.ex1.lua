local t = require "taptest"
local flyweightstore = require "flyweightstore"

local function diff( a, b ) return a ~= b end

t( type( flyweightstore() ), "function" )

local fly = flyweightstore()

t( type( fly( 1 )), "table" )
t( fly( 1 ), fly( 2 ), diff )

t( type( fly( 1, nil, 0/0, 3 ) ), "table" )
t( fly( 1, nil, 0/0, 3 ), fly( 1, nil, 0/0, 3 ) )

t( fly( 1, nil, 0/0, 3 ), fly( 1, nil, 0/0 ), diff )
t( fly( 1, nil, 0/0, 3 ), fly( 1, nil ), diff )
t( fly( 1, nil, 0/0, 3 ), fly( 1 ), diff )
  
t( fly( 1, nil, 0/0, 3 ), fly( 1, nil, 0/0, 2 ), diff )
t( fly( 1, nil, 0/0, 3 ), fly( 1, nil, 0, 3 ), diff )
t( fly( 1, nil, 0/0, 3 ), fly( 1, '', 0/0, 3 ), diff )
t( fly( 1, nil, 0/0, 3 ), fly( 4, nil, 0/0, 3 ), diff )

-- Multiple store
local alt = flyweightstore()
t( type( alt( 1, nil, 0/0, 3 )), "table" )
t( alt( 1, nil, 0/0, 3 ), alt( 1, nil, 0/0, 3 ) )
t( alt( 1, nil, 0/0, 3 ), fly( 1, nil, 0/0, 3 ), diff )

-- Garbage collection test

-- Check if the current lua version supports garbage collection metamethod
local has_gc_meta
setmetatable( {}, { __gc = function() has_gc_meta = true end } )
collectgarbage( "collect" )
local function skipon51( a, b )
   if has_gc_meta then return a == b end
   return true, "skipped"
end

local gccount = 0
local x = fly( true, false )
x = setmetatable( x, { __gc = function( t ) gccount = gccount + 1 end } )

-- No collection if some reference is still around
collectgarbage( "collect" )
t( gccount, 0, skipon51 )

-- Automatic collection
x = nil
collectgarbage( "collect" )
t( gccount, 1, skipon51 )

t()

