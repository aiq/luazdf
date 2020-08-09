local t = require( "taptest" )
local lines = require( "lines" )
local same = require( "same" )

str = "a\nbcdef\ngh\n\n123"

tab = {}
for l in lines( str ) do
   table.insert( tab, l )
end

t( same( { "a", "bcdef", "gh", "", "123" }, tab ), true )

t()
