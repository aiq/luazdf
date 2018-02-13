local t = require( "tapered" )
local buildgraph = require( "buildgraph" )
-- util functions
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
t.ok( like( keys( g ), { "a", "b", "c", "d", "e" } ) )
t.ok( like( keys( g[ "a" ] ), { "b" } ) )
t.ok( like( keys( g[ "b" ] ), { "c", "d" } ) )
t.ok( like( keys( g[ "c" ] ), { "e" } ) )
t.ok( like( keys( g[ "d" ] ), {} ) )
t.ok( like( keys( g[ "e" ] ), {} ) )

g = buildgraph( nodes, edges, false )
t.ok( like( keys( g ), { "a", "b", "c", "d", "e" } ) )
t.ok( like( keys( g[ "a" ] ), { "b" } ) )
t.ok( like( keys( g[ "b" ] ), { "c", "d" } ) )
t.ok( like( keys( g[ "c" ] ), { "e" } ) )
t.ok( like( keys( g[ "d" ] ), {} ) )
t.ok( like( keys( g[ "e" ] ), {} ) )

g = buildgraph( nodes, edges, true )
t.ok( like( keys( g ), { "a", "b", "c", "d", "e" } ) )
t.ok( like( keys( g[ "a" ] ), { "b" } ) )
t.ok( like( keys( g[ "b" ] ), { "a", "c", "d" } ) )
t.ok( like( keys( g[ "c" ] ), { "b", "e" } ) )
t.ok( like( keys( g[ "d" ] ), { "b" } ) )
t.ok( like( keys( g[ "e" ] ), { "c" } ) )

t.done()
