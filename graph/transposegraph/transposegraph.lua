--ZFUNC-transposegraph-v1
local function transposegraph( graph ) --> transpose
   local transpose = {}
   for node, edges in pairs( graph ) do
      transpose[ node ] = transpose[ node ] or {}
      for other in pairs( edges ) do
         transpose[ other ] = transpose[ other ] or {}
         transpose[ other ][ node ] = true
      end
   end
   return transpose
end

return transposegraph
