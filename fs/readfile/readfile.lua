--ZFUNC-readfile-v1
local function readfile( filename ) --> str, err
   local f, err = io.open( filename, "r" )
   if err then return nil, err end

   local str, err = f:read( "*a" )
   if err then return nil, err end

   local res, err = f:close()
   if err then return nil, err end

   return str
end

return readfile
