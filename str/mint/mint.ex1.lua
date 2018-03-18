local t = require( "taptest" )
local mint = require( "mint" )

-- Lua expression expansion with @{}
local m = mint( "@{item.a} @{item.b:upper()}" )
t( 'a B', m{ item = { a = 'a', b = 'b' } } )
t( 'B A', m{ item = { a = 'B', b = 'a' } } )

-- Mix lua statements and text with @{{}}
m = mint( "@{{for i=1,3 do}} hello @{item}!@{{end}}" )
t( ' hello world! hello world! hello world!', m{ item = 'world' } )

-- Use the output function to expand text from complex lua code
m = mint( "@{{for i=1,3 do o(' hello '..item..'!') end}}", 'o' )
t( ' hello dude! hello dude! hello dude!', m{ item = 'dude' } )

-- Last text appending
m = mint( "@{'true'} ok" )
t( 'true ok', m{} )

-- Value cast in the output function
m = mint( "@{true} ok" )
t( 'true ok', m{} )

t()

