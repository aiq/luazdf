--ZFUNC-writelines-v1
local function writelines( filename, strlst ) --> res, err
   local f, err = io.open( filename, "w" )
   if err then return nil, err end

   for _, str in ipairs( strlst ) do
      local wres, err = f:write( str, "\n" )
      if err then return nil, err end
   end

   return f:close()
end

return writelines
