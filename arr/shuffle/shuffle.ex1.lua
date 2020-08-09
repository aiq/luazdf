local t = require( "taptest" )
local like = require( "like" )
local same = require( "same" )
local shuffle = require( "shuffle" )

local arr = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j" }
local shuffled = shuffle( arr )
t( like( arr, shuffled ), true )
t( same( arr, shuffled ), false )

t()
