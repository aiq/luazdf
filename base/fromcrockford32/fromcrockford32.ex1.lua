local t = require( "taptest" )
local fromcrockford32 = require( "fromcrockford32" )

-- https://github.com/ingydotnet/crockford-py/blob/master/tests/test_functions.py
t( fromcrockford32( "CSQPY" ), "foo" )

-- https://github.com/aiq/basexx/issues/3
t( fromcrockford32( "axqqeb10d5t20wk5c5p6ry90exqq4tvk44" ), "Wow, it really works!" )

-- ignore characters in a crockford string
t( fromcrockford32( "CSQPY\n", "\n" ), "foo" )

-- handle wrong characters without a crash
local res, err = fromcrockford32( "CSQ%PY" )
t( res, nil )
t( err, "unexpected character at position 4: '%'" )

t()
