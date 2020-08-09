local t = require( "taptest" )
local adjmatrix = require( "adjmatrix" )
local buildgraph = require( "buildgraph" )
local matrixtostrlst = require( "matrixtostrlst" )

local function tostr( matrix )
   return table.concat( matrixtostrlst( matrix, "%d", "" ), " " )
end

local nodes = { "a", "b", "c", "d" }
local edges = {
   { "a", "b" },
   { "b", "c" },
   { "b", "d" },
   { "d", "c" }
}

local g = buildgraph( nodes, edges )
-- a --> b ---------> c
--        \         /
--         --> d -->
local m = adjmatrix( g, nodes )
t( tostr( m ), "0100 0011 0000 0010" )

m = adjmatrix( g, { "a", "b", "c" } )
t( tostr( m ), "010 001 000" )

t()
