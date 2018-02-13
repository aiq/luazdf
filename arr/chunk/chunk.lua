--ZFUNC-chunk-v1
local function chunk( arr, size )
   local chunks = {}

   local full_packs = math.floor( #arr / size )
   for i = 1, full_packs do
      local sub = {}
      local b = ( i * size ) - ( size - 1 )
      local e = i * size
      for idx = b, e do
         table.insert( sub, arr[ idx ] )
      end
      table.insert( chunks, sub )
   end

   return chunks
end

return chunk
