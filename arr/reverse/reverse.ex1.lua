local t = require( "tapered" )
local reverse = require( "reverse" )

arr = reverse{ 1, 2, 3, 4, 5, 6, 7, 8, 9 }
t.same( { 9, 8, 7, 6, 5, 4, 3, 2, 1 }, arr )

arr = reverse{}
t.same( {}, arr )

arr = reverse{ 1 }
t.same( { 1 }, arr )

arr = reverse{ 1, 2 }
t.same( { 2, 1 }, arr )

arr = reverse{ 1, 2, 3 }
t.same( { 3, 2, 1 }, arr )

arr = reverse{ 1, 2, 3, 4 }
t.same( { 4, 3, 2, 1 }, arr )

t.done()
