--ZFUNC-getoptvalues-v1
local function getoptvalues( args, name, max ) --> opt, values, rest
   if #args == 0 then
      return nil, {}, args
   end

   if name and args[ 1 ] ~= name then
      return nil, {}, args
   end

   if string.sub( args[ 1 ], 1, 1 ) ~= "-" then
      return nil, {}, args
   end

   max = max or #args
   max = max+1
   if max > #args then
      max = #args
   end

   local opt = args[ 1 ]
   local values = {}
   local rest = {}
   for i = 2, #args do
      local val = args[ i ]
      if i <= max and
         #rest == 0 and
         string.sub( val, 1, 1 ) ~= "-" then
         table.insert( values, val )
      else
         table.insert( rest, val )
      end
   end

   return opt, values, rest
end

return getoptvalues
