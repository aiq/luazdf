local t = require( "tapered" )
local tocrockford32 = require( "tocrockford32" )

-- https://github.com/ingydotnet/crockford-py/blob/master/tests/test_functions.py
t.is( tocrockford32( "foo" ), "CSQPY" )

-- https://github.com/aiq/basexx/issues/3
t.is( string.lower( tocrockford32( "Hello World" ) ), "91jprv3f41bpywkccg" )
t.is( tocrockford32( "Wow, it really works!" ), "AXQQEB10D5T20WK5C5P6RY90EXQQ4TVK44" )

t.done()
