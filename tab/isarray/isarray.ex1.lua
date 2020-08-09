local t = require( "taptest" )
local isarray = require( "isarray" )

t( isarray{ "a", "b", "c", "d" }, true )
t( isarray{ [ 1 ]="a", [ 2 ]="b", [ 3 ]="c", [ 4 ]="d" }, true )
t( isarray{ [ 1 ]="a", [ 2 ]="b", [ 3 ]="c", [ 5 ]="d" }, true )
t( isarray{ [ 1 ]="a", [ 2 ]="b", [ 3 ]="c", [ "4" ]="d" }, false )

t()
