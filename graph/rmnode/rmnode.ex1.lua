local t = require( "tapered" )
local rmnode = require( "rmnode" )
-- util functions
local adjmatrix = require( "adjmatrix" )
local buildgraph = require( "buildgraph" )
local matrixtostrlst = require( "matrixtostrlst" )

local function tostr( graph, order )
   local m = adjmatrix( graph, order )
   return table.concat( matrixtostrlst( m, "%d", "" ), " " )
end

local nodes = { "a", "b", "c", "d", "e" }
local edges = {
   { "a", "b" }, { "b", "a" },
   { "b", "c" }, { "c", "b" },
   { "b", "d" },
   { "d", "c" }
}

local g = buildgraph( nodes, edges )
-- a <--> b <-----------> c
--         \           /
--          ---> d --->
-- [ e ]
t.is( tostr( g, nodes ), "01000 10110 01000 00100 00000" )

g = rmnode( g, "x" ) -- the nodes not exist
t.is( tostr( g, nodes ), "01000 10110 01000 00100 00000" )

g = rmnode( g, "d" )
-- a <--> b <--> c
-- [ e ]
t.is( tostr( g, { "a", "b", "c", "e" } ), "0100 1010 0100 0000" )

g = rmnode( g, "e" )
-- a <--> b <--> c
t.is( tostr( g, { "a", "b", "c" } ), "010 101 010" )

g = rmnode( g, "b" )
-- [ a ] [ c ]
t.is( tostr( g, { "a", "c" } ), "00 00" )

t.done()
