local t = require( "taptest" )
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local occurasc = require( "occurasc" )
local tsort = require( "tsort" )

local edges = { 
   { "a", "x" },
   { "x", "c" },
   { "x", "z" },
   { "c", "z" }
}
local g = buildgraph( {}, edges )
-- a --> x --> c
--       \      \
--        -----> --> z
local order, err = tsort( g )

t( occurasc( order, "a", "x", "c", "z" ), true )
t( err, nil )

addedge( g, "z", "a" ) -- adding circle a->x->z->a
order, err = tsort( g )
t( order, nil )
t( err, "Graph contains a cycle." )

g = buildgraph( { "a", "b", "c" }, {} )
addedge( g, "a", "b" )
addedge( g, "a", "c" )
addedge( g, "b", "c" )
-- a ----------> c
--  \         /
--   --> b -->
order, err = tsort( g )
t( occurasc( order, "a", "b", "c" ), true )
t( err, nil )

t()
