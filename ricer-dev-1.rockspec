package = "ricer"
version = "dev-1"
source = {
	url = "git+ssh://git@github.com/ogabriel/ricer-lua.git",
}
description = {
	homepage = "*** please enter a project homepage ***",
	license = "GNU General Public License v3.0",
}
dependencies = {
	"lua >= 5.1, < 5.5",
	"luastatic",
}
build = {
   type = "builtin",
   modules = {
      main = "main.lua"
   }
}
