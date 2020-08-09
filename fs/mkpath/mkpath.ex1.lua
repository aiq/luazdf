local t = require( "taptest" )
local mkpath = require( "mkpath" )
local isdir = require( "isdir" )

t( isdir( "a" ), false )

res, err = mkpath( "a/b/c" )
t( res, true )

t( isdir( "a" ), true )
t( isdir( "a/b" ), true )
t( isdir( "a/b/c" ), true )

os.remove( "a/b/c" )
os.remove( "a/b" )
os.remove( "a" )

t()
