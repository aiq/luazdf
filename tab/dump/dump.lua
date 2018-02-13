--ZFUNC-dump-v1
local function dump( tab, format )
   format = format or {}
   format.indent = format.indent or 3
   format.level = format.level or 0
   format.file = format.file or io.stdout

   local indent = format.level * format.indent
   
   for k,v in pairs( tab ) do
      format.file:write( string.rep( " ", indent )..k..":" )
      
      if type( v ) == "table" then
         format.file:write( "\n" )
         format.level = format.level + 1
         dump( v, format )
         format.level = format.level - 1
      elseif type( v ) == 'boolean' then
         format.file:write( " "..tostring( v ).."\n" )      
      else
         format.file:write( " "..v.."\n" )
      end
   end
end

return dump
