local t = require( "taptest" )
local isdodd = require( "isdodd" )

t( isdodd( "file.txt" ), false )
t( isdodd( ".hidden.txt" ), false )
t( isdodd( "." ), true )
t( isdodd( ".." ), true )

t()
