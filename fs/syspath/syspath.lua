--ZFUNC-syspath-v1
local function syspath( path ) --> spath
   --ZFUNC-separator-v1
   local function separator()
      return _G.package.config:sub( 1, 1 )
   end

   return path:gsub( "/", separator() )
end

return syspath
