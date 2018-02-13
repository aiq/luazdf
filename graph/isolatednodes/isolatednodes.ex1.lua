local t = require( "tapered" )
local isolatednodes = require( "isolatednodes" )
-- util functions
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local like = require( "like" )

local g = buildgraph( { "a", "b", "c", "x" }, {} )
t.ok( like( isolatednodes( g ), { "a", "b", "c", "x" } ) )

addedge( g, "a", "x" )
-- a --> x
-- [ b ] [ c ]
t.ok( like( isolatednodes( g ), { "b", "c" } ) )

addedge( g, "b", "c" )
-- a --> x
-- b --> c
t.ok( like( isolatednodes( g ), {} ) )

t.done()
