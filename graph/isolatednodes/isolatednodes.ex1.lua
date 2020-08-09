local t = require( "taptest" )
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local isolatednodes = require( "isolatednodes" )
local like = require( "like" )

local g = buildgraph( { "a", "b", "c", "x" }, {} )
t( like( isolatednodes( g ), { "a", "b", "c", "x" } ), true )

addedge( g, "a", "x" )
-- a --> x
-- [ b ] [ c ]
t( like( isolatednodes( g ), { "b", "c" } ), true )

addedge( g, "b", "c" )
-- a --> x
-- b --> c
t( like( isolatednodes( g ), {} ), true )

t()
