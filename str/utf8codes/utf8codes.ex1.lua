local t = require( "tapered" )
local utf8codes = require( "utf8codes" )
-- util functions
local collectk = require( "collectk" )

local codes = collectk( utf8codes( "ÆØÅ" ) )
t.same( { "Æ", "Ø", "Å" }, codes )

t.done()
