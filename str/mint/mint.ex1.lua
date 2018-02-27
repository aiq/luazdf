local t = require( "tapered" )
local mint = require( "mint" )

-- Lua expression expansion with @{}
local m = mint( "@{item.a} @{item.b:upper()}" )
t.same( 'a B', m{ item = { a = 'a', b = 'b' } } )
t.same( 'B A', m{ item = { a = 'B', b = 'a' } } )

-- Mix lua statements and text with @{{}}
m = mint( "@{{for i=1,3 do}} hello @{item}!@{{end}}" )
t.same( ' hello world! hello world! hello world!', m{ item = 'world' } )

-- Use the output function to expand text from complex lua code
m = mint( "@{{for i=1,3 do o(' hello '..item..'!') end}}", 'o' )
t.same( ' hello dude! hello dude! hello dude!', m{ item = 'dude' } )

t.done()

