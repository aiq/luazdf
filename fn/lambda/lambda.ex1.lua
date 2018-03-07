
local l = require( "lambda" )
local test = require( "taptest" )

-- lambda-like syntax
test( 1, l'x|x+1'(0) )

-- additional statement, only the last expression is returned
test( 3, l'x| x=x+1; x+1'(1) )

-- default args are a,b,c,d,e,f,...(vararg)
test( 1, l'a+1'(0) )

test()

