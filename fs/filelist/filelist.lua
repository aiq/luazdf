--ZFUNC-filelist-v1
local function filelist( tree, root )
   local list = {}

   for name, v in pairs( tree ) do
      if type( v ) == "table" then
         local path = root and root.."/"..name or name
         local sublist = filelist( v, path )
         for _, file in ipairs( sublist ) do
            table.insert( list, file )
         end
      elseif type( v ) == "string" and v ~= "" then
         local file = root and root.."/"..v or v
         table.insert( list, file )
      end
   end

   return list;
end

return filelist
