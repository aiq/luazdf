--ZFUNC-readlines-v1
local function readlines( filename ) --> strlst, err
   --ZFUNC-lines-v1
   local function lines( str )
      if not str:find( "\n$" ) then str = str.."\n" end
      return str:gmatch( "([^\n]*)\n" )
   end

   local f, err = io.open( filename, "r" )
   if err then return nil, err end

   local str, err = f:read( "*a" )
   if err then return nil, err end

   local strlst = {}
   for line in lines( str ) do
      table.insert( strlst, line )
   end

   local res, err = f:close()
   if err then return nil, err end

   return strlst
end

return readlines
