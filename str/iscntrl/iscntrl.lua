--ZFUNC-iscntrl-v1
local function iscntrl( str ) --> res, idx
   local n = #str
   if n == 0 then return false, 0 end

   for idx = 1, n do
      local b = string.byte( str:sub( idx, idx ) )
      if b < 0x1f or b == 0x7f then
      else
         return false, idx
      end
   end
   
   return true
end

return iscntrl
