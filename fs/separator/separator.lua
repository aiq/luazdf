--ZFUNC-separator-v1
local function separator() --> sep
   return _G.package.config:sub( 1, 1 )
end

return separator
