local t = require( "taptest" )
local buildgraph = require( "buildgraph" )
local keys = require( "keys" )
local like = require( "like" )

local nodes = { "a", "b", "c", "d" }

local edges = {
   { "a", "b" },
   { "b", "c" },
   { "b", "d" },
   { "c", "e" }
}

local g = buildgraph( nodes, edges )
t( like( keys( g ), { "a", "b", "c", "d", "e" } ), true )
t( like( keys( g[ "a" ] ), { "b" } ), true )
t( like( keys( g[ "b" ] ), { "c", "d" } ), true )
t( like( keys( g[ "c" ] ), { "e" } ), true )
t( like( keys( g[ "d" ] ), {} ), true )
t( like( keys( g[ "e" ] ), {} ), true )

g = buildgraph( nodes, edges, false )
t( like( keys( g ), { "a", "b", "c", "d", "e" } ), true )
t( like( keys( g[ "a" ] ), { "b" } ), true )
t( like( keys( g[ "b" ] ), { "c", "d" } ), true )
t( like( keys( g[ "c" ] ), { "e" } ), true )
t( like( keys( g[ "d" ] ), {} ), true )
t( like( keys( g[ "e" ] ), {} ), true )

g = buildgraph( nodes, edges, true )
t( like( keys( g ), { "a", "b", "c", "d", "e" } ), true )
t( like( keys( g[ "a" ] ), { "b" } ), true )
t( like( keys( g[ "b" ] ), { "a", "c", "d" } ), true )
t( like( keys( g[ "c" ] ), { "b", "e" } ), true )
t( like( keys( g[ "d" ] ), { "b" } ), true )
t( like( keys( g[ "e" ] ), { "c" } ), true )

t()
