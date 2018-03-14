--ZFUNC-appendfile-v0
local function appendfile( path, data, prefix, suffix ) --> res, err

   local function writeorclose( f, data )
      local res, err = f:write( data )
      if err then f:close() end
      return res, err
   end

   local d, derr = io.open( path, "a+b" )
   if derr then
      return nil, "Can not create or open destination file. "..derr
   end

   local ok, err = d:seek( "end" )
   if err then
      d:close()
      return nil, err
   end

   if "string" == type( data ) then
      data = { data }
   end

   -- Output loop
   for i = 1, #data do

      if prefix then
         ok, err = writeorclose( d, prefix )
         if err then return ok, err end
      end

      ok, err = writeorclose( d, data[ i ] )
      if err then return ok, err end

      if suffix then
         ok, err = writeorclose( d, suffix )
         if err then return ok, err end
      end
   end

   return d:close()
end

return appendfile

