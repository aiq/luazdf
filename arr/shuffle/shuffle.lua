--ZFUNC-shuffle-v1
local function shuffle( arr, seed ) --> rar
   if seed then math.randomseed( seed ) end
   local n = #arr
   local rar = {}
   for i, v in ipairs( arr ) do
      local r = math.random( i )
      rar[ i ] = rar[ r ]
      rar[ r ] = v
   end
   return rar
end

return shuffle
