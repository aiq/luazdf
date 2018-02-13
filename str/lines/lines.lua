--ZFUNC-lines-v1
local function lines( str ) --> iter
   if not str:find( "\n$" ) then str = str.."\n" end
   return str:gmatch( "([^\n]*)\n" )
end

return lines
