local t = require( "taptest" )
local unwrap = require( "unwrap" )

two, four, eight = unwrap( { 2, 4, 8 } )
t( two, 2 )
t( four, 4 )
t( eight, 8 )

three, four, five = unwrap( { 1, 2, 3, 4, 5, 6, 7 }, 3, 5 )
t( three, 3 )
t( four, 4 )
t( five, 5 )

t()
