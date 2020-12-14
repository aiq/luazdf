--ZFUNC-findbyte-v1
local function findbyte( str, byte, init ) --> idx
   if not init then init = 1 end

   for idx = init, #str do
      if str:byte(idx) == byte then
         return idx
      end
   end

   return nil
end

return findbyte
