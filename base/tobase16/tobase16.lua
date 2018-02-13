--ZFUNC-tobase16-v1
local function tobase16( str ) --> base16str
   return ( str:gsub( '.', function ( c )
               return string.format('%02X', string.byte( c ) )
            end ) )
end

return tobase16
