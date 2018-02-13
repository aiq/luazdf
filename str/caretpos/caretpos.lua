--ZFUNC-caretpos-v1
local function caretpos( str, line, col ) --> idx
   --ZFUNC-lines-v1
   local function lines( str )
      if not str:find( "\n$" ) then str = str.."\n" end
      return str:gmatch( "([^\n]*)\n" )
   end

   if line < 1 then line = 1 end
   if col < 1 then col = 1 end

   local idx = 0
   local count = 1
   for l in lines( str ) do
      local lsize = #l
      
      if count == line then
         if col > lsize then
            return idx + lsize + count - 1
         else
            return idx + col + count - 1
         end
      else
         idx = idx + lsize
      end

      count = count + 1
   end

   return idx + count - 1
end

return caretpos
