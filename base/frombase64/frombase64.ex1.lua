local t = require( "taptest" )
local frombase64 = require( "frombase64" )

--should work with wikipedia examples
-- http://en.wikipedia.org/wiki/Base64
t( frombase64( "TWFu" ), "Man" )
t( frombase64( "bGVhc3VyZS4=" ), "leasure." )
t( frombase64( "cGxlYXN1cmUu" ), "pleasure." )
t( frombase64( "ZWFzdXJlLg==" ), "easure." )
t( frombase64( "c3VyZS4=" ), "sure." )

local long64 = "TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb2"..
               "4sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBh"..
               "bmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYn"..
               "kgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVk"..
               "IGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLC"..
               "BleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBw"..
               "bGVhc3VyZS4="

local longtxt = "Man is distinguished, not only by his reason, but by "..
                "this singular passion from other animals, which is a "..
                "lust of the mind, that by a perseverance of delight in "..
                "the continued and indefatigable generation of knowledge, "..
                "exceeds the short vehemence of any carnal pleasure."

t( frombase64( long64 ), longtxt )

-- http://en.wikipedia.org/wiki/Base64#Padding
t( frombase64( "YW55IGNhcm5hbCBwbGVhcw==" ), "any carnal pleas" )
t( frombase64( "YW55IGNhcm5hbCBwbGVhc3U=" ), "any carnal pleasu" )
t( frombase64( "YW55IGNhcm5hbCBwbGVhc3Vy" ), "any carnal pleasur" )

t()
