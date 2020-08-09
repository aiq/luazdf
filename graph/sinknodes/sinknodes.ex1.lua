local t = require( "taptest" )
local addedge = require( "addedge" )
local buildgraph = require( "buildgraph" )
local like = require( "like" )
local sinknodes = require( "sinknodes" )

local nodes = { "a", "b", "c", "d" }

local g = buildgraph( nodes, {} )
t( like( sinknodes( g ), {} ), true )

g = addedge( g, "a", "b" )
-- a --> b
-- [ c ] [ d ]
t( like( sinknodes( g ), { "b" } ), true )

g = addedge( g, "b", "c" )
-- a --> b --> c
-- [ d ]
t( like( sinknodes( g ), { "c" } ), true )

g = addedge( g, "b", "d" )
-- a --> b --> c
--        \
--         --> d
t( like( sinknodes( g ), { "c", "d" } ), true )

g = addedge( g, "d", "c" )
-- a --> b ---------> c
--        \         /
--         --> d -->
t( like( sinknodes( g ), { "c" } ), true )

g = addedge( g, "c", "d" )
-- a --> b ---------> c
--        \         /
--         --> d <->
t( like( sinknodes( g ), {} ), true )

t()
