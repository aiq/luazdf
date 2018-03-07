
local logline = require 'logline'
local tt = require 'taptest'

-- The checker: when verifing strings use pattern matchin
-- Otherwise fallback to ==
local function pcheck(got, exp)
  if type(exp) ~= type(got) then return false end
  if 'string' ~= type(got) then return (got == exp) end
  return (nil ~= got:match(exp))
end

-- Default log level is 25 a.k.a. ERROR
-- Only logline with smaller level will generate a message

tt( logline(10, 'test'), '|', pcheck )
tt( logline(25, 'test'), '|', pcheck )
tt( logline(26, 'test'), nil, pcheck )
tt( logline(99, 'test'), nil, pcheck )

-- Change log level
logline(60)
tt( logline(10, 'test'), '|', pcheck )
tt( logline(60, 'test'), '|', pcheck )
tt( logline(61, 'test'), nil, pcheck )
tt( logline(99, 'test'), nil, pcheck )

-- Symbolic log level name

logline('error')
tt( logline(25, 'test'),        '|', pcheck )
tt( logline(26, 'test'),        nil, pcheck )
tt( logline('error', 'test'),   '|', pcheck )
tt( logline('debug', 'test'),   nil, pcheck )
tt( logline('info', 'test'),    nil, pcheck )
tt( logline('verbose', 'test'), nil, pcheck )

logline('debug')
tt( logline(50, 'test'),        '|', pcheck )
tt( logline(51, 'test'),        nil, pcheck )
tt( logline('error', 'test'),   '|', pcheck )
tt( logline('debug', 'test'),   '|', pcheck )
tt( logline('info', 'test'),    nil, pcheck )
tt( logline('verbose', 'test'), nil, pcheck )

logline('info')
tt( logline(75, 'test'),        '|', pcheck )
tt( logline(76, 'test'),        nil, pcheck )
tt( logline('error', 'test'),   '|', pcheck )
tt( logline('debug', 'test'),   '|', pcheck )
tt( logline('info', 'test'),    '|', pcheck )
tt( logline('verbose', 'test'), nil, pcheck )

logline('verbose')
tt( logline(99, 'test'),        '|', pcheck )
tt( logline(100, 'test'),       nil, pcheck )
tt( logline('error', 'test'),   '|', pcheck )
tt( logline('debug', 'test'),   '|', pcheck )
tt( logline('info', 'test'),    '|', pcheck )
tt( logline('verbose', 'test'), '|', pcheck )

-- Message contains source position
tt( logline(99, 'test'), 'logline%.ex1%.lua:63', pcheck ) -- he line 63 is this one

-- In some case the caller source position is used:
-- - Tail calls
-- - Functions with names that start or end with 'log'

function wraplog(...) return logline(99, ...) end
function wraplogfakebarrier(...) return logline(99, ...) end
function wraplogbarrier(...)
  local res = logline(99, ...) -- line 72
  return res
end

tt( wraplog('test'),            'logline%.ex1%.lua:76', pcheck ) -- line 76
tt( wraplogfakebarrier('test'), 'logline%.ex1%.lua:77', pcheck ) -- line 77
tt( wraplogbarrier('test'),     'logline%.ex1%.lua:72', pcheck )

-- The argument are appended to the result string
tt( logline(99, 'a', 1), '| a | 1 | $', pcheck )

-- OTHER STUFF IN THE LOG: -- TODO : TEST ?
-- - date
-- - time
-- - os.clock() result
-- - incremental number
-- - log level of the line

print('# ' .. logline(80, 'ok'))

tt( )

