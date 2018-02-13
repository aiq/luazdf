--ZFUNC-joinpath-v1
local function joinpath( tab ) --> path
   --ZFUNC-firstchar-v1
   local function firstchar( str )
      return string.sub( str, 1, 1 )
   end

   --ZFUNC-lastchar-v1
   local function lastchar( str )
      return string.sub( str, #str )
   end

   local rooted = false
   local tmptab = {}
   for k, s in ipairs( tab ) do
      if k == 1 and firstchar( s ) == "/" then
         rooted = true
      end

      if firstchar( s ) == "/" then
         s = s:sub( 2 )
      end
      if lastchar( s ) == "/" then
         s = s:sub( 1, #s - 1 )
      end

      if #s > 0 then
         table.insert( tmptab, s )
      end
   end

   if rooted then
      return "/"..table.concat( tmptab, "/" )
   end

   return table.concat( tmptab, "/" )
end

return joinpath
