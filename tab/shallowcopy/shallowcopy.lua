--ZFUNC-shallowcopy-v1
local function shallowcopy( tab ) --> copy
   if type( tab ) ~= "table" then return tab end

   local copy = {}
   for k, v in pairs( tab ) do
      copy[ k ] = v
   end

   return copy
end

return shallowcopy
