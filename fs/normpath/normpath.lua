--ZFUNC-splitpath-v1
local function splitpath( path )
   local tab = {}
   for token in string.gmatch( path, "[^/]+" ) do
      if #token > 0 then
         table.insert( tab, token )
      end
   end
   return tab
end
--ZFUNC-normpath-v1
local function normpath( dirty ) --> clean
   if dirty == "" then return "." end

   local rooted = dirty:sub( 1, 1 ) == "/"
   
   local dirtytab = splitpath( dirty )
   local cleantab = {}
   for k, v in ipairs( dirtytab ) do
      if v == "." then
      elseif v == ".." then
         table.remove( cleantab )
      elseif v == "" then
      else
         table.insert( cleantab, v )
      end
   end
  
   if rooted then
      return "/"..table.concat( cleantab, "/" )
   end

   return table.concat( cleantab, "/" )
end

return normpath
