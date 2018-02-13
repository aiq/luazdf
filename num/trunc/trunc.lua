--ZFUNC-trunc-v1
local function trunc( num ) --> i
   if ( num > 0 ) then
      return math.floor( num )
   else
      return math.ceil( num )
   end
end

return trunc
