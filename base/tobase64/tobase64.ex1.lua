local t = require( "taptest" )
local tobase64 = require( "tobase64" )

--should work with wikipedia examples
-- http://en.wikipedia.org/wiki/Base64
t( tobase64( "Man" ), "TWFu" )
t( tobase64( "leasure." ), "bGVhc3VyZS4=" )
t( tobase64( "pleasure." ), "cGxlYXN1cmUu")
t( tobase64( "easure." ), "ZWFzdXJlLg==")
t( tobase64( "sure." ), "c3VyZS4=")

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

t( tobase64( longtxt ), long64 )

-- http://en.wikipedia.org/wiki/Base64#Padding
t( tobase64( "any carnal pleas" ), "YW55IGNhcm5hbCBwbGVhcw==" )
t( tobase64( "any carnal pleasu" ), "YW55IGNhcm5hbCBwbGVhc3U=" )
t( tobase64( "any carnal pleasur" ), "YW55IGNhcm5hbCBwbGVhc3Vy" )

t()
