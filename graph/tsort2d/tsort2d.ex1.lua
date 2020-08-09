local t = require( "taptest" )
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local flatten = require( "flatten" )
local same = require( "same" )
local tsort2d = require( "tsort2d" )

local g = buildgraph( { "e" }, { { "a", "b" }, { "c", "d" } } )
-- a --> b
-- c --> d
-- [ e ]
local groups, err = tsort2d( g )
t( #groups, 2 )
table.sort( groups[ 1 ] )
table.sort( groups[ 2 ] )
t( same( flatten( groups ), { "a", "c", "b", "d", "e" } ), true )
t( err, nil )

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
t( #groups, 4 )
t( same( flatten( groups ), { "a", "x", "c", "z" } ), true )
t( err, nil )

addedge( g, "z", "a" ) -- adding circle a->x->z->a
order, err = tsort2d( g )
t( order, nil )
t( err, "Graph contains a cycle." )

t()
