local t = require( "tapered" )
local splice = require( "splice" )

-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice
-- should work like the JavaScript Array.prototype.splice function"

local fishlist = { "angel", "clown", "mandarin", "surgeon" }

local removed = splice( fishlist, 3, 0, "drum" )
t.same( { "angel", "clown", "drum", "mandarin", "surgeon" }, fishlist )
t.same( {}, removed )

removed = splice( fishlist, 4, 1 )
t.same( { "angel", "clown", "drum", "surgeon" }, fishlist )
t.same( { "mandarin" }, removed )

removed = splice( fishlist, 3, 1, "trumpet" )
t.same( { "angel", "clown", "trumpet", "surgeon" }, fishlist )
t.same( { "drum" }, removed )

removed = splice( fishlist, 1, 2, "parrot", "anemone", "blue" )
t.same( { "parrot", "anemone", "blue", "trumpet", "surgeon" }, fishlist )
t.same( { "angel", "clown" }, removed )

removed = splice( fishlist, 4, 8000 )
t.same( { "parrot", "anemone", "blue" }, fishlist )
t.same( { "trumpet", "surgeon" }, removed )

t.done()
