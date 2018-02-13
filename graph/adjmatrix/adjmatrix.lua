--ZFUNC-adjmatrix-v1
local function adjmatrix( graph, order ) --> matrix
   local matrix = {}

   for x, v in ipairs( order ) do
      matrix[ x ] = {}
      for y, e in ipairs( order ) do
         if graph[ v ][ e ] then
            matrix[ x ][ y ] = 1
         else
            matrix[ x ][ y ] = 0
         end
      end
   end

   return matrix
end

return adjmatrix
