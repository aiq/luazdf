--ZFUNC-acoth-v1
local function acoth( x ) --> res
   return 0.5 * math.log( ( x+1 ) / ( x-1 ) )
end

return acoth
