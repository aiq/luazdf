--ZFUNC-isreadable-v0
local function isreadable( path ) --> res
   local f = io.open(path, "r" )
   if not f then return false end
   f:close()
   return true
end

return isreadable
