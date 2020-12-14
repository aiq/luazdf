local t = require( "taptest" )
local readargsfile = require( "readargsfile" )
local writefile = require( "writefile" )

t( writefile( "readargsfile.args", [[

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

]] ), true )

args, err = readargsfile( "readargsfile.args" )
t( #args, 10 )
t( args[  1 ], "--longopt" )
t( args[  2 ], "value" )
t( args[  3 ], "-opt" )
t( args[  4 ], "file name with spaces.txt" )
t( args[  5 ], "--para=pval" )
t( args[  6 ], "--arg=Full" )
t( args[  7 ], "--fs" )
t( args[  8 ], "sys rem" )
t( args[  9 ], "-para=hello world" )
t( args[ 10 ], "lorem ipsum lorem ipsum\t123\t456\nmuspi merol" )

os.remove( "example.args" )

t()
