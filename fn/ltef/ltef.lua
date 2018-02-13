--ZFUNC-ltef-v1
local function ltef( val ) --> func
   return function ( oth )
      return oth <= val
   end
end

return ltef
