
-- taptest is both the "Unit under test" (uut) and the "Test framework" (tf)
local tf = require( "taptest" )
local uut = require( "taptest" )

-- To avoid confusion (as much as it is possible) tf will be always used in its
-- easest form: it just checks that the two argument are equals.
-- Since taptest always returns what it print on stdout, the returned
-- value of uut is checked

-- wrap the uut to avoid printing test results on the stdout
local fake_test_count = 1
local uut_wrapped = uut
local function uut(...)
  if 1< select('#', ...) then print('ok '..fake_test_count) end
  fake_test_count = fake_test_count + 2
  local _p = print
  print = function() end
  local result = uut_wrapped(...)
  print = _p
  return result 
end

tf(
  uut( 1, 1 ),
  'ok 1' )

-- Note: since at each line two test will be done (one for uut and one for tf)
-- the test counter step is 2, not 1
tf(
  uut( 1, 1 ),
  'ok 3' )

-- Additional infos when the test fails
tf(
  uut( 1, 2 ),
  'not ok 5 - taptest.ex1.lua:19. Expectation [2] does not match with [1]. ' )

-- Custom infos on fail
tf(
  uut( 1, 2, 'Not good!' ),
  'not ok 7 - taptest.ex1.lua:19. Expectation [2] does not match with [1]. Not good!' )

-- Custom compare function
tf(
  uut( 1, 2, function(a,b) return a < b end ),
  'ok 9' )
tf(
  uut( 2, 1, function(a,b) return a < b end ),
  'not ok 11 - taptest.ex1.lua:19. Expectation [1] does not match with [2]. ' )

-- Custom compare function and message
tf(
  uut( 2, 1, function(a,b) return a < b end, 'Not good!' ),
  'not ok 13 - taptest.ex1.lua:19. Expectation [1] does not match with [2]. Not good!' )
tf(
  uut( 2, 1, 'Not good!', function(a,b) return a < b end ),
  'not ok 15 - taptest.ex1.lua:19. Expectation [1] does not match with [2]. Not good!' )

-- Single argument = Tap diagnostic
tf(
  uut( 'new\nsuite' ),
  '#\n#########\n# new\n# suite' )

-- No argument = Summary and final plan
tf(
  uut( ),
  '#\n#########\n# 5 tests failed\n1..17' )

tf()

-- In case all the tests are successful, the line
-- # all is right
-- will be substitued to the '# 5 tests failed' one

