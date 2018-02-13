--ZFUNC-unwrap-v1
local function unwrap( arr, i, j ) --> ...
   local unpack = unpack or table.unpack
   return unpack( arr, i, j )
end

return unwrap
