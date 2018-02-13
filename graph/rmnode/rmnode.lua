--ZFUNC-rmnode-v1
local function rmnode( graph, node ) --> graph
   graph[ node ] = nil
   for other, edges in pairs( graph ) do
      graph[ other ][ node ] = nil
   end
   return graph
end

return rmnode
