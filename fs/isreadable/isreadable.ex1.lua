
local tt = require 'taptest'
local ir = require 'isreadable'

os.remove('read_test.txt')

tt( ir( 'read_test.txt' ), false )

io.open('read_test.txt', 'wb'):close()

tt( ir( 'read_test.txt' ), 'read_test.txt' )

os.remove('read_test_b.txt')

tt( ir( 'read_test_b.txt'), false )
tt( ir( 'read_test_b.txt', 'read_test.txt'),   'read_test.txt' )
tt( ir( 'read_test.txt',   'read_test_a.txt'), 'read_test.txt' )

tt( )

