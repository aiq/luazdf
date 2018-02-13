local t = require( "tapered" )
local unwrap = require( "unwrap" )

two, four, eight = unwrap( { 2, 4, 8 } )
t.is( two, 2 )
t.is( four, 4 )
t.is( eight, 8 )

three, four, five = unwrap( { 1, 2, 3, 4, 5, 6, 7 }, 3, 5 )
t.is( three, 3 )
t.is( four, 4 )
t.is( five, 5 )

t.done()
