--ZFUNC-isdodd-v1
local function isdodd( e ) --> res
   if e == "." or e == ".." then
      return true
   end

   return false
end

return isdodd
