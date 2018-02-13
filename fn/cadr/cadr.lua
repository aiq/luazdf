--ZFUNC-cadr-v1
local function cadr( arr ) --> val
   if not arr then return nil end

   return arr[ 2 ]
end

return cadr
