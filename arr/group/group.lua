--ZFUNC-group-v1
local function group( arr, fv ) --> multiset
   local multiset = {}

   for i, v in ipairs( arr ) do
      local k = fv( v )
      if multiset[ k ] == nil then multiset[ k ] = {} end
      table.insert( multiset[ k ], v )
   end

   return multiset
end

return group
