local t = require "taptest"
local isreadable = require "isreadable"

io.open( "isreadable.txt", "wb" ):close()
t( isreadable( "isreadable.txt" ), true )

os.remove( "isreadable.txt" )
t( isreadable( "isreadable.txt" ), false )

t()
