local t = require( "taptest" )
local mint = require( "mint" )

local function contain( a, b )
  return nil ~= a:find( b, 1, 'plain' )
end

-- Blank templates are not touched
local m = mint( "ok" )
t( 'ok', m{} )

-- Lua expression expansion with @{}
m = mint( "@{item.a} @{item.b:upper()}" )
t( 'a B', m{ item = { a = 'a', b = 'b' } } )
t( 'B A', m{ item = { a = 'B', b = 'a' } } )

-- Mix lua statements and text with @{{}}
m = mint( "@{{for i=1,3 do}} hello @{item}!@{{end}}" )
t( ' hello world! hello world! hello world!', m{ item = 'world' } )

-- Use the output function to expand text from complex lua code
m = mint( "@{{for i=1,3 do o(' hello '..item..'!') end}}", 'o' )
t( ' hello dude! hello dude! hello dude!', m{ item = 'dude' } )

-- Last text appending
m = mint( "@{'true'} ok" )
t( 'true ok', m{} )

-- Value cast in the output function
m = mint( "@{true} ok" )
t( 'true ok', m{} )

-- The script is reported when a compile error is found
m = mint( "@{{][}}" )
local s, e = m{}
t( s, nil )
t( e, 'Template script: ', contain )
t( e, '_o("")][ _o("")', contain )

-- The script is reported when a running error is found
m = mint( "@{{undefined_function()}}" )
local s, e = m{}
t( s, nil )
t( e, 'Template script: ', contain )
t( e, '_o("")undefined_function() _o("")', contain )

-- Nested template
local s = {}
function s.nestcall()
  return mint( "@{'B'}" )( s )
end
t( mint( "@{nestcall()}@{nestcall()}" )( s ), 'BB' )

t()

