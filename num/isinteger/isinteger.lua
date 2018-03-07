--ZFUNC-isinteger-v1
local function isinteger( i ) --> res
   if "number" ~= type( i ) then return false end
   local i, f = math.modf( i )
   return ( 0 == f )
end

return isinteger
