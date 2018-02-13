--ZFUNC-splitpath-v1
local function splitpath( path ) --> tab
   local tab = {}
   for token in string.gmatch( path, "[^/]+" ) do
      if #token > 0 then
         table.insert( tab, token )
      end
   end
   return tab
end

return splitpath
