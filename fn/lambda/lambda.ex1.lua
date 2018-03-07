local t = require "taptest"
local lambda = require "lambda"

-- lambda-like syntax
t( 1, lambda"x|x+1"( 0 ) )

-- additional statement, only the last expression is returned
t( 3, lambda"x| x=x+1; x+1"( 1 ) )

-- default args are a,b,c,d,e,f,...( vararg )
t( 1, lambda"a+1"( 0 ) )

t()
