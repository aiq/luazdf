--ZFUNC-utf8codes-v1
local function utf8codes( str ) --> iter
   return str:gmatch( "[%z\1-\127\194-\244][\128-\191]*" )
end

return utf8codes
