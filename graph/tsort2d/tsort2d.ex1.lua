local t = require( "tapered" )
local tsort2d = require( "tsort2d" )
-- util functions
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local flatten = require( "flatten" )

local g = buildgraph( { "e" }, { { "a", "b" }, { "c", "d" } } )
-- a --> b
-- c --> d
-- [ e ]
local groups, err = tsort2d( g )
t.is( #groups, 2 )
table.sort( groups[ 1 ] )
table.sort( groups[ 2 ] )
t.same( flatten( groups ), { "a", "c", "b", "d", "e" } )
t.is( err, nil )

local edges = { 
   { "a", "x" },
   { "x", "c" },
   { "x", "z" },
   { "c", "z" }
}
g = buildgraph( {}, edges )
-- a --> x --> c
--       \      \
--        -----> --> z
groups, err = tsort2d( g )
t.is( #groups, 4 )
t.same( flatten( groups ), { "a", "x", "c", "z" } )
t.is( err, nil )

addedge( g, "z", "a" ) -- adding circle a->x->z->a
order, err = tsort2d( g )
t.is( order, nil )
t.is( err, "Graph contains a cycle." )

t.done()
