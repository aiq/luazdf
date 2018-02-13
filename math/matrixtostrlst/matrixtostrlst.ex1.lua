local t = require( "tapered" )
local matrixtostrlst = require( "matrixtostrlst" )

local matrix = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }

local strlst = matrixtostrlst( matrix )
t.same( strlst, { "1\t2\t3", "4\t5\t6", "7\t8\t9" } )

strlst = matrixtostrlst( matrix, "%03d", " " )
t.same( strlst, { "001 002 003", "004 005 006", "007 008 009" } )

t.done()
