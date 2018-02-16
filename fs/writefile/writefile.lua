--ZFUNC-writefile-v1
local function writefile( filename, ... ) --> res, err
   local f, err = io.open( filename, "w" )
   if err then return nil, err end

   local wres, err = f:write( ... )
   if err then return nil, err end

   return f:close()
end

return writefile
