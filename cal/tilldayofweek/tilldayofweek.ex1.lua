local t = require( "taptest" )
local tilldayofweek = require( "tilldayofweek" )

local d = { year = 2014, month = 3, day = 22 } -- saturday

t( tilldayofweek( d, 7, 1 ), 1 ) -- next sunday
t( tilldayofweek( d, 3, 1 ), 4 ) -- next wednesday
t( tilldayofweek( d, 6, 1 ), 7 ) -- next saturday

-- next next wednesday
t( tilldayofweek( d, 3, 2 ), 11 )


t( tilldayofweek( d, 6, -1 ), -7 ) -- last saturday
t( tilldayofweek( d, 1, -1 ), -5 ) -- last monday
t( tilldayofweek( d, 5, -1 ), -1 ) -- last friday

-- last last last monday
t( -19, tilldayofweek( d, 1, -3 ) )

t()
