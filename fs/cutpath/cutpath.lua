--ZFUNC-cutpath-v1
local function cutpath( path ) --> dirname, basename
   --ZFUNC-cutstr-v1
   local function cutstr( str, n )
      return str:sub( 1, n ), str:sub( n + 1, #str )
   end

   local i = #path
   local c = string.sub( path, i, i )
   while i > 0 and c ~= "/" do
      i = i - 1
      c = string.sub( path, i, i )
   end

   if i == 0 then return "", path end

   return cutstr( path, i )
end

return cutpath
