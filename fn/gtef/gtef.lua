--ZFUNC-gtef-v1
local function gtef( val ) --> func
   return function ( oth )
      return oth >= val
   end
end

return gtef
