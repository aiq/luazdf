local t = require( "taptest" )
local addedge = require( "addedge" )
local adjmatrix = require( "adjmatrix" )
local buildgraph = require( "buildgraph" )
local matrixtostrlst = require( "matrixtostrlst" )

local function tostr( graph, order )
   local m = adjmatrix( graph, order )
   return table.concat( matrixtostrlst( m, "%d", "" ), " " )
end

local nodes = { "a", "b", "c" }
local g = buildgraph( nodes, {} )
-- [ a ] [ b ] [ c ]
t( tostr( g, nodes ), "000 000 000" )

g = addedge( g, "a", "b" )
-- a --> b
-- [ c ]
t( tostr( g, nodes ), "010 000 000" )

g = addedge( g, "b", "d" )
table.insert( nodes, "d" )
-- a --> b --> d
-- [ c ]
t( tostr( g, nodes ), "0100 0001 0000 0000" )

g = addedge( g, "d", "b", false )
-- a --> b <--> d
-- [ c ]
t( tostr( g, nodes ), "0100 0001 0000 0100" )

g = addedge( g, "a", "c", true )
-- c <--> a --> b <--> d
t( tostr( g, nodes ), "0110 0001 1000 0100" )

t()
