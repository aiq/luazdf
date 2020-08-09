local t = require( "taptest" )
local same = require( "same" )
local splice = require( "splice" )

-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice
-- should work like the JavaScript Array.prototype.splice function"

local fishlist = { "angel", "clown", "mandarin", "surgeon" }

local removed = splice( fishlist, 3, 0, "drum" )
t( same( fishlist, { "angel", "clown", "drum", "mandarin", "surgeon" } ), true )
t( same( removed, {} ), true )

removed = splice( fishlist, 4, 1 )
t( same( fishlist, { "angel", "clown", "drum", "surgeon" } ), true )
t( same( removed, { "mandarin" } ), true )

removed = splice( fishlist, 3, 1, "trumpet" )
t( same( fishlist, { "angel", "clown", "trumpet", "surgeon" } ), true )
t( same( removed, { "drum" } ), true )

removed = splice( fishlist, 1, 2, "parrot", "anemone", "blue" )
t( same( fishlist, { "parrot", "anemone", "blue", "trumpet", "surgeon" } ), true )
t( same( removed, { "angel", "clown" } ), true )

removed = splice( fishlist, 4, 8000 )
t( same( fishlist, { "parrot", "anemone", "blue" } ), true )
t( same( removed, { "trumpet", "surgeon" } ), true )

t()
