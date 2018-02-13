--ZFUNC-escapeshellarg-v1
local function escapeshellarg( str ) --> esc
   return '"'..str:gsub( '"', '\\"' )..'"'
end

return escapeshellarg
