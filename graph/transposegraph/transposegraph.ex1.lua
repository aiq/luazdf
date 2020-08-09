local t = require( "taptest" )
local addedge = require( "addedge" )
local adjmatrix = require( "adjmatrix" )
local buildgraph = require( "buildgraph" )
local matrixtostrlst = require( "matrixtostrlst" )
local transposegraph = require( "transposegraph" )

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

local g = buildgraph( nodes, edges )
-- a --> b ----------> c
--        \         /
--         --> d -->
t( tostr( g, nodes ), "0100 0011 0000 0010" )
g = transposegraph( g )
t( tostr( g, nodes ), "0000 1000 0101 0100" )
g = transposegraph( g ) -- like original graph
t( tostr( g, nodes ), "0100 0011 0000 0010" )

-- undirected graphs producing allways the same
addedge( g, "b", "a" )
addedge( g, "c", "b" )
addedge( g, "d", "b" )
addedge( g, "c", "d" )
-- a <--> b <-----------> c
--         \           /
--          <--> d <-->
t( tostr( g, nodes ), "0100 1011 0101 0110" )
g = transposegraph( g )
t( tostr( g, nodes ), "0100 1011 0101 0110" )

t()
