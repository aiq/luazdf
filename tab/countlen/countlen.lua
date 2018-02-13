--ZFUNC-countlen-v1
local function countlen( tab ) --> len
   local len = 0
   for _ in pairs( tab ) do
      len = len+1
   end
   return len
end

return countlen
