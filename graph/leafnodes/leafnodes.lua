--ZFUNC-leafnodes-v1
local function leafnodes( graph ) --> nodes
   --ZFUNC-isempty-v1
   local function isempty( tab )
      for _, v in pairs( tab ) do return false end
      return true
   end

   local parents = {}
   for node, edges in pairs( graph ) do
      for other in pairs( edges ) do
         local n = parents[ other ] or 0
         parents[ other ] = n+1
      end
   end
   local nodes = {}
   for node, edges in pairs( graph ) do
      if parents[ node ] == 1 and isempty( edges ) then
         table.insert( nodes, node )
      end
   end
   return nodes
end

return leafnodes
