--ZFUNC-chomp-v1
local function chomp( str ) --> nstr
   return string.gsub( str, "[\n\r]*$", "" )
end

return chomp
