local t = require( "taptest" )
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local leafnodes = require( "leafnodes" )
local like = require( "like" )

local nodes = { "a", "b", "c", "d" }
local g = buildgraph( nodes, {} )
-- [ a ] [ b ] [ c ] [ d ]
t( like( leafnodes( g ), {} ), true )

g = addedge( g, "a", "b" )
-- a --> b
-- [ c ] [ d ]
t( like( leafnodes( g ), { "b" } ), true )

g = addedge( g, "b", "c" )
-- a --> b --> c
-- [ d ]
t( like( leafnodes( g ), { "c" } ), true )

g = addedge( g, "b", "d" )
-- a --> b --> c
--        \
--         --> d
t( like( leafnodes( g ), { "c", "d" } ), true )

g = addedge( g, "d", "c" )
-- a --> b ---------> c
--        \         /
--         --> d -->
t( like( leafnodes( g ), {} ), true )

t()
