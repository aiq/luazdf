--ZFUNC-tsort2d-v1
local function tsort2d( graph ) --> groups, err
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
   --ZFUNC-deepcopy-v1
   local function deepcopy( tab )
      if type( tab ) ~= "table" then return tab end
	   local mt = getmetatable( tab )
	   local copy = {}
	   for k, v in pairs( tab ) do
		   if type( v ) == "table" then v = deepcopy( v ) end
		   copy[ k ] = v
	   end
	   setmetatable( copy, mt )
	   return copy
   end
   --ZFUNC-isfilled-v1
   local function isfilled( tab )
      for _, v in pairs( tab ) do return true end
      return false
   end
   local groups = {}
   local copy = deepcopy( graph )
   local transpose = transposegraph( graph )
   while isfilled( copy ) do
      local group = {}
      for node, edges in pairs( copy ) do
         if not isfilled( edges ) then
            table.insert( group, node )
         end
      end
      for _, node in pairs( group ) do
         copy[ node ] = nil
         for parent in pairs( transpose[ node ] ) do
            copy[ parent ][ node ] = nil
         end
      end
      if not isfilled( group ) then
         return nil, "Graph contains a cycle."
      end
      table.insert( groups, 1, group )
   end
   return groups
end

return tsort2d
