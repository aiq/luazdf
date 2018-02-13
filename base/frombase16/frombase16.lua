--ZFUNC-frombase16-v1
local function frombase16( base16str, ignore ) --> str, err
   local errchar = "unexpected character at position %d: '%s'"

   if ignore then base16str = base16str:gsub( "["..ignore.."]", "" ) end

   local i = string.find( base16str, "[^%x]" )
   if i then
      return nil, string.format( errchar, i, string.sub( base16str, i, i ) )
   end

   return ( base16str:gsub( '..', function ( cc )
               return string.char( tonumber( cc, 16 ) )
            end ) )
end

return frombase16
