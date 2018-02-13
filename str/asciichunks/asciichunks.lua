--ZFUNC-asciichunks-v1
local function asciichunks( str, length ) --> chunks
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

return asciichunks
