--ZFUNC-clear-v1
local function clear( tab ) --> slimtab
   for k in pairs( tab ) do
      tab[ k ] = nil
   end
   return tab
end

return clear
