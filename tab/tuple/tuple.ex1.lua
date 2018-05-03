local t = require "taptest"
local tuple = require "tuple"

local function diff( a, b ) return a ~= b end

-- Equality operation
t( type( tuple( 1, "a", true, 3 ) ), "table" )
t( tuple( 1, "a", true, 3 ), tuple( 1, "a", true, 3 ) )

-- Read fields
local field = tuple( 1, "a", true, 3 )
t( field.n, 4 )
t( field[ 1 ], 1 )
t( field[ 2 ], "a" )
t( field[ 3 ], true )
t( field[ 4 ], 3 )

-- Store nil and NaN
field = tuple( 1, nil, 0/0, 3 )
t( field.n, 4 )
t( field[ 1 ], 1 )
t( field[ 2 ], nil )
t( field[ 3 ], field[ 3 ], diff )
t( field[ 4 ], 3 )

-- Can not change field
local a, b = pcall( function() tuple( 1, nil, 0/0, 3 )[ 1 ] = 2 end )
t( a, false )
t( b:match( "can not change tuple field" ), "can not change tuple field" )

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
local x = tuple( 2, nil, 0/0, 4 )
x = setmetatable( x, { __gc = function( t ) gccount = gccount+1 end } )

-- No collection if some reference is still around
collectgarbage( "collect" )
t( gccount, 0, skipon51 )

-- Automatic collection
x = nil
collectgarbage( "collect" )
t( gccount, 1, skipon51 )

t()

