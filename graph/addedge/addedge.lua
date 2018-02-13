--ZFUNC-addedge-v1
local function addedge( graph, from, to, undirected ) --> graph
   graph[ from ] = graph[ from ] or {}
   graph[ to ] = graph[ to ] or {}
   graph[ from ][ to ] = true
   if undirected then
      graph[ to ][ from ] = true
   end

   return graph
end

return addedge
