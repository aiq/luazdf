
local escapeshellarg = require( "escapeshellarg" )
local t = require( "taptest" )

local function shcompare( got, expected )
  local w = require( "writefile" )
  local r = require( "readfile" )
  w( 'tmp.lua', [[
    for i=1,#arg do
      require'writefile'('tmp'..i..'.txt',arg[i])
    end
  ]] )
  local i, luacmd = 0, 'lua'
  while arg[i] do luacmd = arg[i] ; i = i -1 end
  os.execute ( luacmd .. [[ tmp.lua ]] .. got .. ' x ' .. got .. ' ' )
  local g1 = r( 'tmp1.txt' ) or ''
  local g2 = r( 'tmp2.txt' ) or ''
  local g3 = r( 'tmp3.txt' ) or ''
  local ok = g2 == 'x' and g1 == g3 and g3 == expected
  return ok, not ok and 'Read back [' .. g1 .. '] [' .. g2 .. '] [' .. g3 .. ']'
end

t( escapeshellarg( [[Hello's world]] ),     [[Hello's world]],    shcompare )
t( escapeshellarg( [[use a " to mark]] ),   [[use a " to mark]],  shcompare )
t( escapeshellarg( [[should escape \]] ),   [[should escape \]],  shcompare )

t( escapeshellarg( [[special $PATH]] ),     [[special $PATH]],    shcompare )
t( escapeshellarg( [[special %PATH%]] ),    [[special %PATH%]],   shcompare )

t( escapeshellarg( [[redirect>o.txt]] ),    [[redirect>o.txt]],   shcompare )
t( escapeshellarg( [[redirect<i.txt]] ),    [[redirect<i.txt]],   shcompare )
t( escapeshellarg( [[pipe|extcmd]] ),       [[pipe|extcmd]],      shcompare )

t()

