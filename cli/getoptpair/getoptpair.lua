--ZFUNC-getoptpair-v1
local function getoptpair( args, name ) --> opt, val, rest
   if #args == 0 then
      return nil, nil, args
   end

   local pair = args[ 1 ]

   local i = string.find( pair, "=" )
   if not i then
      return nil, nil, args
   end

   local opt, val = string.sub( pair, 1, i-1 ), string.sub( pair, i+1 )
   if #opt == 0 or #val == 0 then
      return nil, nil, args
   end

   if name and opt ~= name then
      return nil, nil, args
   end

   local rest = {}
   for i = 2, #args do table.insert( rest, args[ i ] ) end

   return opt, val, rest
end

return getoptpair
