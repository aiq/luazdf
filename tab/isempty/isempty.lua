--ZFUNC-isempty-v1
local function isempty( tab ) --> res
   for _, v in pairs( tab ) do return false end
   return true
end

return isempty
