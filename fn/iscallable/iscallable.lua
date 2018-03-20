local function iscallable_rec( mask, i )

   if "function" == type( i ) then return true end

   local mt = getmetatable( i )
   if not mt then return false end
   local callee = mt.__call
   if not callee then return false end

   if mask[ i ] then return false end
   mask[ i ] = true

   return iscallable_rec( mask, callee )
end

--ZFUNC-iscallable-v0
local function iscallable( var ) --> res
   return iscallable_rec( {},  var )
end

return iscallable

