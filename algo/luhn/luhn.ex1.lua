local t = require( "taptest" )
local luhn = require( "luhn" )

-- examples http://rosettacode.org/wiki/Luhn_test_of_credit_card_numbers
t( luhn( "49927398716" ), true )
t( luhn( "49927398717" ), false )
t( luhn( "1234567812345678" ), false )
t( luhn( "1234567812345670" ), true )

t()
