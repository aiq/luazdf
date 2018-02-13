--ZFUNC-buildgraph-v1
local function buildgraph( nodes, edges, undirected ) --> graph
   local graph = {}

   for _, node in ipairs( nodes ) do
      graph[ node ] = {}
   end

   for i, edge in ipairs( edges ) do
      local x = edge[ 1 ]
      graph[ x ] = graph[ x ] or {}
      local y = edge[ 2 ]
      graph[ y ] = graph[ y ] or {}
      graph[ x ][ y ] = true
      if undirected then
         graph[ y ][ x ] = true
      end
   end

   return graph
end

return buildgraph
