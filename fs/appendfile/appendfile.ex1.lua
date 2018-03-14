
local appendfile = require 'appendfile'
local r = require 'readfile'
local t = require 'taptest'

os.remove( 'apptmp.txt' )

t( appendfile( 'apptmp.txt', '123' ), true )
t( r( 'apptmp.txt' ),                 '123' )
t( appendfile( 'apptmp.txt', '456' ), true )
t( r( 'apptmp.txt' ),                 '123456' )

t( appendfile( 'apptmp.txt', {'7','8'} ), true )
t( r( 'apptmp.txt' ),                     '12345678' )

t( appendfile( 'apptmp.txt', {'9','10'}, '<', '>' ), true )
t( r( 'apptmp.txt' ),                     '12345678<9><10>' )

t()

