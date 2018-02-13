--ZFUNC-isposixname-v1
local function isposixname( name ) --> res, i
   if #name == 0 then return false, 1 end
   
   local index = string.find( name, "[^A-Za-z0-9%._%-]" )
   
   if index then return false, index
   else return true, nil
   end
end

return isposixname
