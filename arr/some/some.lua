--ZFUNC-some-v1
local function some( arr, fv ) --> res
   for i, v in ipairs( arr ) do
      if fv( v ) then return true end
   end
   return false
end

return some
