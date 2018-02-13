--ZFUNC-repeatedly-v1
local function repeatedly( n, f, ... ) --> tab
   local res = {}
   for i = 1,n do
      table.insert( res, f( ... ) )
   end
   return res
end

return repeatedly
