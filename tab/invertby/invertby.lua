--ZFUNC-invertby-v1
local function invertby( tab, fv ) --> itab
   local itab = {}
   for k, v in pairs( tab ) do
      local ik = v
      if fv then ik = fv( v ) end
      itab[ ik ] = itab[ ik ] or {}
      table.insert( itab[ ik ], k )
   end
   return itab
end

return invertby
