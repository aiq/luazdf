--ZFUNC-caddr-v1
local function caddr( arr ) --> val
   if not arr then return nil end

   return arr[ 3 ]
end

return caddr
