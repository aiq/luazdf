--ZFUNC-eqf-v1
local function eqf( val ) --> func
   return function ( oth )
      return val == oth
   end
end

return eqf
