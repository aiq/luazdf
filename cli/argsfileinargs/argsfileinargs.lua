--ZFUNC-argsfileinargs-v1
local function argsfileinargs( args ) --> filepath, idx, rest
   local idx = nil
   for k, v in pairs( args ) do
      if v == "--args" then
         idx = k
      end
   end

   if not idx then return nil, idx, args end

   -- we have a args parameter that should be used
   local filepath = nil
   local rest = {}
   for i = 1, #args do
      if i == idx then
         -- nothing happens --args
      elseif i == idx+1 then
         filepath = args[ i ]
      else
         table.insert( rest, args[ i ] )
      end
   end

   return filepath, idx, rest
end

return argsfileinargs
