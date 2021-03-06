--ZFUNC-filename-v1
local function filename( path ) --> name
   --ZFUNC-basename-v1
   local function basename( path, ext )
      --ZFUNC-rmsuffix-v1
      local function rmsuffix( str, suffix )
         local suffixlen = string.len( suffix )
         local endsub = string.sub( str, -suffixlen )
         if endsub == suffix then
            local n = string.len( str ) - suffixlen
            return string.sub( str, 1, n )
         else
            return str
         end
      end

      local i = #path
      local c = string.sub( path, i, i )
      while i > 0 and c ~= "/" do
         i = i - 1
         c = string.sub( path, i, i )
      end

      local name = path
      if i ~= 0 then name = string.sub( path, i+1 ) end

      if ext then
         return rmsuffix( name, ext )
      else
         return name
      end
   end

   --ZFUNC-extname-v1
   local function extname( path )
      local i = #path
      local c = string.sub( path, i, i )
      while i > 0 and c ~= "." do
         i = i - 1
         c = string.sub( path, i, i )
         if c == "/" then return "" end
      end

      if i == 0 then return "" end --empty path

      return string.sub( path, i )
   end

   return basename( path, extname( path ) )
end

return filename

