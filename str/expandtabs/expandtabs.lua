--ZFUNC-expandtabs-v1
local function expandtabs( str, tabsize ) --> nstr
   tabsize = tabsize or 8
   
   local spaces = string.rep( " ", tabsize )
   return string.gsub( str, "\t", spaces )
end

return expandtabs
