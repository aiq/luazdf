--ZFUNC-map-v1
local function map( arr, fv ) --> newarr
   local newarr = {}
   for i,v in ipairs( arr ) do
      table.insert( newarr, fv( v ) )
   end
   return newarr
end

return map
