local t = require( "taptest" )
local adjmatrix = require( "adjmatrix" )
local buildgraph = require( "buildgraph" )
local matrixtostrlst = require( "matrixtostrlst" )
local rmedge = require( "rmedge" )

local function tostr( graph, order )
   local m = adjmatrix( graph, order )
   return table.concat( matrixtostrlst( m, "%d", "" ), " " )
end

local nodes = { "a", "b", "c", "d" }
local edges = {
   { "a", "b" },
   { "b", "c" },
   { "b", "d" },
   { "d", "c" }
}

local g = buildgraph( nodes, edges, true )
-- a <--> b <-----------> c
--         \           /
--          <--> d <-->
t( tostr( g, nodes ), "0100 1011 0101 0110" )

g = rmedge( g, "b", "a" )
-- a --> b <-----------> c
--        \           /
--         <--> d <-->
t( tostr( g, nodes ), "0100 0011 0101 0110" )

g = rmedge( g, "d", "b", false )
-- a --> b <----------> c
--        \           /
--         --> d <-->
t( tostr( g, nodes ), "0100 0011 0101 0010" )

g = rmedge( g, "d", "c", true )
-- a --> b <----------> c
--        \
--         --> d
t( tostr( g, nodes ), "0100 0011 0100 0000" )

g = rmedge( g, "b", "c", true )
-- a --> b --> d
-- [ c ]
t( tostr( g, nodes ), "0100 0001 0000 0000" )

g = rmedge( g, "x", "y" ) -- even the nodes not exist
t( tostr( g, nodes ), "0100 0001 0000 0000" )

t()
