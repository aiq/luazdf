--ZFUNC-ltf-v1
local function ltf( val ) --> func
   return function ( oth )
      return oth < val
   end
end

return ltf
