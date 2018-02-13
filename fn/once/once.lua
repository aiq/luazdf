--ZFUNC-once-v1
local function once( f ) --> mfunc
   local executed = false
   local mfunc = nil

   return function ( ... )
      if not executed then
         mfunc = f( ... )
         executed = true
      end
      return mfunc
   end
end

return once
