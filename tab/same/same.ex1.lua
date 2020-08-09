local t = require( "taptest" )
local same = require( "same" )

-- array
t( same( { "a", "b", "c" }, { "a", "b", "c" } ), true )

-- different sizes
t( same( { "a", "b" }, { "a", "b", "c" } ), false )
t( same( { "a", "b", "c" }, { "a", "c" } ), false )

-- different order
t( same( { "a", "c", "b" }, { "a", "b", "c" } ), false )

-- mixed values
t( same( { 13, false, "boom" }, { 13, false, "boom" } ), true )

-- dict
local tab = {
   name = "Alexander",
   hobbies = { "movies", "boardgames", "programming" },
   nicknames = {
      friends = "Sascha",
      parents = "Schurik"
   }
}
local other = {
   hobbies = { "movies", "boardgames", "programming" },
   nicknames = {
      friends = "Sascha",
      parents = "Schurik"
   },
   name = "Alexander"
}
t( same( tab, other ), true )

tab.hobbies = { "bowling", "dance" }
t( same( tab, other ), false )
tab.hobbies = { "movies", "boardgames", "programming" }
t( same( tab, other ), true )

other.name = "Sanja"
t( same( tab, other ), false )
other.name = "Alexander"
t( same( tab, other ), true )

t()
