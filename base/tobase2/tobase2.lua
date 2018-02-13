--ZFUNC-tobase2-v1
local function tobase2( str ) --> base2str
   return ( str:gsub( '.', function ( c )
               local byte = string.byte( c )
               local bits = {}
               for i = 1,8 do
                  table.insert( bits, byte % 2 )
                  byte = math.floor( byte / 2 )
               end
               return table.concat( bits ):reverse()
            end ) )
end

return tobase2
