
--ZFUNC-readfile-v1
local function readfile( filename ) --> str, err
   local f, err = io.open( filename, "r" )
   if err then return nil, err end

   local str, err = f:read( "*a" )
   if err then return nil, err end

   local res, err = f:close()
   if err then return nil, err end

   return str
end

--ZFUNC-trim-v1
local function trim( str ) --> nstr
   local n = str:find( "%S" )
   return n and str:match( ".*%S", n ) or ""
end

--ZFUNC-findbyte-v1
local function findbyte( str, byte, init ) --> idx
   if not init then init = 1 end

   for idx = init, #str do
      if str:byte(idx) == byte then
         return idx
      end
   end

   return nil
end

local function readmxtheader( str, idx ) --> name, pat, idx
   local startBeg, startEnd = idx, findbyte(str, string.byte( ' ' ), idx)
   if not startEnd then return nil, nil, "no start line" end

   local arrowBeg, arrowEnd = str:find( "-->", startEnd+1, true )
   if not arrowBeg then return nil, nil, nil end

   local patBeg = arrowEnd + 1
   local endlIdx = findbyte( str, string.byte( '\n' ), patBeg )

   local nameBeg, nameEnd = str:find( "%S+", startEnd+1 )
   if not nameBeg or nameBeg > arrowBeg then
      return nil, nil, nil
   end

   local name = str:sub( nameBeg, nameEnd )
   local pat = str:sub( patBeg, endlIdx )
   return name, trim( pat ), endlIdx+1
end

local function startmarker( pat ) --> mrk
   if pat == "" then 
      return "//"
   else
      return "//"..pat
   end
end

--ZFUNC-readmxtfile-v2
local function readmxtfile( filepath ) --> tab, err
   local str, err = readfile( filepath )
   if err then return nil, err end

   local tab = {}

   local idx = 1
   while idx < str:len() do
      local name, pat, cntBeg = readmxtheader( str, idx )
      if not name then return nil, "invalid header" end

      local cntEnd = str:find( startmarker( pat ), cntBeg, true )
      if cntEnd then
         local content = str:sub( cntBeg, cntEnd-2 )
         tab[ name ] = content
         idx = cntEnd
      else
         local content = str:sub( cntBeg )
         tab[ name ] = content
         idx = str:len()
      end

   end

   return tab
end

return readmxtfile
