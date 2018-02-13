--ZFUNC-strlstlen-v1
local function strlstlen( lst ) --> len
   local len = 0
   for _, str in ipairs( lst ) do
      len = len + string.len( str )
   end
   return len
end

return strlstlen
