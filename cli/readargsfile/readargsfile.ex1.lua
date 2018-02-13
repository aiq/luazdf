local t = require( "tapered" )
local readargsfile = require( "readargsfile" )

local writefile = require( "writefile" )

t.ok( writefile( "example.args", [[

--longopt
value
# comment
-opt
file name with spaces.txt

# other comment
--para=
| pval
--arg
|= Full

$ --fs "sys rem" -para="hello world"

# flow text
lorem ipsum
|s lorem ipsum
|t 123
|t 456
|n muspi merol

]]) )

args, err = readargsfile( "example.args" )
t.is( #args, 10 )
t.is( args[  1 ], "--longopt" )
t.is( args[  2 ], "value" )
t.is( args[  3 ], "-opt" )
t.is( args[  4 ], "file name with spaces.txt" )
t.is( args[  5 ], "--para=pval" )
t.is( args[  6 ], "--arg=Full" )
t.is( args[  7 ], "--fs" )
t.is( args[  8 ], "sys rem" )
t.is( args[  9 ], "-para=hello world" )
t.is( args[ 10 ], "lorem ipsum lorem ipsum\t123\t456\nmuspi merol" )

os.remove( "example.args" )

t.done()
