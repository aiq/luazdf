--ZFUNC-iswindowsname-v1
local function iswindowsname( name ) --> res, i
   --ZFUNC-buildset-v1
   local function buildset( arr )
      local res = {}
      for _, v in ipairs( arr ) do res[ v ] = true end
      return res
   end

   if #name == 0 then return false, 1 end

   local index = string.find( name, [=[[%z<>:"/\|?*]]=] )
   if not index then index = string.find( name, "^ " ) end
   if not index then index = string.find( name, " $" ) end
   if not index then index = string.find( name, "%.$" ) end

   if not index then
      local reserved = buildset{ "CON", "PRN", "AUX", "NUL",
                                 "COM1", "COM2", "COM3", "COM4",
                                 "COM5", "COM6", "COM7", "COM8", "COM9",
                                 "LPT1", "LPT2", "LPT3", "LPT4",
                                 "LPT5", "LPT6", "LPT7", "LPT8", "LPT9" }
      if reserved[ name ] then return false, 1 end
   end

   if index then return false, index
   else return true, nil
   end
end

return iswindowsname

