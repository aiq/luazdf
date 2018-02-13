--ZFUNC-difference-v1
local function difference( a, b ) --> res
   --ZFUNC-indexof-v1
   local function indexof( arr, val, startidx )
      startidx = startidx or 1
      for i = startidx, #arr do
         local v = arr[ i ]
         if v == val then return i end
      end
      return nil
   end

   local res = {}
   for _, v in ipairs( a ) do
      if not indexof( b, v ) then table.insert( res, v ) end
   end
   return res
end

return difference
