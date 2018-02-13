--ZFUNC-isarray-v1
local function isarray( tab ) --> res
   if type( tab ) ~= "table" then return nil,"Argument is not a table! It is: "..type( tab ) end

   --check if all the table keys are numerical and count their number   
   local count = 0
   for k, v in pairs( tab ) do
      if type( k ) == "number" then count = count + 1 else return false end
   end
   
   --all keys are numerical. now let's see if they are sequential and start with 1
   for i = 1, count do
      if not tab[ i ] and type( tab[ i ] ) ~= "nil" then return false end
   end
   
   return true
end

return isarray
