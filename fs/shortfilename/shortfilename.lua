--ZFUNC-shortfilename-v1
local function shortfilename( path ) --> name
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

   --ZFUNC-longextname-v1
   local function longextname( path )
      local i = #path
      local doti = nil
      local c = string.sub( path, i, i )
      while i > 0 and c ~= "/" do
         i = i - 1
         c = string.sub( path, i, i )
         if c == "." then doti = i end
      end

      if doti then return string.sub( path, doti ) end

      return ""
   end

   return basename( path, longextname( path ) )
end

return shortfilename
