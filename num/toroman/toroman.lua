--ZFUNC-toroman-v1
local function toroman( num, mode ) --> roman
   mode = mode or 0
   if num < 1 or num > 3999 then return "" end

   local chars = { "M", "D", "C", "L", "X", "V", "I" }
   local vals = { 1000, 500, 100,  50,  10,   5,   1 }
   local sidx =  {   3,   3,   5,   5,   7,   7 }
   local last = #vals
   
   local roman = {}
   while num > 0 do
      local i = 1
      while i <= last do
         local v = vals[ i ]
         if num >= v then
            num = num - v
            table.insert( roman, chars[ i ] )
            i = last + 1
         else
            local j = math.min( sidx[ i ] + mode, last )
            local n = sidx[ i ]
            while j >= n do
               local v2 = v - vals[ j ]
               if num >= v2 then
                  num = num - v2
                  table.insert( roman, chars[ j ] )
                  table.insert( roman, chars[ i ] )
                  i = last + 1
                  j = 1
               else
                  j = j - 1
               end
            end

            i = i + 1
         end
      end
   end

   return table.concat( roman )
end

return toroman
