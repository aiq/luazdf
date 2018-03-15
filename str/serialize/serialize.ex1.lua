local t = require "taptest"
local serialize = require "serialize"

-- TODO : export as luazdf function
local function deepcompare( a, b, c, s )
   if not s then s = {} end
   if type( a ) ~= type( b ) then return false end
   if type( a ) ~= "table" then
      if c then return c( a, b ) end
      return a == b
   end

   if s[ a ] == b then return true end
   s[ a ] = b
   for k, v in pairs( a ) do
      local o
      for bk in pairs( b ) do
         if deepcompare( k, bk, c, s ) then
            o = b[ bk ]
            break
         end
      end
      if not o then return false end
      if not deepcompare( v, o, c, s ) then return false end
   end
   return true
end

local function reco( v )
   if loadstring then
      return loadstring( serialize( v ) )()
   else
      return load( serialize( v ) )()
   end
end

-- Simple values
t( reco( nil ), nil, deepcompare )
t( reco( true ), true, deepcompare )
t( reco( 1 ), 1, deepcompare )
t( reco( "hi" ), "hi", deepcompare )
t( reco( {} ), {}, deepcompare )

-- Table with values
t( reco( { a = true, b = { "c", 1, { d = "e" } }, } ),
         { a = true, b = { "c", 1, { d = "e" } }, },
   deepcompare )

-- Table table key
t( reco( { [ { ok = "ok" } ] = "ok", } ),
         { [ { ok = "ok" } ] = "ok", },
   deepcompare )

-- Table with reference
local atab = { a = "a" }
t( reco( { atab, a = atab, } ),
         { atab, a = atab, },
   deepcompare )

-- Table with cycle
atab = { a = {} }
atab.a.a = atab
t( reco( atab ), atab, deepcompare )

-- Too deep table
local cur = atab
for n = 1, 200 do
   cur.q = {}
   cur = cur.q
end
t( reco( atab ), atab, deepcompare )

t()

