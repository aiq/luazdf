--ZFUNC-sysinfo-v1
local function sysinfo() --> info
   local info = {}

   info.name = io.popen( "uname -s" ):read( "*l" )
   
   if info.name == "FreeBSD" then
      info.unix = true
      info.bsd = true
      info.freebsd = true
   elseif info.name == "OpenBSD" then
      info.unix = true
      info.bsd = true
      info.openbsd = true
   elseif info.name == "NetBSD" then
      info.unix = true
      info.bsd = true
      info.netbsd = true
   elseif info.name == "Darwin" then
      info.unix = true
      info.bsd = true
      info.macosx = true
   elseif info.name == "Linux" then
      info.unix = true
      info.linux = true
   elseif info.name == "SunOS" then
      info.unix = true
      info.solaris = true
   elseif info.name and info.name:match("^CYGWIN") then
      info.unix = true
      info.cygwin = true
   elseif info.name and info.name:match("^Windows") then
      info.windows = true
   elseif info.name and info.name:match("^MINGW") then
      info.windows = true
      info.mingw32 = true
   else
      info.unknown = true
   end

   return info
end

return sysinfo
