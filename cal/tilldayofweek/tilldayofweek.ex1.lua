local t = require( "tapered" )
local tilldayofweek = require( "tilldayofweek" )

local d = { year = 2014, month = 3, day = 22 } -- saturday

t.is( 1, tilldayofweek( d, 7, 1 ) ) -- next sunday
t.is( 4, tilldayofweek( d, 3, 1 ) ) -- next wednesday
t.is( 7, tilldayofweek( d, 6, 1 ) ) -- next saturday

-- next next wednesday
t.is( 11, tilldayofweek( d, 3, 2 ) )


t.is( -7, tilldayofweek( d, 6, -1 ) ) -- last saturday
t.is( -5, tilldayofweek( d, 1, -1 ) ) -- last monday
t.is( -1, tilldayofweek( d, 5, -1 ) ) -- last friday

-- last last last monday
t.is( -19, tilldayofweek( d, 1, -3 ) )

t.done()
