--ZFUNC-matrixtostrlst-v1
local function matrixtostrlst( matrix, format, sep ) --> strlst
   format = format or "%d"
   sep = sep or "\t"

   local strlst = {}
   for _, row in ipairs( matrix ) do 
      local line = {}
      for _, val in ipairs( row ) do
         table.insert( line, string.format( format, val ) )
      end
      table.insert( strlst, table.concat( line, sep ) )
   end
   return strlst
end

return matrixtostrlst
