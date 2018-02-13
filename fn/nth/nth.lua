--ZFUNC-nth-v1
local function nth( n ) --> func
   return function ( ... )
      local tab = { ... }
      return tab[ n ]
   end
end

return nth
