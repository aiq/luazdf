local t = require( "tapered" )
local leafnodes = require( "leafnodes" )
-- util functions
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local like = require( "like" )

local nodes = { "a", "b", "c", "d" }
local g = buildgraph( nodes, {} )
-- [ a ] [ b ] [ c ] [ d ]
t.ok( like( leafnodes( g ), {} ) )

g = addedge( g, "a", "b" )
-- a --> b
-- [ c ] [ d ]
t.ok( like( leafnodes( g ), { "b" } ) )

g = addedge( g, "b", "c" )
-- a --> b --> c
-- [ d ]
t.ok( like( leafnodes( g ), { "c" } ) )

g = addedge( g, "b", "d" )
-- a --> b --> c
--        \
--         --> d
t.ok( like( leafnodes( g ), { "c", "d" } ) )

g = addedge( g, "d", "c" )
-- a --> b ---------> c
--        \         /
--         --> d -->
t.ok( like( leafnodes( g ), {} ) )

t.done()
