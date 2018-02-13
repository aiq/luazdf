--ZFUNC-countmatch-v1
local function countmatch( str, pattern, plain )
   if #pattern == 0 then return 0 end
   
   local n = 0
   local i, j = 0, 0
   repeat
      i, j = string.find( str, pattern, j+1, plain )
      if i then n = n+1 end
   until i == nil
   return n
end

return countmatch
