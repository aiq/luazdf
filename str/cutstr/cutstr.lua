--ZFUNC-cutstr-v1
local function cutstr( str, n ) --> left, right
   return str:sub( 1, n ), str:sub( n + 1, #str )
end

return cutstr
