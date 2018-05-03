local test_count = 0
local fail_count = 0

--ZFUNC-taptest-v0
local function taptest( ... ) --> msg

   local function diagnostic( desc )
      local msg = "#\n#########\n# "..desc:gsub( "\n", "\n# " )
      print( msg )
      return msg
   end

   local function print_summary()
      local msg = ""
      if fail_count == 0 then
         msg = msg..diagnostic( "all is right" )
      else
         msg = msg..diagnostic( fail_count.." tests failed" )
      end
      local plan = "1.."..test_count
      print( plan )
      return msg.."\n"..plan
   end

   local function do_check(got, expected, a, b)

      -- Extra arg parse and defaults
      local checker, err
      if "string" == type(a) then err = a end
      if "string" == type(b) then err = b end
      if not err then err = "" end
      if "function" == type(a) then checker = a end
      if "function" == type(b) then checker = b end
      if not checker then checker = function( e, g ) return e == g end end

      -- Check the condition
      test_count = test_count + 1
      local ok, info = checker( got, expected )

      -- Generate TAP line
      local msg = ""
      if ok then
         msg = msg.."ok "..test_count
      else
         fail_count = fail_count + 1

         -- Find position in source
         local stackup = 2
         local i = debug.getinfo(stackup)
         while i.source == "=(tail call)" do
            stackup = stackup + 1
            i = debug.getinfo(stackup)
         end

         msg = msg
               .."not ok " .. test_count .. " - "
               ..i.source:match( "([^@/\\]*)$" )..":"..i.currentline..". "
               .."Expectation ["..tostring( expected ).."] "
               .."does not match with ["..tostring( got ).."]. "
               ..err
      end

      if info then msg = msg.." "..info end
      print(msg)
      return msg
   end

   local narg = select( "#", ... )
   if     0 == narg then return print_summary()
   elseif 1 == narg then return diagnostic( select( 1, ... ) )
   elseif 4 >= narg then return do_check( ... )
   end

   return nil, "Too many arguments"
end

return taptest
