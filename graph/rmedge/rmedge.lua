--ZFUNC-rmedge-v1
local function rmedge( graph, from, to, undirected ) --> graph
   if not graph[ from ] then return graph end
   if not graph[ to ] then return graph end
   graph[ from ][ to ] = nil
   if undirected then
      graph[ to ][ from ] = nil
   end
   return graph
end

return rmedge
