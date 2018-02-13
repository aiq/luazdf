--ZFUNC-isolatednodes-v1
local function isolatednodes( graph ) --> nodes
   local connected = {}
   for node, edges in pairs( graph ) do
      for other in pairs( edges ) do
         connected[ node ] = true
         connected[ other ] = true
      end
   end
   local nodes = {}
   for node in pairs( graph ) do
      if not connected[ node ] then
         table.insert( nodes, node )
      end
   end
   return nodes
end

return isolatednodes
