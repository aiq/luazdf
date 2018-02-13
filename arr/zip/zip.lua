--ZFUNC-zip-v1
local function zip( tab )

   function pluck( t, key )
      local res = {}
      for i, v in ipairs( t ) do table.insert( res, v[ key ] ) end
      return res
   end

   function max( t )
      local res = 0
      for i, v in ipairs( t ) do if #v > res then res = # v end end
      return res
   end

   local res = {}

   local length = max( tab )

   for i = 1, length do
      table.insert( res, pluck( tab, i ) )
   end

  return res
end

return zip
