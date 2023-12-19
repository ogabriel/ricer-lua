local commands = {
	install = {
		description = "Installs a package",
		usage = "install <package>",
		cmd = function(args)
			if args == nil or #args < 1 then
				print("Usage: install <package1> [package2] ...")
				return
			end
		end,
	},
	install_profile = {
		description = "Installs a profile",
		usage = "install_profile <profile>",
		cmd = function(args)
			--verify only one item on args
			if args == nil or #args ~= 1 then
				print("Usage: install_profile <profile>")
				return
			end
		end,
	},
}

function cmd(command)
	if command == nil then
		print("Usage: cmd <command> [arg]")
		return
	end

	if commands[command] == nil then
		print("Unknown command " .. command)
		return
	end

	commands[command].cmd(table.unpack(arg, 2, #arg))
end

cmd(arg[1])
