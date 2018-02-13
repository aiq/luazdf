--ZFUNC-flatten-v1
local function flatten( arr, shallow ) --> flatarr
   local flatarr = {}
   for _, v in ipairs( arr ) do
      if shallow or type( v ) ~= 'table' then
         table.insert( flatarr, v )
      else
         for _, sub_v in ipairs( flatten( v ) ) do
            table.insert( flatarr, sub_v )
         end
      end
   end
   return flatarr
end

return flatten
