local commands = {
	install_setup = {
		description = "Installs a setup",
		usage = "install <package>",
		cmd = function(args)
			if args == nil or #args < 1 then
				print("Usage: install <setup1> [setup2] ...")
				return
			end

			local setup = require("src.setup")
			local valid_setups = {}

			for _, setup_name in ipairs(args) do
				if setup[setup_name] == nil then
					print("Unknown setup " .. setup_name)
				else
					table.insert(valid_setups, setup[setup_name])
				end
			end

			if #valid_setups == 0 then
				print("No valid setups found")
				return
			end

			local runner = require("src.runner")
			runner.run_setups(valid_setups)
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

	commands[command].cmd({ table.unpack(arg, 2, #arg) })
end

cmd(arg[1])
