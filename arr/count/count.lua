--ZFUNC-count-v1
local function count( tab, fv ) --> res
   local res = {}

   for i, v in pairs( tab ) do
      local k = fv( v )
      local base = res[ k ] or 0
      res[ k ] = base + 1
   end

   return res
end

return count
