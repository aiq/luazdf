
local tt = require 'taptest'
local ii = require 'isinteger'

tt( ii(1),    true )
tt( ii(0),    true )
tt( ii(1.1),  false )
tt( ii('1'),  false )
tt( ii(true), false )
tt( ii({1}),  false )
tt( ii(),     false )

tt( )

