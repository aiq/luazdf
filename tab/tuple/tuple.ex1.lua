
local tuple = require 'tuple'
local t = require 'taptest'

local function diff( a, b ) return a ~= b end
local function GC()
  local c = os.clock() while os.clock()<c+0.5 do collectgarbage() end
end

-- Equality operation
t( type(tuple(1,'a',true,3)), 'function' )
t( tuple(1,'a',true,3), tuple(1,'a',true,3) )

-- Read fields
local a, b, c, d = tuple(1,'a',true,3)()
t( a, 1 )
t( b, 'a' )
t( c, true )
t( d, 3 )

-- Store nil and NaN
a, b, c, d = tuple(1,nil,0/0,3)()
t( a, 1 )
t( b, nil )
t( c, c, diff )
t( d, 3 )

-- No collection if some reference is still around
local r =  tuple(2,nil,0/0,4)
GC()
t( tuple(2,nil,0/0,4), r )

-- Automatic collection
r = nil
GC()
t( tostring(tuple(2,nil,0/0,4)), rstr, diff )

t()

