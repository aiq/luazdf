local t = require( "tapered" )
local mkpath = require( "mkpath" )

res, err = mkpath( "a/b/c" )
t.ok( res )

os.remove( "a/b/c" )
os.remove( "a/b" )
os.remove( "a" )

t.done()
