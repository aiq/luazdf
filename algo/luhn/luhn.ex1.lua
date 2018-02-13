local t = require( "tapered" )
local luhn = require( "luhn" )

-- examples http://rosettacode.org/wiki/Luhn_test_of_credit_card_numbers
t.ok( luhn( "49927398716" ) )
t.nok( luhn( "49927398717" ) )
t.nok( luhn( "1234567812345678" ) )
t.ok( luhn( "1234567812345670" ) )

t.done()
