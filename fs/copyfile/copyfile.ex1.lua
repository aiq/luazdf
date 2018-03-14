local t = require "taptest"
local copyfile = require "copyfile"
local readfile = require "readfile"
local writefile = require "writefile"

local inpath = "intmp.txt"
local outpath = "outtmp.txt"
local data = ( "01f" ):rep( 512 )

writefile( inpath, data )
t( copyfile( inpath, outpath ), true )
t( readfile( outpath ), data )

os.remove( inpath )
os.remove( outpath )

t()
