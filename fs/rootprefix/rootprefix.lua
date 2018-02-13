--ZFUNC-rootprefix-v1
local function rootprefix( path ) --> prefix
   local remote = path:match[[^//%w+/]] or path:match[[^\\%w+\]]
   if remote then return remote end

   local unix = path:sub( 1, 1 )
   if unix == "/" then return unix end

   local win = path:match[=[^[a-zA-Z]:[\\/]]=]
   if win then return win end

   return ""
end

return rootprefix
