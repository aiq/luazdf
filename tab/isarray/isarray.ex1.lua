local t = require( "tapered" )
local isarray = require( "isarray" )

t.ok( isarray{ "a", "b", "c", "d" } )
t.ok( isarray{ [ 1 ]="a", [ 2 ]="b", [ 3 ]="c", [ 4 ]="d" } )
t.ok( isarray{ [ 1 ]="a", [ 2 ]="b", [ 3 ]="c", [ 5 ]="d" } )
t.nok( isarray{ [ 1 ]="a", [ 2 ]="b", [ 3 ]="c", [ "4" ]="d" } )

t.done()
