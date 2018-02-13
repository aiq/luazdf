--ZFUNC-accessor-v1
local function accessor( tab, mkpath, ... ) --> acsr
   local path = { ... }

   local acsr = { parent=nil, value=tab, key=nil }
   
   for i, k in ipairs( path ) do
      if not acsr.value[ k ] and i ~= #path then
         if mkpath then acsr.value[ k ] = {} else return nil end
      end
      acsr.parent = acsr.value
      acsr.value = acsr.value[ k ]
      acsr.key = k
   end

   acsr.get = function( self )
      return self.value
   end
   acsr.set = function( self, v )
      self.value = v
      self.parent[ self.key ] = self.value
   end

   return acsr
end

return accessor
