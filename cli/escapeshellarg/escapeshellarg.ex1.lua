local t = require( "taptest" )
local escapeshellarg = require( "escapeshellarg" )

local function shcompare( got, expected )
   local w = require( "writefile" )
   local r = require( "readfile" )
   w( "escape_tmp.lua", [[
      for i=1,#arg do
         require'writefile'('escape_tmp'..i..'.txt',arg[i])
      end
   ]] )
   local i, luacmd = 0, "lua"
   while arg[ i ] do luacmd = arg[ i ] ; i = i -1 end
   os.execute ( luacmd..[[ escape_tmp.lua ]]..got.." x "..got.." " )
   local g1 = r( "escape_tmp1.txt" ) or ""
   local g2 = r( "escape_tmp2.txt" ) or ""
   local g3 = r( "escape_tmp3.txt" ) or ""
   local ok = g2 == "x" and g1 == g3 and g3 == expected
   return ok, not ok and "Read back ["..g1.."] ["..g2.."] ["..g3.."]"
end

t( escapeshellarg( [[Hello's world]] ),     [[Hello's world]],    shcompare )
t( escapeshellarg( [[use a " to mark]] ),   [[use a " to mark]],  shcompare )
t( escapeshellarg( [[should escape \]] ),   [[should escape \]],  shcompare )

t( escapeshellarg( [[special $PATH]] ),     [[special $PATH]],    shcompare )
t( escapeshellarg( [[special %PATH%]] ),    [[special %PATH%]],   shcompare )

t( escapeshellarg( [[redirect>o.txt]] ),    [[redirect>o.txt]],   shcompare )
t( escapeshellarg( [[redirect<i.txt]] ),    [[redirect<i.txt]],   shcompare )
t( escapeshellarg( [[pipe|extcmd]] ),       [[pipe|extcmd]],      shcompare )

os.remove( "escape_tmp.lua" )
os.remove( "escape_tmp1.txt" )
os.remove( "escape_tmp2.txt" )
os.remove( "escape_tmp3.txt" )

t()

