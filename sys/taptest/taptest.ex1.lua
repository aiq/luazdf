
-- taptest is both the "Unit under test" (uut) and the "Test framework" (tf)
local uut = require( "taptest" )
local tf = require( "taptest" )

-- To avoid confusion (as much as it is possible) tf will be always used in its
-- easest form: it just checks that the two argument are equals.
-- Since taptest always returns what it print on stdout, the returned
-- value of uut is checked

tf(
  uut( 1, 1 ),
  'ok 1' )

-- Note: since at each line two test will be done (one for uut and one for tf)
-- the test counter step is 2, not 1
tf(
  uut( 1, 1 ),
  'ok 3' )

-- Avoid literal line number in the test expectaion
local function srctag()
  local i = debug.getinfo(2)
  return i.source:match("[^/\\]*$") .. ':' .. (i.currentline-1)
end

-- Trick to mask the failing of uut in the stdout
local function mask_next_uut_failing_line()
  io.stdout:write('# uut line (ignore): ')
end

-- Additional infos when the test fails
mask_next_uut_failing_line()
tf(
  uut( 1, 2 ),
  'not ok 5 - '..srctag()..'. Expectation [2] does not match with [1]. ' )

-- Custom infos on fail
mask_next_uut_failing_line()
tf(
  uut( 1, 2, 'Not good!' ),
  'not ok 7 - '..srctag()..'. Expectation [2] does not match with [1]. Not good!' )

-- Custom compare function
tf(
  uut( 1, 2, function(a,b) return a < b end ),
  'ok 9' )
mask_next_uut_failing_line()
tf(
  uut( 2, 1, function(a,b) return a < b end ),
  'not ok 11 - '..srctag()..'. Expectation [1] does not match with [2]. ' )

-- Custom compare function and message
mask_next_uut_failing_line()
tf(
  uut( 2, 1, function(a,b) return a < b end, 'Not good!' ),
  'not ok 13 - '..srctag()..'. Expectation [1] does not match with [2]. Not good!' )
mask_next_uut_failing_line()
tf(
  uut( 2, 1, 'Not good!', function(a,b) return a < b end ),
  'not ok 15 - '..srctag()..'. Expectation [1] does not match with [2]. Not good!' )

-- Single argument = Tap diagnostic
tf(
  uut( 'new\nsuite' ),
  '#\n#########\n# new\n# suite' )

-- No argument = Summary and final plan
mask_next_uut_failing_line()
tf(
  uut( ),
  '#\n#########\n# 5 tests failed\n1..17' )

tf()

-- In case all the tests are successful, the line
-- # all is right
-- will be substitued to the '# 5 tests failed' one

