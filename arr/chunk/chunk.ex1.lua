local t = require( "taptest" )
local chunk = require( "chunk" )
local same = require( "same" )

local res = chunk( { "a", "b", "c", "d", "e", "f" }, 3 )
      
t( #res, 2 )
t( same( res[ 1 ], { "a", "b", "c" } ), true )
t( same( res[ 2 ], { "d", "e", "f" } ), true )

t()
