--ZFUNC-matchesf-v1
local function matchesf( pattern ) --> func
   return function ( str )
      local i = string.find( str, pattern )
      return i ~= nil
   end
end

return matchesf
