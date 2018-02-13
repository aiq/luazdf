--ZFUNC-indexof-v1
local function indexof( arr, val, init ) --> idx
   init = init or 1
   for idx = init, #arr do
      local v = arr[ idx ]
      if v == val then return idx end
   end
   return nil
end

return indexof
