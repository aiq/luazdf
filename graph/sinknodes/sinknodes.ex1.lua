local t = require( "tapered" )
local sinknodes = require( "sinknodes" )
-- util functions
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local like = require( "like" )

local nodes = { "a", "b", "c", "d" }

local g = buildgraph( nodes, {} )
t.ok( like( sinknodes( g ), {} ) )

g = addedge( g, "a", "b" )
-- a --> b
-- [ c ] [ d ]
t.ok( like( sinknodes( g ), { "b" } ) )

g = addedge( g, "b", "c" )
-- a --> b --> c
-- [ d ]
t.ok( like( sinknodes( g ), { "c" } ) )

g = addedge( g, "b", "d" )
-- a --> b --> c
--        \
--         --> d
t.ok( like( sinknodes( g ), { "c", "d" } ) )

g = addedge( g, "d", "c" )
-- a --> b ---------> c
--        \         /
--         --> d -->
t.ok( like( sinknodes( g ), { "c" } ) )

g = addedge( g, "c", "d" )
-- a --> b ---------> c
--        \         /
--         --> d <->
t.ok( like( sinknodes( g ), {} ) )

t.done()
