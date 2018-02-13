--ZFUNC-pathedges-v1
local function pathedges( path ) --> edges
   local edges = {}
   if #path < 2 then return edges end
   for n = 2, #path do
      local i = n - 1
      table.insert( edges, { path[ i ], path[ n ] } )
   end
   return edges
end

return pathedges
