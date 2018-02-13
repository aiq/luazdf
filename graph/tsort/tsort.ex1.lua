local t = require( "tapered" )
local tsort = require( "tsort" )
-- util functions
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local occurasc = require( "occurasc" )

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

t.ok( occurasc( order, "a", "x", "c", "z" ) )
t.is( err, nil )

addedge( g, "z", "a" ) -- adding circle a->x->z->a
order, err = tsort( g )
t.is( order, nil )
t.is( err, "Graph contains a cycle." )

g = buildgraph( { "a", "b", "c" }, {} )
addedge( g, "a", "b" )
addedge( g, "a", "c" )
addedge( g, "b", "c" )
-- a ----------> c
--  \         /
--   --> b -->
order, err = tsort( g )
t.ok( occurasc( order, "a", "b", "c" ) )
t.is( err, nil )

t.done()
