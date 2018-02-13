--ZFUNC-findif-v1
local function findif( arr, fv, init ) --> v, i
   init = init or 1
   for i = init, #arr do
      local v = arr[ i ]
      if fv( v ) then return v, i end
   end
   return nil, nil
end

return findif
