--ZFUNC-numseq-v1
local function numseq( n, init, f ) --> seq
   init = init or 0
   f = f or function ( v )
      return v + 1
   end

   local result = {}
   table.insert( result, init )
   for i = 2,n do
      table.insert( result, f( result[ i - 1 ] ) )
   end

   return result
end

return numseq
