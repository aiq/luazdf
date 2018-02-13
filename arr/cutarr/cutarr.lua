--ZFUNC-cutarr-v1
local function cutarr( arr, n ) --> left, right
   local left = {}
   for i = 1, n do table.insert( left, arr[ i ] ) end
   local right = {}
   for i = n+1, #arr do table.insert( right, arr[ i ] ) end
   return left, right
end

return cutarr
