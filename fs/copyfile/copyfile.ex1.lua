
local copyfile = require 'copyfile'
local r = require 'readfile'
local w = require 'writefile'
local t = require 'taptest'

local inpath = 'intmp.txt'
local outpath = 'outtmp.txt'
os.remove( inpath )
os.remove( outpath )

local data = ('01f'):rep(512)

w( inpath, data )
t( copyfile( inpath, outpath ), true )
t( r( outpath ), data )

t()

