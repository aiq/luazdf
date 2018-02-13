--ZFUNC-acosh-v1
local function acosh( x ) --> res
   if x < 1 then return math.sqrt( -1 ) end
   return math.log( x + math.sqrt( x+1 ) * math.sqrt( x-1 ) )
end

return acosh
