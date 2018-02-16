--ZFUNC-tsort-v1
local function tsort( graph ) --> order, err
   local order = {}

   local know = {}
   for node in pairs( graph ) do
      if not know[ node ] then
         local seen = {}
         local stack = {}
         table.insert( stack, node )
         while #stack > 0 do
            local current_node = stack[ #stack ]
            if know[ current_node ] then
               table.remove( stack )
            else
               seen[ current_node ] = true
               local added = false
               for next_node in pairs( graph[ current_node ] ) do
                  if not know[ next_node ] then
                     if seen[ next_node ] then
                        return nil, "Graph contains a cycle."
                     end
                     added = true
                     table.insert( stack, next_node )
                  end
               end
               if not added then
                  table.remove( stack )
                  know[ current_node ] = true
                  table.insert( order, 1, current_node )
               end
            end
         end
      end
   end

   return order
end

return tsort
