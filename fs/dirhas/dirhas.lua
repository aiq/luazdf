local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-dirhas-v1
local function dirhas( path, name, mode ) --> entrypath
   local modeval = lfs.attributes( path, "mode" )
   if modeval ~= "directory" then return nil end

   for entry in lfs.dir( path ) do
      if entry == name then
         local entrypath = path.."/"..entry

         if mode then
            local modeval = lfs.attributes( entrypath, "mode" )
            if modeval ~= mode then
               return nil
            end
         end

         return entrypath
      end
   end

   return nil
end

return dirhas
