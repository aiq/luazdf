
local intern = require 'intern'
local t = require 'taptest'

local function diff( a, b ) return a ~= b end

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

-- Garbage collection test

-- Check if the current lua version supports garbage collection metamethod
local has_gc_meta
setmetatable({},{__gc=function()has_gc_meta=true end})
collectgarbage('collect')
local function skipon51(a, b)
  if has_gc_meta then return a == b end
  return true, 'skipped'
end

local gccount = 0
local x = int( true, false )
x = setmetatable( x, {__gc=function(t) gccount = gccount + 1 end} )

-- No collection if some reference is still around
collectgarbage('collect')
t( gccount, 0, skipon51 )

-- Automatic collection
x = nil
collectgarbage('collect')
t( gccount, 1, skipon51 )

t()

