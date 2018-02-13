--ZFUNC-frombase2-v1
local function frombase2( base2str, ignore ) --> str, err
   local bitMap = { o="0", i="1", l="1" }
   local errchar = "unexpected character at position %d: '%s'"

   if ignore then base2str = base2str:gsub( "["..ignore.."]", "" ) end
   base2str = string.lower( base2str )
   base2str = base2str:gsub( "[ilo]", function( c ) return bitMap[ c ] end )
   local i = string.find( base2str, "[^01]" )
   if i then
      return nil, string.format( errchar, i, string.sub( base2str, i, i ) )
   end

   return base2str:gsub( '........', function ( cc )
      return string.char( tonumber( cc, 2 ) )
   end )
end

return frombase2
