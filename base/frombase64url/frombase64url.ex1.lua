local t = require( "taptest" )
local frombase64url = require( "frombase64url" )

--http://en.wikipedia.org/wiki/Base64#URL_applications
t( frombase64url( "TWFu"), "Man" )
t( frombase64url( "bGVhc3VyZS4" ), "leasure." )
t( frombase64url( "cGxlYXN1cmUu" ), "pleasure." )
t( frombase64url( "ZWFzdXJlLg" ), "easure." )
t( frombase64url( "c3VyZS4" ), "sure." )

local longtxt = "Man is distinguished, not only by his reason, but by "..
                "this singular passion from other animals, which is a "..
                "lust of the mind, that by a perseverance of delight in "..
                "the continued and indefatigable generation of knowledge, "..
                "exceeds the short vehemence of any carnal pleasure."
local long64 = "TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb2"..
               "4sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBh"..
               "bmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYn"..
               "kgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVk"..
               "IGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLC"..
               "BleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBw"..
               "bGVhc3VyZS4"
t( frombase64url( long64 ), longtxt )

local msgtxt = '{"msg_en":"Hello","msg_jp":"こんにちは","msg_cn":"你好"'..
               ',"msg_kr":"안녕하세요","msg_ru":"Здравствуйте!"'..
               ',"msg_de":"Grüß Gott"}'
local msg64 = 'eyJtc2dfZW4iOiJIZWxsbyIsIm1zZ19qcCI6IuOBk-OCk-OBq-OBoeOBryI'..
              'sIm1zZ19jbiI6IuS9oOWlvSIsIm1zZ19rciI6IuyViOuFle2VmOyEuOyalC'..
              'IsIm1zZ19ydSI6ItCX0LTRgNCw0LLRgdGC0LLRg9C50YLQtSEiLCJtc2dfZ'..
              'GUiOiJHcsO8w58gR290dCJ9'
t( frombase64url( msg64 ), msgtxt )

--ignore characters
t( frombase64url( "TW-Fu\n", "-\n" ), "Man" )

t()
