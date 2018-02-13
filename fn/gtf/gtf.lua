--ZFUNC-gtf-v1
local function gtf( val ) --> func
   return function ( oth )
      return oth > val
   end
end

return gtf
