--ZFUNC-split-v1
local function split( str, pattern ) --> strlst
   
   --ZFUNC-asciichunks-v1
   local function asciichunks( str, length )
      length = length or 1
      local chunks = {}

      local i = 1
      local last = string.len( str )
      while i <= last do
         local j = i + length - 1
         table.insert( chunks, str:sub( i, j ) )
         i = i + length
      end

      return chunks
   end

   if str == "" then return {} end

   pattern = pattern or "%s+"
   if pattern == "" then return asciichunks( str ) end

   local strlst = {}
   local position = 1
   local s, e = string.find( str, pattern, position )

   while s do
      table.insert( strlst, string.sub( str, position, s-1 ) )
      position = e + 1
      s, e = string.find( str, pattern, position )
   end

   if position <= #str then
      table.insert( strlst, string.sub( str, position ) )
   end

   if position > #str then
      table.insert( strlst, "" )
   end

   return strlst
end

return split
