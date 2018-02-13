--ZFUNC-capexec-v1
local function capexec( cmd ) --> exit, signal, stdout, stderr
   --ZFUNC-readfile-v1
   local function readfile( filename )
      local f, err = io.open( filename, "r" )
      if err then return nil, err end

      local str, err = f:read( "*a" )
      if err then return nil, err end

      local res, err = f:close()
      if err then return nil, err end

      return str
   end
 
   local outfile = os.tmpname()
   local errfile = os.tmpname()
   cmd = cmd..[[ >"]]..outfile..[[" 2>"]]..errfile..[["]]
   local exit, signal = os.execute( cmd )
   local outcnt = readfile( outfile )
   local errcnt = readfile( errfile )
   os.remove( outfile )
   os.remove( errfile )

   return exit, signal, outcnt, errcnt
end

return capexec
