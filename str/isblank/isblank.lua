--ZFUNC-isblank-v1
local function isblank( str ) --> res, idx
   local n = #str
   if n == 0 then return false, 0 end

   for idx = 1, n do
      local c = str:sub( idx, idx )
      if c ~= "\t" and c ~= " " then
         return false, idx
      end
   end

   return true
end

return isblank
