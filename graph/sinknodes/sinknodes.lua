--ZFUNC-sinknodes-v1
local function sinknodes( graph ) --> nodes
   --ZFUNC-isempty-v1
   local function isempty( tab )
      for _, v in pairs( tab ) do return false end
      return true
   end

   local connected = {}
   for node, edges in pairs( graph ) do
      for other in pairs( edges ) do
         connected[ node ] = true
         connected[ other ] = true
      end
   end
   local nodes = {}
   for node, edges in pairs( graph ) do
      if connected[ node ] and isempty( edges ) then
         table.insert( nodes, node )
      end
   end
   return nodes
end

return sinknodes
