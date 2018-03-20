
local intern = require 'intern'
local t = require 'taptest'

local function diff( a, b ) return a ~= b end
local function GC()
  local c = os.clock() while os.clock()<c+0.5 do collectgarbage() end
end

t( type( intern() ), 'function' )

local int = intern()

t( type( int( 1 )), 'table' )
t( int( 1 ), int( 2 ), diff )

t( type( int( 1, nil, 0/0, 3 )), 'table' )
t( int( 1, nil, 0/0, 3 ), int( 1, nil, 0/0, 3 ))

t( int( 1, nil, 0/0, 3 ), int( 1, nil, 0/0 ), diff )
t( int( 1, nil, 0/0, 3 ), int( 1, nil ), diff )
t( int( 1, nil, 0/0, 3 ), int( 1 ), diff )
  
t( int( 1, nil, 0/0, 3 ), int( 1, nil, 0/0, 2 ), diff)
t( int( 1, nil, 0/0, 3 ), int( 1, nil, 0, 3 ), diff)
t( int( 1, nil, 0/0, 3 ), int( 1, '', 0/0, 3 ), diff)
t( int( 1, nil, 0/0, 3 ), int( 4, nil, 0/0, 3 ), diff)

-- Multiple store
local alt = intern()
t( type( alt( 1, nil, 0/0, 3 )), 'table' )
t( alt( 1, nil, 0/0, 3 ), alt( 1, nil, 0/0, 3 ))
t( alt( 1, nil, 0/0, 3 ), int( 1, nil, 0/0, 3 ), diff )

-- No collection if some reference is still around
local x = int( true, false )
local xstr = tostring( x )
GC()
t( xstr, tostring( int( true, false )))

-- Automatic collection
x = nil
GC()
t( xstr, tostring( int( true, false )), diff )

t()

