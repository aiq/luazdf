--ZFUNC-capinexec-v1
local function capexec( cmd, outfile, errfile ) --> exit, signal
   local outpipe = ''
   if outfile then outpipe = ' >"'..outfile'"' end
   local errpipe = ''
   if errfile then errpipe = ' 2>"'..errfile'"'
   else  errpipe = ' 2>&1' end
   return os.execute( cmd..outpipe..errpipe )
end

return capexec
