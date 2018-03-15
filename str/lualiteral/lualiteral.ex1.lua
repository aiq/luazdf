local t = require "taptest"
local lualiteral = require "lualiteral"

-- Plain types
t( lualiteral( nil ), "nil" )
t( lualiteral( true ), "true" )
t( lualiteral( 1 ), "1" )
t( lualiteral( "ok" ), '"ok"' )

-- Table type
t( lualiteral( {} ), "{}" )
t( lualiteral( { false } ), "{[1]=false,}" )
t( lualiteral( { a = true } ), '{["a"]=true,}' )
t( lualiteral( { b = 'hi' } ), '{["b"]="hi",}' )
t( lualiteral( { c = 1 } ), '{["c"]=1,}' )
t( lualiteral( { d = {} } ), '{["d"]={},}' )

-- String quoting
local astr = '"\n\r\0'
t( lualiteral( astr ), string.format( "%q", astr ) )

-- Sub-table
t( lualiteral( { e = { f = true } } ), '{["e"]={["f"]=true,},}' )

-- Table key
t( lualiteral( { [ { k = "k" } ] = true } ), '{[{["k"]="k",}]=true,}' )

-- Same tables are exapande
local atab = { t = "t" }
t( lualiteral( { atab, atab } ), '{[1]={["t"]="t",},[2]={["t"]="t",},}' )

-- Table alias support
local alias = {}
alias[ atab ] = "X"
t( lualiteral( { atab, atab }, alias ), '{[1]=X,[2]=X,}' )

-- Mix example
atab = {
   a = "a",
   b = { "c", "d", { e = "f" } },
   [ { [ "g" ] = true } ] = { [true] = "h", },
   ["i"] = atab,
}
local recon = lualiteral( atab, alias )
local function patterncheck(a, b) return (nil ~= a:match(b)) end

t( recon, '%["a"%]="a",', patterncheck )
t( recon, '%["b"%]={%[1%]="c",%[2%]="d",%[3%]={%["e"%]="f",},},', patterncheck )
t( recon, '%[{%["g"%]=true,}%]={%[true%]="h",},', patterncheck )
t( recon, '%["i"%]=X,', patterncheck )

t()

