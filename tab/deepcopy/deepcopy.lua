--ZFUNC-deepcopy-v1
local function deepcopy( tab ) --> copy
   if type( tab ) ~= "table" then return tab end
	local mt = getmetatable( tab )
	local copy = {}
	for k, v in pairs( tab ) do
		if type( v ) == "table" then v = deepcopy( v ) end
		copy[ k ] = v
	end
	setmetatable( copy, mt )
	return copy
end

return deepcopy
