--ZFUNC-isfilled-v1
local function isfilled( tab ) --> res
   for _, v in pairs( tab ) do return true end
   return false
end

return isfilled
