--ZFUNC-notf-v1
local function notf( f ) --> mfunc
   return function ( ... )
      return not f( ... )
   end
end

return notf
