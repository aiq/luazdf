local t = require( "tapered" )
local lines = require( "lines" )

str = "a\nbcdef\ngh\n\n123"

tab = {}
for l in lines( str ) do
   table.insert( tab, l )
end

t.same( { "a", "bcdef", "gh", "", "123" }, tab )

t.done()
