--ZFUNC-rmcmdline-v1
local function rmcmdline( system, options ) --> cmdline
   local exec_unix = function( options )
      local cmd = {}
      table.insert( cmd, "rm" )
      if options.recursive then table.insert( cmd, "-r" ) end
      if options.force then table.insert( cmd, "-f" ) end
      return table.concat( cmd, " " )
   end

   local exec_win = function( options, files )
      local cmd = {}
      if options.recursive then
         table.insert( cmd, "rd" )
         table.insert( cmd, "/s" )
      else
         table.insert( cmd, "del" )
      end
      if options.force then table.insert( cmd, "/q" ) end
      return table.concat( cmd, " " )
   end

   options = options or {}

   if system.unix then
      return exec_unix( options )
   elseif system.windows then
      return exec_win( options )
   end

   return nil
end

return rmcmdline

